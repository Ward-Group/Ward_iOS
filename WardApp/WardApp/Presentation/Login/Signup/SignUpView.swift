//
//  SignUpView.swift
//  WardApp
//
//  Created by peppermint100 on 5/8/24.
//

import SwiftUI
import Combine

struct SignUpView: View {
    
    @EnvironmentObject var router: LoginRouter
    @ObservedObject private var input: SignUpViewModel.Input
    @ObservedObject private var output: SignUpViewModel.Output
    private let cancelBag = CancelBag()
    
    private let signUpButtonTrigger = PassthroughSubject<Void, Never>()
    private let signUpCompletionTrigger = PassthroughSubject<Void, Never>()
    private let backButtonTrigger = PassthroughSubject<Void, Never>()
    
    init(vm: SignUpViewModel) {
        let input = SignUpViewModel.Input(
            signUpButtonTrigger: signUpButtonTrigger.asDriver(),
            signUpCompletionTrigger: signUpCompletionTrigger
        )
        self.input = input
        self.output = vm.transform(input, cancelBag: cancelBag)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.background
                VStack {
                    
                    InlineNavBarView(
                        title: WardStrings.extraInformation,
                        buttonsRight: [
                            NavigationBarButton(style: .back, trigger: backButtonTrigger)
                        ]
                    )
                    
                    nicknameHeader
                        .frame(maxWidth: geo.size.width * 0.8, alignment: .leading)
                        .padding(.top)
                    
                    TextField("", text: $output.nickname, onCommit: {})
                        .padding(.leading)
                        .frame(width: geo.size.width * 0.85, height: 60)
                        .background(
                            nicknamePlaceholder
                        )
                        .padding(.bottom)
                    
                    termsOfServiceHeader
                        .frame(maxWidth: geo.size.width * 0.8, alignment: .leading)
                    
                    ZStack {
                        Color.cardBackgroundGray
                        VStack(alignment: .leading, spacing: 10) {
                            generalToggle
                            
                            Divider()
                                .frame(width: geo.size.width * 0.7, height: 15)
                            
                            ageToggle
                            serviceToggle
                            personalInfoCollectToggle
                            personalInfoMarketingToggle
                            
                            notificationGeneralToggle
                            
                            HStack {
                                Spacer()
                                emailNotificationToggle
                                smsNotificationToggle
                                appPushNotificationToggle
                                Spacer()
                            }
                        }
                        .padding()
                    }
                    .frame(width: geo.size.width * 0.85, height: 300)
                    .cornerRadius(16)
                    
                    Spacer()
                    
                    signUpButton
                        .frame(width: geo.size.width * 0.85, height: 60)
                }
            }
        }
        .onReceive(signUpCompletionTrigger, perform: { _ in
            router.pop()
        })
        .onReceive(backButtonTrigger, perform: { _ in
            router.pop()
        })
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .toolbar(.hidden)
    }
}

#Preview {
    SignUpView(vm: LoginAssembler().resolve(user: UserFromLoginProvider(loginProvider: .apple, providerId: "123", name: "12", email: "pepper@gmail.com")))
}

private extension SignUpView {
    
    var nicknameHeader: some View {
        HStack(alignment: .bottom) {
            Text("\(WardStrings.nickname) (\(WardStrings.required))")
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                .foregroundStyle(WardAssets.Color.headerTextBlack.swiftUIColor)
            
            if output.isCheckingNickname {
                ProgressView()
            } else {
                Text(
                    output.nickname.isEmpty ? WardStrings.requiredInput
                    : output.isNicknameDuplicated ? WardStrings.nicknameIsTaken
                    : WardStrings.validNickname
                )
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 10))
                .foregroundStyle(
                    output.nickname.isEmpty || output.isNicknameDuplicated ? Color.mainRed : Color.mainBlue
                )
            }
        }
    }
    
    var termsOfServiceHeader: some View {
        Text("\(WardStrings.agreementTermsOfService)")
            .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
            .foregroundStyle(Color.headerTextBlack)
    }
    
    var nicknamePlaceholder: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.cardBackgroundGray)
                .cornerRadius(16)
            HStack {
                if output.nickname == "" || output.nickname.isEmpty {
                    WardAssets.Image.Icon.person.swiftUIImage
                        .padding(.leading)
                    Text("\(WardStrings.typeNickname) (\(WardStrings.duplicationNotAllowed))")
                        .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                        .foregroundStyle(Color.placeholderGray)
                    Spacer()
                }
            }
        }
    }
    
    var generalToggle: some View {
        HStack {
            Toggle("", isOn: $output.generalToggle)
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
    }
    
    var ageToggle: some View {
        HStack {
            Toggle("", isOn: $output.ageToggle)
                .toggleStyle(ToggleCheckboxStyle())
            Text("\(WardStrings.olderThanAgeOf14) (\(WardStrings.required))")
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
        }
    }
    
    var serviceToggle: some View {
        HStack {
            Toggle("", isOn: $output.serviceAgreementToggle)
                .toggleStyle(ToggleCheckboxStyle())
            Text("\(WardStrings.termsOfService) (\(WardStrings.required))")
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
        }
    }
    
    var personalInfoCollectToggle: some View {
        HStack {
            Toggle("", isOn: $output.personalInfoCollectToggle)
                .toggleStyle(ToggleCheckboxStyle())
            Text("\(WardStrings.agreeToCollectPersonalInformation) (\(WardStrings.required))")
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
        }
    }
    
    var personalInfoMarketingToggle: some View {
        HStack {
            Toggle("", isOn: $output.personalInfoMarketingToggle)
                .toggleStyle(ToggleCheckboxStyle())
            Text("\(WardStrings.agreeToUsePersonalInformationForMarketing) (\(WardStrings.optional))")
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
        }
    }
    
    var notificationGeneralToggle: some View {
        HStack {
            Toggle("", isOn: $output.notificationGeneralToggle)
                .toggleStyle(ToggleCheckboxStyle())
            Text("\(WardStrings.eventReleaseNotification) (\(WardStrings.optional))")
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
        }
    }
    
    var emailNotificationToggle: some View {
        HStack {
            Toggle("", isOn: $output.emailNotificationToggle)
                .toggleStyle(ToggleCheckboxStyle())
            Text("\(WardStrings.email)")
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
        }
    }
    
    var smsNotificationToggle: some View {
        HStack {
            Toggle("", isOn: $output.smsNotificationToggle)
                .toggleStyle(ToggleCheckboxStyle())
            Text("\(WardStrings.sms)")
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
        }
    }
    
    var appPushNotificationToggle: some View {
        HStack {
            Toggle("", isOn: $output.appPushNotificationToggle)
                .toggleStyle(ToggleCheckboxStyle())
            Text("\(WardStrings.appPush)")
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
        }
    }
    
    var signUpButton: some View {
        Button {
            signUpButtonTrigger.send()
        } label: {
            ZStack {
                output.disableSignUpButton ? Color.placeholderGray : Color.mainBlue
                
                if output.isSigningIn {
                    ProgressView()
                        .tint(Color.white0)
                } else {
                    Text(WardStrings.confirmSignUp)
                        .foregroundStyle(.white)
                        .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 16))
                }
            }
            .cornerRadius(16)
        }
        .disabled(output.disableSignUpButton)
    }
    
    var backButton: some View {
        WardAssets.Image.Icon.arrowLeft.swiftUIImage
    }
}
