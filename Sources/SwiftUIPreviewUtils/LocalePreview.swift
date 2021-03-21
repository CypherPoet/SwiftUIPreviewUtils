import SwiftUI


#if DEBUG


public struct LocalePreview<TargetView> where TargetView: View {
    let targetView: TargetView
    
    public var locales: [Locale]
    public var previewLayout: PreviewLayout

    
    // MARK: - Init
    public init(
        in locales: [Locale] = Locale.allSupported,
        withLayout previewLayout: PreviewLayout = .sizeThatFits,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.locales = locales
        self.previewLayout = previewLayout
        self.targetView = content()
    }
    
    
    public init(
        in locales: Locale...,
        withLayout previewLayout: PreviewLayout = .sizeThatFits,
        @ViewBuilder content: @escaping () -> TargetView
    ) {
        self.init(
            in: locales,
            withLayout: previewLayout,
            content: content
        )
    }
}


// MARK: - View
extension LocalePreview: View {
    
    public var body: some View {
        ForEach(locales, id: \.self) { locale in
            targetView
                .previewLayout(previewLayout)
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
        _ locales: [Locale] = Locale.allSupported,
        withLayout previewLayout: PreviewLayout = .sizeThatFits
    ) -> some View {
        LocalePreview(in: locales, withLayout: previewLayout) {
            self
        }
    }
    
    
    public func previewInLocales(
        _ locales: Locale...,
        withLayout previewLayout: PreviewLayout = .sizeThatFits
    ) -> some View {
        previewInLocales(locales, withLayout: previewLayout)
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
