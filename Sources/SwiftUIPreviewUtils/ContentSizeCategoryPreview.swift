import SwiftUI


#if DEBUG


public struct ContentSizeCategoryPreview<TargetView> where TargetView: View {
    let targetView: TargetView

    public var sizeCategories: [ContentSizeCategory]
    public var previewLayout: PreviewLayout


    // MARK: - Init
    public init(
        at sizeCategories: [ContentSizeCategory] = ContentSizeCategory.allCases,
        withLayout previewLayout: PreviewLayout = .sizeThatFits,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.sizeCategories = sizeCategories
        self.previewLayout = previewLayout
        self.targetView = content()
    }
    
    
    public init(
        at sizeCategories: ContentSizeCategory...,
        withLayout previewLayout: PreviewLayout = .sizeThatFits,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.init(
            at: sizeCategories,
            withLayout: previewLayout,
            content: content
        )
    }
}


// MARK: - View
extension ContentSizeCategoryPreview: View {
    
    public var body: some View {
        ForEach(sizeCategories, id: \.self) { sizeCategory in
            targetView
                .previewLayout(previewLayout)
                .environment(\.sizeCategory, sizeCategory)
                .previewDisplayName("Size Category: \(sizeCategory)")
        }
    }
}


// MARK: - View Modifier
extension View {

    public func previewInContentSizeCategories(
        _ sizeCategories: [ContentSizeCategory] = ContentSizeCategory.allCases,
        withLayout previewLayout: PreviewLayout = .sizeThatFits
    ) -> some View {
        ContentSizeCategoryPreview(at: sizeCategories) {
            self
        }
    }
    
    
    public func previewInContentSizeCategories(
        _ sizeCategories: ContentSizeCategory...,
        withLayout previewLayout: PreviewLayout = .sizeThatFits
    ) -> some View {
        previewInContentSizeCategories(
            sizeCategories,
            withLayout: previewLayout
        )
    }
}

#endif



struct ContentSizeCategoryPreview_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentSizeCategoryPreview {
            Text("Swift UI ⚡️")
        }
        
        ContentSizeCategoryPreview(at: .medium) {
            Text("Swift UI ⚡️")
        }
        
        
        Text("Swift UI ⚡️")
            .previewInContentSizeCategories(.medium, .extraSmall)
    }
}
