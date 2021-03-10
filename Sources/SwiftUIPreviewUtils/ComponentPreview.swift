import SwiftUI


#if DEBUG


public struct ComponentPreview<Component: View> {
    public var component: Component
    public var displayName: String?
}


// MARK: - View
extension ComponentPreview: View {
    public var body: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            ForEach(ContentSizeCategory.smallestAndLargest, id: \.self) { category in
                self.component
                    .previewLayout(.sizeThatFits)
                    .preferredColorScheme(colorScheme)
                    .environment(\.sizeCategory, category)
                    .previewDisplayName(
                        displayName ?? "\(colorScheme.previewName) + \(category.previewName)"
                    )
            }
        }
    }
}


extension View {

    public func previewAsComponent(
        displayName: String?
    ) -> some View {
        ComponentPreview(
            component: self,
            displayName: displayName
        )
    }
}

#endif



struct ComponentPreview_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .previewAsComponent(displayName: "Text View")
    }
}
