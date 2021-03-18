import SwiftUI


#if DEBUG


public struct ColorSchemePreview<TargetView> where TargetView: View {
    let targetView: TargetView
    public var colorSchemes: [ColorScheme]
    
    
    public init(
        in colorSchemes: [ColorScheme] = ColorScheme.allCases,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.colorSchemes = colorSchemes
        self.targetView = content()
    }
    
    
    public init(
        in colorSchemes: ColorScheme...,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.colorSchemes = colorSchemes
        self.targetView = content()
    }
}


// MARK: - View
extension ColorSchemePreview: View {
    
    public var body: some View {
        ForEach(colorSchemes, id: \.self) { colorScheme in
            targetView
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(colorScheme)
                .previewDisplayName("Color Scheme: \(colorScheme)")
        }
    }
}


extension View {

    public func previewInColorSchemes(
        _ colorSchemes: [ColorScheme] = ColorScheme.allCases
    ) -> some View {
        ColorSchemePreview(in: colorSchemes) {
            self
        }
    }
    
    
    public func previewInColorSchemes(
        _ colorSchemes: ColorScheme...
    ) -> some View {
        ColorSchemePreview(in: colorSchemes) {
            self
        }
    }
}

#endif



struct ColorSchemePreview_Previews: PreviewProvider {
    
    static var previews: some View {
        ColorSchemePreview {
            Text("Swift UI ⚡️")
        }
        
        ColorSchemePreview(in: .dark) {
            Text("Swift UI ⚡️")
        }
        
        Text("Swift UI ⚡️")
            .previewInColorSchemes()
        
        Text("Swift UI ⚡️")
            .previewInColorSchemes(.dark, .light)
        
        Text("Swift UI ⚡️")
            .previewInColorSchemes([.dark, .light])
        
    }
}
