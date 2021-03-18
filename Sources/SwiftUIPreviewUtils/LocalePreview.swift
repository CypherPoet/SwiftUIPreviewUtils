import SwiftUI


#if DEBUG


public struct LocalePreview<TargetView> where TargetView: View {
    let targetView: TargetView
    public var locales: [Locale]
    
    
    public init(
        in locales: [Locale] = Locale.allSupported,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.locales = locales
        self.targetView = content()
    }
    
    
    public init(
        in locales: Locale...,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.locales = locales
        self.targetView = content()
    }
}


// MARK: - View
extension LocalePreview: View {
    
    public var body: some View {
        ForEach(locales, id: \.self) { locale in
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
        LocalePreview(in: locales) {
            self
        }
    }
    
    
    public func previewInLocales(
        _ locales: Locale...
    ) -> some View {
        LocalePreview(in: locales) {
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
        
        LocalePreview(in: Locale.autoupdatingCurrent) {
            Text("Swift UI ⚡️")
        }
        
        
        Text("Swift UI ⚡️")
            .previewInLocales(Locale.allSupported)
        
        
        Text("Swift UI ⚡️")
            .previewInLocales(.autoupdatingCurrent)
        
    }
}
