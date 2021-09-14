import SwiftUI


public struct ComponentPreview<Component: View> {

    @ViewBuilder
    public var component: () -> Component


    public init(
        component: @escaping () -> Component
    ) {
        self.component = component
    }
}


// MARK: - View
extension ComponentPreview: View {

    public var body: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            ForEach(ContentSizeCategory.smallestAndLargest, id: \.self) { category in
                component()
                    .previewLayout(.sizeThatFits)
                    .preferredColorScheme(colorScheme)
                    .environment(\.sizeCategory, category)
                    .previewDisplayName("\(colorScheme.previewName) + \(category.previewName)")
            }
        }
    }
}


// MARK: - ContentSizeCategory + previewName
private extension ContentSizeCategory {

    var previewName: String {
        switch self {
        case Self.smallestAndLargest.first:
            return "Smallest Content Size"
        case Self.smallestAndLargest.last:
            return "Largest Content Size"
        default:
            return String(describing: self)
        }
    }
}



// MARK: - View Modifier
extension View {

    public func previewAsComponent() -> some View {
        ComponentPreview {
            self
        }
    }
}



#if DEBUG

struct ComponentPreview_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            Text("Hello, World!")
                .previewAsComponent()

            ComponentPreview {
                Text("Swift UI ⚡️")
            }
        }
    }
}


#endif
