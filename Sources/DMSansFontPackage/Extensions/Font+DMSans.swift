import SwiftUI

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

// MARK: - Font Definitions

public enum DMSansFonts {
    public enum DMSans {
        case black
        case extraBold
        case bold
        case semiBold
        case medium
        case regular
        case light
        case extraLight
        case thin
        
        public func font(size: CGFloat) -> Font {
            let fontName: String
            switch self {
            case .black: fontName = "DMSans-Black"
            case .extraBold: fontName = "DMSans-ExtraBold"
            case .bold: fontName = "DMSans-Bold"
            case .semiBold: fontName = "DMSans-SemiBold"
            case .medium: fontName = "DMSans-Medium"
            case .regular: fontName = "DMSans-Regular"
            case .light: fontName = "DMSans-Light"
            case .extraLight: fontName = "DMSans-ExtraLight"
            case .thin: fontName = "DMSans-Thin"
            }
            
            #if canImport(UIKit)
            if UIFont(name: fontName, size: size) != nil {
                return .custom(fontName, size: size)
            }
            #elseif canImport(AppKit)
            if NSFont(name: fontName, size: size) != nil {
                return .custom(fontName, size: size)
            }
            #endif
            
            // Fallback to system font with similar weight if custom font not found
            let systemWeight: Font.Weight
            switch self {
            case .black: systemWeight = .black
            case .extraBold: systemWeight = .heavy
            case .bold: systemWeight = .bold
            case .semiBold: systemWeight = .semibold
            case .medium: systemWeight = .medium
            case .regular: systemWeight = .regular
            case .light: systemWeight = .light
            case .extraLight: systemWeight = .ultraLight
            case .thin: systemWeight = .thin
            }
            
            return .system(size: size, weight: systemWeight)
        }
    }
}

// MARK: - Font Extension

public extension SwiftUI.Font {
    struct DMSans: Sendable {
        public var fontWeight: SwiftUI.Font.Weight = .regular
        public var fontSize: CGFloat = 16
        
        public var asFont: SwiftUI.Font {
            fontWithCurrentWeight(size: fontSize)
        }

        // Size presets
        public var title: SwiftUI.Font { fontWithCurrentWeight(size: 24) }
        public var headline: SwiftUI.Font { fontWithCurrentWeight(size: 18) }
        public var body: SwiftUI.Font { fontWithCurrentWeight(size: 16) }
        public var callout: SwiftUI.Font { fontWithCurrentWeight(size: 14) }
        public var caption: SwiftUI.Font { fontWithCurrentWeight(size: 12) }
        public var footnote: SwiftUI.Font { fontWithCurrentWeight(size: 10) }

        public func size(_ size: CGFloat) -> SwiftUI.Font {
            fontWithCurrentWeight(size: size)
        }

        private func fontWithCurrentWeight(size: CGFloat) -> SwiftUI.Font {
            switch fontWeight {
            case .black: return DMSansFonts.DMSans.black.font(size: size)
            case .heavy: return DMSansFonts.DMSans.extraBold.font(size: size)
            case .bold: return DMSansFonts.DMSans.bold.font(size: size)
            case .semibold: return DMSansFonts.DMSans.semiBold.font(size: size)
            case .medium: return DMSansFonts.DMSans.medium.font(size: size)
            case .regular: return DMSansFonts.DMSans.regular.font(size: size)
            case .light: return DMSansFonts.DMSans.light.font(size: size)
            case .ultraLight: return DMSansFonts.DMSans.extraLight.font(size: size)
            case .thin: return DMSansFonts.DMSans.thin.font(size: size)
            default: return DMSansFonts.DMSans.regular.font(size: size)
            }
        }
    }

    static var dmsans: DMSans { DMSans() }
}

// MARK: - Weight Modifiers

public extension SwiftUI.Font.DMSans {
    var black: Self { modified(.black) }
    var bold: Self { modified(.bold) }
    var semibold: Self { modified(.semibold) }
    var medium: Self { modified(.medium) }
    var regular: Self { modified(.regular) }
    var light: Self { modified(.light) }
    var thin: Self { modified(.thin) }
    var extraLight: Self { modified(.ultraLight) }
    
    private func modified(_ weight: Font.Weight) -> Self {
        var copy = self
        copy.fontWeight = weight
        return copy
    }
}