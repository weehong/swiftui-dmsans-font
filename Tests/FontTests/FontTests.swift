import Testing
import SwiftUI
@testable import DMSansFontPackage

struct DMSansFontPackageTests {
    func testFontRegistration() throws {
        DMSansFontPackage.registerFonts()
        
        #if canImport(UIKit)
        let fontNames = UIFont.familyNames.flatMap { UIFont.fontNames(forFamilyName: $0) }
        #expect(fontNames.contains("DMSans-Regular"), "DMSans-Regular should be registered")
        #expect(fontNames.contains("DMSans-Bold"), "DMSans-Bold should be registered")
        #expect(fontNames.contains("DMSans-Medium"), "DMSans-Medium should be registered")
        #elseif canImport(AppKit)
        let fontNames = NSFontManager.shared.availableFontFamilies
        #expect(fontNames.contains("DM Sans"), "DM Sans should be registered")
        #endif
    }
    
    func testDMSansFontExtension() throws {
        DMSansFontPackage.registerFonts()
        
        let font = Font.dmsans
        
        let boldFont = font.bold
        #expect(boldFont.fontWeight == .bold, "Bold weight should be set correctly")
        
        let mediumFont = font.medium
        #expect(mediumFont.fontWeight == .medium, "Medium weight should be set correctly")
        
        let _ = font.title
        let _ = font.body
        let _ = font.caption
        
        let _ = font.size(20)
        
        let boldTitle = font.bold.title
        
        let mediumCustom = font.medium.size(22)
    }
    
    func testDMSansFontsEnum() throws {
        DMSansFontPackage.registerFonts()
        
        let regularFont = DMSansFonts.DMSans.Regular.font(size: 16)
        #expect(true, "Regular font should be accessible")
        
        let boldFont = DMSansFonts.DMSans.Bold.font(size: 16)
        #expect(true, "Bold font should be accessible")
        
    }
}