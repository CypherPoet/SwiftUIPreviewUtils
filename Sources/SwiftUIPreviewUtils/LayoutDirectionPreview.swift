import SwiftUI


#if DEBUG


public struct LayoutDirectionPreview<TargetView> where TargetView: View {
    let targetView: TargetView
    public var layoutDirections: [LayoutDirection]
    
    
    public init(
        in directions: [LayoutDirection] = LayoutDirection.allCases,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.layoutDirections = directions
        self.targetView = content()
    }
    
    
    public init(
        in directions: LayoutDirection...,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.layoutDirections = directions
        self.targetView = content()
    }
}


// MARK: - View
extension LayoutDirectionPreview: View {
    
    public var body: some View {
        ForEach(layoutDirections, id: \.self) { layoutDirection in
            targetView
                .previewLayout(.sizeThatFits)
                .environment(\.layoutDirection, layoutDirection)
                .previewDisplayName("Layout Direction: \(layoutDirection)")
        }
    }
}


extension View {

    public func previewInLayoutDirections(
        _ layoutDirections: [LayoutDirection] = LayoutDirection.allCases
    ) -> some View {
        LayoutDirectionPreview(in: layoutDirections) {
            self
        }
    }
    
    
    public func previewInLayoutDirections(
        _ layoutDirections: LayoutDirection...
    ) -> some View {
        LayoutDirectionPreview(in: layoutDirections) {
            self
        }
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
