import SwiftUI


#if DEBUG


public struct ComponentPreview<Component> where Component: View {
    public var displayName: String?
    public var component: Component

    
    public init(
        displayName: String? = nil,
        @ViewBuilder content: @escaping () -> Component
    ) {
        self.displayName = displayName
        self.component = content()
    }
}


// MARK: - View
extension ComponentPreview: View {
    
    public var body: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            ForEach(ContentSizeCategory.smallestAndLargest, id: \.self) { category in
                component
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
        displayName: String? = nil
    ) -> some View {
        ComponentPreview(displayName: displayName) {
            self
        }
    }
}

#endif



struct ComponentPreview_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            Text("Hello, World!")
                .previewAsComponent(displayName: "Text View")
            
            ComponentPreview(displayName: "Text View 2") {
                Text("Swift UI ⚡️")
            }
        }
    }
}
