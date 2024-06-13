import Foundation
import UIKit

public struct DisplaySize {
    public static let iphone4        = CGSize(width: 320, height: 480)
    public static let iphone5        = CGSize(width: 320, height: 568)
    public static let iphone6        = CGSize(width: 375, height: 667)
    public static let iphone6plus    = CGSize(width: 414, height: 736)
    public static let iphone7        = CGSize(width: 375, height: 667)
    public static let iphone8        = CGSize(width: 375, height: 667)
    public static let iphoneX        = CGSize(width: 375, height: 812)
    public static let iphoneXR       = CGSize(width: 414, height: 896)
    public static let iphone12Mini   = CGSize(width: 360, height: 780)
    public static let iphone12       = CGSize(width: 390, height: 844)
    public static let iphone12ProMax = CGSize(width: 428, height: 926)
    public static let iphone13Mini   = CGSize(width: 360, height: 780)
    public static let iphone13       = CGSize(width: 390, height: 844)
    public static let iphone13ProMax = CGSize(width: 428, height: 926)
    public static let iphone14       = CGSize(width: 390, height: 844)
    public static let iphone14Pro    = CGSize(width: 393, height: 852)
    public static let iphone14ProMax = CGSize(width: 430, height: 932)
    public static let unknown        = CGSize.zero
}

public enum DisplayType {
    case unknown
    case iphone4
    case iphone5
    case iphone6
    case iphone6plus
    case iphone7
    case iphone8
    case iphoneX
    case iphoneXR
    case iphone12Mini
    case iphone12
    case iphone12ProMax
    case iphone13Mini
    case iphone13
    case iphone13ProMax
    case iphone14
    case iphone14Pro
    case iphone14ProMax
    case ipad9
    case ipad10
    case ipad12
}

public enum Display {
    public static var width         : CGFloat { return UIScreen.main.bounds.size.width }
    public static var height        : CGFloat { return UIScreen.main.bounds.size.height }
    public static var maxLength     : CGFloat { return max(width, height) }
    public static var minLength     : CGFloat { return min(width, height) }
    public static var zoomed        : Bool { return UIScreen.main.nativeScale >= UIScreen.main.scale }
    public static var retina        : Bool { return UIScreen.main.scale >= 2.0 }
    public static var phone         : Bool { return UIDevice.current.userInterfaceIdiom == .phone }
    public static var pad           : Bool { return UIDevice.current.userInterfaceIdiom == .pad }
    
    public static var navbarSize : CGFloat {
        return (Display.height == 812 || Display.height == 896) ? 88 : 64
    }
    public static var bottombarSize : CGFloat {
        return (Display.height == 812 || Display.height == 896) ? 34 : 0
    }
    
    public static var displayType: DisplayType {
        if phone && maxLength < 568 {
            return .iphone4
        } else if phone && maxLength == 568 {
            return .iphone5
        } else if phone && maxLength == 667 {
            return .iphone6
        } else if phone && maxLength == 667 {
            return .iphone7
        } else if phone && maxLength == 667 {
            return .iphone8
        } else if phone && maxLength == 736 {
            return .iphone6plus
        } else if phone && maxLength == 812 {
            return .iphoneX
        } else if phone && maxLength == 896 {
            return .iphoneXR
        } else if phone && maxLength == 780 {
            return .iphone12Mini
        } else if phone && maxLength == 844 {
            return .iphone12
        } else if phone && maxLength == 926 {
            return .iphone12ProMax
        } else if phone && maxLength == 780 {
            return .iphone13Mini
        } else if phone && maxLength == 844 {
            return .iphone13
        } else if phone && maxLength == 926 {
            return .iphone13ProMax
        } else if phone && maxLength == 844 {
            return .iphone14
        } else if phone && maxLength == 852 {
            return .iphone14Pro
        } else if phone && maxLength == 932 {
            return .iphone14ProMax
        } else if pad && maxLength == 1024 {
            return .ipad9
        } else if pad && maxLength == 1112 {
            return .ipad10
        } else if pad && maxLength == 1366 {
            return .ipad12
        }
        return .unknown
    }
}
