import SwiftUI


#if DEBUG


public struct FullScreenPreview<TargetView> where TargetView: View {
    public var devices: [PreviewDevice]
    public var isInsideNavigationView: Bool
    public var navigationTitle: String?
    public var targetView: TargetView
    
    
    // MARK: - Init
    public init(
        on devices: [PreviewDevice] = [.iPhone12],
        isInsideNavigationView: Bool = false,
        navigationTitle: String? = nil,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.devices = devices
        self.isInsideNavigationView = isInsideNavigationView
        self.navigationTitle = navigationTitle
        self.targetView = content()
    }
    
    
    public init(
        on devices: PreviewDevice...,
        isInsideNavigationView: Bool = false,
        navigationTitle: String? = nil,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.init(
            on: devices,
            isInsideNavigationView: isInsideNavigationView,
            navigationTitle: navigationTitle,
            content: content
        )
    }
}


extension FullScreenPreview: View {
    
    public var body: some View {
        #if os(iOS)
        
        return bodyContent
            .navigationViewStyle(StackNavigationViewStyle())
        
        #else
        
        return bodyContent
            .navigationViewStyle(DefaultNavigationViewStyle())
        
        #endif
    }
}


// MARK: - View Content Builders
extension FullScreenPreview {
    
    private var bodyContent: some View {
        ForEach(devices, id: \.self.rawValue) { device in
            ForEach(ColorScheme.allCases, id: \.self) { scheme in
                Group {
                    if isInsideNavigationView {
                        NavigationView {
                            targetView
                        }
                    } else {
                        targetView
                    }
                }
                .navigationTitle(navigationTitle ?? "\(scheme.previewName): \(device.rawValue)")
                .previewDevice(device)
                .colorScheme(scheme)
                .previewDisplayName("\(scheme.previewName): \(device.rawValue)")
            }
        }
    }
}


// MARK: - View Extensions
extension View {
    
    public func previewAsScreen(
        on devices: [PreviewDevice] = [
            .iPhoneSE2,
            .iPhone12,
            .iPhone12Pro,
            .iPhone12Mini,
            .iPadPro12Point9Inch,
            .watchSeriesSix40mm,
        ],
        isInsideNavigationView: Bool = false,
        navigationTitle: String? = nil
    ) -> some View {
        FullScreenPreview(
            on: devices,
            isInsideNavigationView: isInsideNavigationView,
            navigationTitle: navigationTitle
        ) {
            self
        }
    }
    
    
    public func previewAsScreen(
        on devices: PreviewDevice...,
        isInsideNavigationView: Bool = false,
        navigationTitle: String? = nil
    ) -> some View {
        previewAsScreen(
            on: devices,
            isInsideNavigationView: isInsideNavigationView,
            navigationTitle: navigationTitle
        )
    }
    
}

#endif



struct FullScreenPreview_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .previewAsScreen(on: .iPadPro11Inch, .iPhone8, .watchSeriesSix40mm,  isInsideNavigationView: true)
        
        //
        //        FullScreenPreview {
        //            Text("Swift UI ⚡️")
        //        }
        //
        //        FullScreenPreview(isInsideNavigationView: true) {
        //            Text("Swift UI ⚡️")
        //        }
        //
        //        FullScreenPreview(on: .iPadPro11Inch, .iPhone8, .watchSeriesSix40mm) {
        //            Text("Swift UI ⚡️")
        //        }
        
    }
}
