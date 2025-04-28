import SwiftUI

public enum DMSansFontPackage {
    public static func registerFonts() {
        registerFont(
            bundle: .module,
            fontName: "DMSans-Black",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-BlackItalic",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-Bold",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-BoldItalic",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-ExtraBold",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-ExtraBoldItalic",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-ExtraLight",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-ExtraLightItalic",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-Italic",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-Light",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-LightItalic",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-Medium",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-MediumItalic",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-Regular",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-SemiBold",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-SemiBoldItalic",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-Thin",
            fontExtension: "ttf"
        )
        registerFont(
            bundle: .module,
            fontName: "DMSans-ThinItalic",
            fontExtension: "ttf"
        )
    }

    private static func registerFont(
        bundle: Bundle,
        fontName: String,
        fontExtension: String
    ) {
        guard let fontURL = bundle.url(
            forResource: fontName,
            withExtension: fontExtension
        ),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let font = CGFont(fontDataProvider)
        else {
            print("Failed to register font: \(fontName).\(fontExtension)")
            return
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(
            font,
            &error
        ) {
            print("Failed to register font: \(fontName).\(fontExtension)")
        }
    }
}
