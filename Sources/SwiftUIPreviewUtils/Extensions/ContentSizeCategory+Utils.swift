#if DEBUG

import SwiftUI


extension ContentSizeCategory {
    public static let smallestAndLargest = [allCases.first!, allCases.last!]


    public var previewName: String {
        if self == Self.smallestAndLargest.first {
            return "Smallest Content Size"
        }

        if self == Self.smallestAndLargest.last {
            return "Largest Content Size"
        }

        return String(describing: self)
    }
}

#endif
