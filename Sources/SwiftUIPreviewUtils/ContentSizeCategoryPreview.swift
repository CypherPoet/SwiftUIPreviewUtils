import SwiftUI


#if DEBUG


public struct ContentSizeCategoryPreview<TargetView> where TargetView: View {
    let targetView: TargetView
    public var sizeCategories: [ContentSizeCategory]
    
    
    public init(
        at sizeCategories: [ContentSizeCategory] = ContentSizeCategory.allCases,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.sizeCategories = sizeCategories
        self.targetView = content()
    }
    
    
    public init(
        at sizeCategories: ContentSizeCategory...,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.sizeCategories = sizeCategories
        self.targetView = content()
    }
}


// MARK: - View
extension ContentSizeCategoryPreview: View {
    
    public var body: some View {
        ForEach(sizeCategories, id: \.self) { sizeCategory in
            targetView
                .previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, sizeCategory)
                .previewDisplayName("Size Category: \(sizeCategory)")
        }
    }
}


// MARK: - View Modifier
extension View {

    public func previewInContentSizeCategories(
        _ sizeCategories: [ContentSizeCategory] = ContentSizeCategory.allCases
    ) -> some View {
        ContentSizeCategoryPreview(at: sizeCategories) {
            self
        }
    }
    
    
    public func previewInContentSizeCategories(
        _ sizeCategories: ContentSizeCategory...
    ) -> some View {
        ContentSizeCategoryPreview(at: sizeCategories) {
            self
        }
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
