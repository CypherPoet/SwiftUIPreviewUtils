import SwiftUI


#if DEBUG

extension PreviewLayout {
    
    /// Helper type for manually simulating landscape-mode previews,
    /// since this is [not yet supported directly](https://developer.apple.com/forums/thread/126332).
    ///
    /// Feel free to extend this with your own constants!
    /// Size references can be found
    /// [here](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/adaptivity-and-layout).
    public struct Landscape {
        
        // MARK: - iPhone SE
        public static let iPhoneSE4Inch = PreviewLayout.fixed(width: 568, height: 320)
        public static let iPhoneSE4Point7Inch = PreviewLayout.fixed(width: 667, height: 375)


        // MARK: - iPhone 8
        public static let iPhone8 = PreviewLayout.fixed(width: 667, height: 375)
        public static let iPhone8Plus = PreviewLayout.fixed(width: 736, height: 414)
        
        
        // MARK: - iPhone 11
        public static let iPhone11 = PreviewLayout.fixed(width: 896, height: 414)
        public static let iPhone11Pro = PreviewLayout.fixed(width: 812, height: 375)
        public static let iPhone11ProMax = PreviewLayout.fixed(width: 896, height: 414)
        
        
        // MARK: - iPhone 12
        public static let iPhone12 = PreviewLayout.fixed(width: 844, height: 390)
        public static let iPhone12Pro = PreviewLayout.fixed(width: 844, height: 390)
        public static let iPhone12ProMax = PreviewLayout.fixed(width: 926, height: 428)
        public static let iPhone12Mini = PreviewLayout.fixed(width: 812, height: 375)
        

        // MARK: - iPad Pro
        public static let iPadPro9Point7Inch = PreviewLayout.fixed(width: 1024, height: 768)
        public static let iPadPro10Point5Inch = PreviewLayout.fixed(width: 1194, height: 834)
        public static let iPadPro11Inch = PreviewLayout.fixed(width: 1194, height: 834)
        public static let iPadPro12Point9Inch = PreviewLayout.fixed(width: 1366, height: 1024)
    }
}


#endif



struct PreviewLayout_Landscape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Text("Hello, World!")
                .previewLayout(.Landscape.iPhone12ProMax)
            
            Text("Hello, World!")
                .previewLayout(.Landscape.iPhone12Mini)
            
            Text("Hello, World!")
                .previewLayout(.Landscape.iPadPro12Point9Inch)
        }
    }
}
