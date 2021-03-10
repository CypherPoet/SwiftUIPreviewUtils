import SwiftUI


#if DEBUG

public struct OpenedFromNavigationLinkViewModifier {
    @State private var isActive: Bool
    
    public init(
        startsActive: Bool = true
    ) {
        self._isActive = .init(initialValue: startsActive)
    }
}


extension OpenedFromNavigationLinkViewModifier: ViewModifier {
    
    public func body(content: Content) -> some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: content,
                    isActive: $isActive,
                    label: {
                        Text("Navigate to View")
                    }
                )
            }
            .navigationTitle("SwiftUI Previews ⚡️")
        }
    }
}

extension View {
    
    public func openedFromNavigationLink(startsActive: Bool = true) -> some View {
        modifier(
            OpenedFromNavigationLinkViewModifier(
                startsActive: startsActive
            )
        )
    }
}


#endif



struct OpenedFromNavigationLinkViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Text("Hello, World!")
                .openedFromNavigationLink()
            
            Text("Hello, World!")
                .openedFromNavigationLink(startsActive: false)
        }
    }
}
