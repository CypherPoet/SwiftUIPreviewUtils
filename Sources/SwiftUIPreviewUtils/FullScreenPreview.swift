import SwiftUI


#if DEBUG


@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
public struct FullScreenPreview<TargetView> where TargetView: View {
    public var targetView: TargetView
    public var devices: [PreviewDevice]
}


extension FullScreenPreview: View {
    
    private var bodyContent: some View {
        ForEach(devices, id: \.self.rawValue) { device in
            ForEach(ColorScheme.allCases, id: \.self) { scheme in
                NavigationView {
                    targetView
                        .navigationTitle("")
                }
                .previewDevice(device)
                .colorScheme(scheme)
                .previewDisplayName("\(scheme.previewName): \(device.rawValue)")
            }
        }
    }
    
    
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


extension View {
    
    @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
    public func previewAsScreen(
        on devices: PreviewDevice...
    ) -> some View {
        FullScreenPreview(targetView: self, devices: devices)
    }
    
    
    @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
    public func previewAsScreen(
        on devices: [PreviewDevice] = [
            .iPhoneSE2,
            .iPhone12,
            .iPhone12Pro,
            .iPhone12Mini,
            .iPadPro12Point9Inch,
            .watchSeriesSix40mm,
        ]
    ) -> some View {
        FullScreenPreview(targetView: self, devices: devices)
    }
}

#endif



struct FullScreenPreview_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .previewAsScreen(on: .iPadPro11Inch, .iPhone8, .watchSeriesSix40mm)
    }
}
