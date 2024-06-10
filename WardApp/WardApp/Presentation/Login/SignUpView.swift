//
//  SignUpView.swift
//  WardApp
//
//  Created by peppermint100 on 5/8/24.
//

import SwiftUI

struct SignUpView: View {
    
    @State var isSelected = false
    @State var text = ""
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                background
                VStack {
                    Text("\(WardStrings.nickname) (\(WardStrings.required))")
                        .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                        .foregroundStyle(WardAssets.Color.headerTextBlack.swiftUIColor)
                        .frame(maxWidth: geo.size.width * 0.8, alignment: .leading)
                        .padding(.top)
                    
                    TextField("", text: $text, onCommit: {})
                        .padding(.leading)
                        .frame(width: geo.size.width * 0.85, height: 60)
                        .background(
                            nicknamePlaceholder
                        )
                        .padding(.bottom)
                    
                    Text("\(WardStrings.agreementTermsOfService)")
                        .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                        .foregroundStyle(WardAssets.Color.headerTextBlack.swiftUIColor)
                        .frame(maxWidth: geo.size.width * 0.8, alignment: .leading)
                    
                    ZStack {
                        cardBackground
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Toggle("", isOn: $isSelected)
                                    .toggleStyle(ToggleCheckboxStyle())
                                Text("\(WardStrings.agreementAllTermsOfService)")
                                    .font(WardFonts.Pretendard.bold.swiftUIFont(size: 16))
                                VStack {
                                    Spacer()
                                    Text("\(WardStrings.includeOptionalTermsOfService)")
                                        .font(WardFonts.Pretendard.regular.swiftUIFont(size: 10))
                                        .foregroundStyle(WardAssets.Color.footnoteText.swiftUIColor)
                                }
                            }
                            .frame(height: 20)
                            
                            Divider()
                                .frame(width: geo.size.width * 0.7, height: 15)
                            
                            HStack {
                                Toggle("", isOn: $isSelected)
                                    .toggleStyle(ToggleCheckboxStyle())
                                Text("\(WardStrings.olderThanAgeOf14) (\(WardStrings.required))")
                                    .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                            }
                            HStack {
                                Toggle("", isOn: $isSelected)
                                    .toggleStyle(ToggleCheckboxStyle())
                                Text("\(WardStrings.termsOfService) (\(WardStrings.required))")
                                    .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                            }
                            HStack {
                                Toggle("", isOn: $isSelected)
                                    .toggleStyle(ToggleCheckboxStyle())
                                Text("\(WardStrings.agreeToCollectPersonalInformation) (\(WardStrings.required))")
                                    .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                            }
                            HStack {
                                Toggle("", isOn: $isSelected)
                                    .toggleStyle(ToggleCheckboxStyle())
                                Text("\(WardStrings.agreeToUsePersonalInformationForMarketing) (\(WardStrings.optional))")
                                    .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                            }
                            HStack {
                                Toggle("", isOn: $isSelected)
                                    .toggleStyle(ToggleCheckboxStyle())
                                Text("\(WardStrings.eventReleaseNotification) (\(WardStrings.optional))")
                                    .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                            }
                        }
                    }
                    .frame(width: geo.size.width * 0.85, height: 270)
                    .cornerRadius(16)
                    
                    Spacer()
                    
                    Button {
                    } label: {
                        ZStack {
                            WardAssets.Color.placeholderGray.swiftUIColor
                            Text(WardStrings.confirmSignUp)
                                .foregroundStyle(.white)
                                .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 16))
                        }
                        .cornerRadius(16)
                    }
                    .frame(width: geo.size.width * 0.85, height: 60)
                }
            }
        }
    }
}

#Preview {
    SignUpView()
}

private extension SignUpView {
    
    var background: some View {
        WardAssets.Color.backgroundColor.swiftUIColor
    }
    
    var cardBackground: some View {
        WardAssets.Color.cardBackgroundGray.swiftUIColor
    }
    
    var nicknamePlaceholder: some View {
        ZStack {
            Rectangle()
                .foregroundColor(WardAssets.Color.cardBackgroundGray.swiftUIColor)
                .cornerRadius(16)
            HStack {
                if text.isEmpty {
                    Symbols.personFill
                        .padding(.leading)
                    Text("\(WardStrings.typeNickname) (\(WardStrings.duplicationNotAllowed))")
                        .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                        .foregroundStyle(WardAssets.Color.placeholderGray.swiftUIColor)
                    Spacer()
                }
            }
        }
    }
    
    var backButton: some View {
        Symbols.arrowLeft
    }
}
