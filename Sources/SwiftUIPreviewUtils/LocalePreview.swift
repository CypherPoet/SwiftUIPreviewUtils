import SwiftUI


#if DEBUG


public struct LocalePreview<TargetView> where TargetView: View {
    public var locales: [Locale]
    let targetView: TargetView
    
    
    public init(
        locales: [Locale] = Locale.allSupported,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.locales = locales
        self.targetView = content()
    }
}


// MARK: - View
extension LocalePreview: View {
    
    public var body: some View {
        ForEach(Locale.allSupported, id: \.self) { locale in
            targetView
                .previewLayout(.sizeThatFits)
                .environment(\.locale, locale)
                .previewDisplayName("Locale: \(locale.identifier)")
        }
    }
}


extension Locale {
    
    public static let allSupported = Bundle
        .main.localizations
        .map(Locale.init)
        .filter { $0.identifier != "base" }
}


extension View {

    public func previewInLocales(
        _ locales: [Locale] = Locale.allSupported
    ) -> some View {
        LocalePreview(locales: locales) {
            self
        }
    }
}

#endif



struct LocalePreview_Previews: PreviewProvider {
    
    static var previews: some View {
        LocalePreview {
            Text("Swift UI ⚡️")
        }
    }
}
