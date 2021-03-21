import SwiftUI


#if DEBUG


public struct ColorSchemePreview<TargetView> where TargetView: View {
    let targetView: TargetView
    
    public var colorSchemes: [ColorScheme]
    public var previewLayout: PreviewLayout
    
    
    // MARK: - Init
    public init(
        in colorSchemes: [ColorScheme] = ColorScheme.allCases,
        withLayout previewLayout: PreviewLayout = .sizeThatFits,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.colorSchemes = colorSchemes
        self.previewLayout = previewLayout
        self.targetView = content()
    }
    
    
    public init(
        in colorSchemes: ColorScheme...,
        withLayout previewLayout: PreviewLayout = .sizeThatFits,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.init(
            in: colorSchemes,
            withLayout: previewLayout,
            content: content
        )
    }
}


// MARK: - View
extension ColorSchemePreview: View {
    
    public var body: some View {
        ForEach(colorSchemes, id: \.self) { colorScheme in
            targetView
                .previewLayout(previewLayout)
                .preferredColorScheme(colorScheme)
                .previewDisplayName("Color Scheme: \(colorScheme)")
        }
    }
}


extension View {

    public func previewInColorSchemes(
        _ colorSchemes: [ColorScheme] = ColorScheme.allCases,
        withLayout previewLayout: PreviewLayout = .sizeThatFits
    ) -> some View {
        ColorSchemePreview(in: colorSchemes, withLayout: previewLayout) {
            self
        }
    }
    
    
    public func previewInColorSchemes(
        _ colorSchemes: ColorScheme...,
        withLayout previewLayout: PreviewLayout = .sizeThatFits
    ) -> some View {
        previewInColorSchemes(colorSchemes, withLayout: previewLayout)
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
        
        ColorSchemePreview(in: .dark, withLayout: .device) {
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
