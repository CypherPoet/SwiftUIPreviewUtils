import SwiftUI


#if DEBUG


extension ColorScheme {

    public var previewName: String {
        String(describing: self).capitalized
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
