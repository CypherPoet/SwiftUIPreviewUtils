import SwiftUI


#if DEBUG


extension ColorScheme {

    public var previewName: String {
        switch self {
        case .light:
            return "Light Mode"
        case .dark:
            return "Dark Mode"
        @unknown default:
            return "\(String(describing: self).capitalized) Mode"
        }
    }
}

#endif


struct ColorScheme_PreviewName_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .preferredColorScheme(.dark)
            .previewDisplayName(ColorScheme.dark.previewName)
    }
}
