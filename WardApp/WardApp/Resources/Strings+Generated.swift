// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum WardStrings {
  /// Apple로 계속하기
  public static let loginWithApple = WardStrings.tr("Localizable", "Login With Apple", fallback: "Apple로 계속하기")
  /// Localizable.strings
  ///   WardApp
  /// 
  ///   Created by peppermint100 on 5/4/24.
  public static let loginWithKakao = WardStrings.tr("Localizable", "Login With Kakao", fallback: "카카오로 계속하기")
  /// 아직 회원이 아니신가요?
  public static let yetMember = WardStrings.tr("Localizable", "Yet Member", fallback: "아직 회원이 아니신가요?")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension WardStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
