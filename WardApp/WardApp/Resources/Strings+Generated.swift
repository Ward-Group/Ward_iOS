// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum WardStrings {
  /// 개인정보 수집 및 이용 동의
  public static let agreeToCollectPersonalInformation = WardStrings.tr("Localizable", "Agree To Collect Personal Information", fallback: "개인정보 수집 및 이용 동의")
  /// 개인정보 마케팅 활용 동의
  public static let agreeToUsePersonalInformationForMarketing = WardStrings.tr("Localizable", "Agree To Use Personal Information For Marketing", fallback: "개인정보 마케팅 활용 동의")
  /// 약관 전체 동의
  public static let agreementAllTermsOfService = WardStrings.tr("Localizable", "Agreement All Terms Of Service", fallback: "약관 전체 동의")
  /// 약관 동의
  public static let agreementTermsOfService = WardStrings.tr("Localizable", "Agreement Terms Of Service", fallback: "약관 동의")
  /// 회원가입 완료
  public static let confirmSignUp = WardStrings.tr("Localizable", "Confirm Sign Up", fallback: "회원가입 완료")
  /// 마감 임박
  public static let deadlineImminent = WardStrings.tr("Localizable", "Deadline Imminent", fallback: "마감 임박")
  /// 중복 불가
  public static let duplicationNotAllowed = WardStrings.tr("Localizable", "Duplication Not Allowed", fallback: "중복 불가")
  /// 얼마 안남은 행운을 즐겨 보세요
  public static let enjoyTheLittleLuckYouHaveLeft = WardStrings.tr("Localizable", "Enjoy the little luck you have left", fallback: "얼마 안남은 행운을 즐겨 보세요")
  /// 이벤트, 발매 알림
  public static let eventReleaseNotification = WardStrings.tr("Localizable", "Event, Release Notification", fallback: "이벤트, 발매 알림")
  /// 추가 정보 입력
  public static let extraInformation = WardStrings.tr("Localizable", "Extra Information", fallback: "추가 정보 입력")
  /// 선택 항목에 대한 동의 포함
  public static let includeOptionalTermsOfService = WardStrings.tr("Localizable", "Include Optional Terms Of Service", fallback: "선택 항목에 대한 동의 포함")
  /// Apple로 계속하기
  public static let loginWithApple = WardStrings.tr("Localizable", "Login With Apple", fallback: "Apple로 계속하기")
  /// Localizable.strings
  ///   WardApp
  /// 
  ///   Created by peppermint100 on 5/4/24.
  public static let loginWithKakao = WardStrings.tr("Localizable", "Login With Kakao", fallback: "카카오로 계속하기")
  /// 닉네임
  public static let nickname = WardStrings.tr("Localizable", "Nickname", fallback: "닉네임")
  /// 만 14세 이상입니다.
  public static let olderThanAgeOf14 = WardStrings.tr("Localizable", "Older Than Age Of 14", fallback: "만 14세 이상입니다.")
  /// 선택
  public static let `optional` = WardStrings.tr("Localizable", "Optional", fallback: "선택")
  /// 필수
  public static let `required` = WardStrings.tr("Localizable", "Required", fallback: "필수")
  /// 서비스 이용약관
  public static let termsOfService = WardStrings.tr("Localizable", "Terms Of Service", fallback: "서비스 이용약관")
  /// 사용할 닉네임을 입력해주세요.
  public static let typeNickname = WardStrings.tr("Localizable", "Type Nickname", fallback: "사용할 닉네임을 입력해주세요.")
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
