import SwiftUI


#if DEBUG


public struct LayoutDirectionPreview<TargetView> where TargetView: View {
    let targetView: TargetView
    
    public var layoutDirections: [LayoutDirection]
    public var previewLayout: PreviewLayout

    
    // MARK: - Init
    public init(
        in directions: [LayoutDirection] = LayoutDirection.allCases,
        withPreviewLayout previewLayout: PreviewLayout = .sizeThatFits,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.layoutDirections = directions
        self.previewLayout = previewLayout
        self.targetView = content()
    }
    
    
    public init(
        in directions: LayoutDirection...,
        withPreviewLayout previewLayout: PreviewLayout = .sizeThatFits,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.init(
            in: directions,
            withPreviewLayout: previewLayout,
            content: content
        )
    }
}


// MARK: - View
extension LayoutDirectionPreview: View {
    
    public var body: some View {
        ForEach(layoutDirections, id: \.self) { layoutDirection in
            targetView
                .previewLayout(previewLayout)
                .environment(\.layoutDirection, layoutDirection)
                .previewDisplayName("Layout Direction: \(layoutDirection)")
        }
    }
}


extension View {

    public func previewInLayoutDirections(
        _ layoutDirections: [LayoutDirection] = LayoutDirection.allCases,
        withPreviewLayout previewLayout: PreviewLayout = .sizeThatFits
    ) -> some View {
        LayoutDirectionPreview(
            in: layoutDirections,
            withPreviewLayout: previewLayout
        ) {
            self
        }
    }
    
    
    public func previewInLayoutDirections(
        _ layoutDirections: LayoutDirection...,
        withPreviewLayout previewLayout: PreviewLayout = .sizeThatFits
    ) -> some View {
        previewInLayoutDirections(
            layoutDirections,
            withPreviewLayout: previewLayout
        )
    }
}

#endif



struct LayoutDirectionPreview_Previews: PreviewProvider {
    
    static var previews: some View {
        LayoutDirectionPreview {
            Label("Swift UI", systemImage: "sparkles")
        }
        
        LayoutDirectionPreview(in: .rightToLeft) {
            Label("Swift UI", systemImage: "sparkles")
        }
        
        
        Label("Swift UI", systemImage: "sparkles")
            .previewInLayoutDirections()
        
        
        Label("Swift UI", systemImage: "sparkles")
            .previewInLayoutDirections(.rightToLeft)
        
    }
}
