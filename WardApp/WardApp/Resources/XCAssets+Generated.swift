// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum WardAssets {
  public enum Color {
    public static let accentColor = ColorAsset(name: "AccentColor")
    public static let backgroundColor = ColorAsset(name: "BackgroundColor")
    public static let black0 = ColorAsset(name: "Black0")
    public static let black1 = ColorAsset(name: "Black1")
    public static let black2 = ColorAsset(name: "Black2")
    public static let black3 = ColorAsset(name: "Black3")
    public static let black4 = ColorAsset(name: "Black4")
    public static let black5 = ColorAsset(name: "Black5")
    public static let black6 = ColorAsset(name: "Black6")
    public static let black7 = ColorAsset(name: "Black7")
    public static let black8 = ColorAsset(name: "Black8")
    public static let blue1 = ColorAsset(name: "Blue1")
    public static let blue2 = ColorAsset(name: "Blue2")
    public static let cardBackgroundGray = ColorAsset(name: "CardBackgroundGray")
    public static let checkBoxGray = ColorAsset(name: "CheckBoxGray")
    public static let darkGray = ColorAsset(name: "DarkGray")
    public static let footnoteText = ColorAsset(name: "FootnoteText")
    public static let gray2 = ColorAsset(name: "Gray2")
    public static let gray3 = ColorAsset(name: "Gray3")
    public static let headerTextBlack = ColorAsset(name: "HeaderTextBlack")
    public static let mainBlue = ColorAsset(name: "MainBlue")
    public static let mainGray = ColorAsset(name: "MainGray")
    public static let mainRed = ColorAsset(name: "MainRed")
    public static let newTestColor = ColorAsset(name: "NewTestColor")
    public static let placeholderGray = ColorAsset(name: "PlaceholderGray")
    public static let white0 = ColorAsset(name: "White0")
    public static let white1 = ColorAsset(name: "White1")
    public static let white2 = ColorAsset(name: "White2")
    public static let white3 = ColorAsset(name: "White3")
    public static let white4 = ColorAsset(name: "White4")
  }
  public enum Image {
    public static let appleLoginLogo = ImageAsset(name: "AppleLoginLogo")
    public static let homeBanner = ImageAsset(name: "HomeBanner")
    public enum Icon {
      public static let chevronRight = ImageAsset(name: "ChevronRight")
      public static let notification = ImageAsset(name: "Notification")
      public static let searching = ImageAsset(name: "Searching")
      public static let arrowDown = ImageAsset(name: "arrowDown")
      public static let arrowLeft = ImageAsset(name: "arrowLeft")
      public static let likeNo = ImageAsset(name: "likeNo")
      public static let likeYes = ImageAsset(name: "likeYes")
      public static let likeYesBorderless = ImageAsset(name: "likeYesBorderless")
      public static let xMark = ImageAsset(name: "xMark")
    }
    public static let kakaoLoginLogo = ImageAsset(name: "KakaoLoginLogo")
    public enum Tab {
      public static let category = ImageAsset(name: "category")
      public static let home = ImageAsset(name: "home")
      public static let interested = ImageAsset(name: "interested")
      public static let mypage = ImageAsset(name: "mypage")
      public static let release = ImageAsset(name: "release")
    }
    public static let wardLogo = ImageAsset(name: "WardLogo")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  public func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
