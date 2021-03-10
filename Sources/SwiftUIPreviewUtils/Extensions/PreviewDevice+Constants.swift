import SwiftUI


//
// 📝 Feel free to make your own constants!
//
// To list all supported device names on your machine, run
// `xcrun simctl list devicetypes` from the terminal.
//
// 🔗 https://developer.apple.com/documentation/swiftui/list/previewdevice(_:)



extension PreviewDevice {

    // MARK: - iPhone SE
    public static let iPhoneSE2 = PreviewDevice(rawValue: "iPhone SE (2nd generation)")


    // MARK: - iPhone 8
    public static let iPhone8 = PreviewDevice(rawValue: "iPhone 8")
    public static let iPhone8Plus = PreviewDevice(rawValue: "iPhone 8 Plus")
    
    
    // MARK: - iPhone 11
    public static let iPhone11 = PreviewDevice(rawValue: "iPhone 11")
    public static let iPhone11Pro = PreviewDevice(rawValue: "iPhone 11 Pro")
    public static let iPhone11ProMax = PreviewDevice(rawValue: "iPhone 11 Pro Max")
    
    
    // MARK: - iPhone 12
    public static let iPhone12 = PreviewDevice(rawValue: "iPhone 12")
    public static let iPhone12Pro = PreviewDevice(rawValue: "iPhone 12 Pro")
    public static let iPhone12ProMax = PreviewDevice(rawValue: "iPhone 12 Pro Max")
    public static let iPhone12Mini = PreviewDevice(rawValue: "iPhone 12 Mini")
    

    // MARK: - iPad Pro
    public static let iPadPro9Point7Inch = PreviewDevice(rawValue: "iPad Pro (9.7-inch)")
    public static let iPadPro11Inch = PreviewDevice(rawValue: "iPad Pro (11-inch) (2nd generation)")
    public static let iPadPro12Point9Inch = PreviewDevice(rawValue: "iPad Pro (12.9-inch) (4th generation)")
    

    // MARK: - Apple Watch SE
    public static let watchSE40mm = PreviewDevice(rawValue: "Apple Watch SE - 40mm")
    
    
    // MARK: - Apple Watch Series 6
    public static let watchSeriesSix40mm = PreviewDevice(rawValue: "Apple Watch Series 6 - 40mm")
}
