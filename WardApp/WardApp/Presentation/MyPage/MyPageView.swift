//
//  MyPageView.swift
//  WardApp
//
//  Created by peppermint100 on 6/21/24.
//

import SwiftUI
import Combine

struct MyPageView: View {
    
    @EnvironmentObject var router: MyPageRouter
    @EnvironmentObject var mainRouter: MainRouter
    @ObservedObject private var input: MyPageViewModel.Input
    @ObservedObject private var output: MyPageViewModel.Output
    
    private let settingButtonTrigger = PassthroughSubject<Void, Never>()
    private let logOutButtonTrigger = PassthroughSubject<Void, Never>()
    private let logOutSuccessTrigger = PassthroughSubject<Void, Never>()
    
    private let cancelBag = CancelBag()
    
    init(vm: MyPageViewModel) {
        let input = MyPageViewModel.Input(
            logOutButtonTrigger: logOutButtonTrigger.asDriver(),
            logOutSuccessTrigger: logOutSuccessTrigger
        )
        let output = vm.transform(input, cancelBag: cancelBag)
        self.input = input
        self.output = output
    }
    
    var body: some View {
        ZStack {
            Color.background
            
            NavigationStack(path: $router.path) {
                
                GeometryReader { geo in
                    ScrollView {
                        
                        VStack {
                            LogoNavBarView(buttonsRight: [NavigationBarButton(style: .gear, trigger: settingButtonTrigger)])
                                .padding(.bottom, 50)
                            
                            VStack(alignment: .center, spacing: 20) {
                                VStack {
                                    profileImage
                                    nickname
                                }
                                
                                entry
                                    .padding()
                                    .frame(width: geo.size.width)
                                
                                myActivity
                                    .padding()
                                    .frame(width: geo.size.width)
                                
                                etc
                                    .padding()
                                    .frame(width: geo.size.width)
                            }
                        }
                    }
                }
                .toolbar(.hidden)
                .navigationDestination(for: MyPageRouter.Page.self) { page in
                    router.build(page)
                }
                .onReceive(logOutSuccessTrigger, perform: { _ in
                    mainRouter.present(fullScreenSheet: .login)
                })
            }
        }
    }
}


private extension MyPageView {
    
    var profileImage: some View {
        ZStack {
            Circle()
                .fill(Color.darkGray)
                .frame(width: 83, height: 83)
            
            Text(String(output.nickname.first ?? Character("")))
                .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 30))
            
        }
        .overlay(alignment: .bottomTrailing) {
            Circle()
                .fill(Color.mainGray)
                .frame(width: 24, height: 24)
                .overlay {
                    WardAssets.Image.Icon.camera.swiftUIImage
                }
        }
    }
    
    var nickname: some View {
        Button(
            action: {},
            label: {
                HStack {
                    Text(output.nickname)
                        .foregroundStyle(Color.black4)
                    
                    WardAssets.Image.Icon.chevronRight.swiftUIImage
                        .tint(Color.black4)
                }
            }
        )
    }
    
    var entry: some View {
        VStack(alignment: .leading) {
            Text(WardStrings.myEntries)
                .font(WardFonts.Pretendard.bold.swiftUIFont(size: 16))
                .foregroundStyle(Color.black5)
                .padding(.bottom, 7)
            
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(Color.mainGray)
                .frame(height: 70)
                .overlay {
                    HStack {
                        Spacer()
                        VStack(spacing: 4) {
                            Text("0")
                                .font(WardFonts.Pretendard.bold.swiftUIFont(size: 16))
                                .foregroundStyle(Color.black5)
                            
                            Text(WardStrings.progress)
                                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                                .foregroundStyle(Color.black5)
                        }
                        
                        Spacer()
                        VStack(spacing: 4) {
                            Text("0")
                                .font(WardFonts.Pretendard.bold.swiftUIFont(size: 16))
                                .foregroundStyle(Color.black5)
                            
                            Text(WardStrings.winnerAnnouncement)
                                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                                .foregroundStyle(Color.black5)
                        }
                        
                        Spacer()
                        VStack(spacing: 4) {
                            Text("0")
                                .font(WardFonts.Pretendard.bold.swiftUIFont(size: 16))
                                .foregroundStyle(Color.black5)
                            
                            Text(WardStrings.deadline)
                                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                                .foregroundStyle(Color.black5)
                        }
                        
                        Spacer()
                    }
                }
        }
    }
    
    var myActivity: some View {
        VStack(alignment: .leading) {
            Text(WardStrings.myActivity)
                .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
                .foregroundStyle(Color.black1)
                .padding(.bottom, 15)
            
            MyPageNavigatorView(title: WardStrings.interestedList)
            MyPageNavigatorView(title: WardStrings.submitReview)
        }
    }
    
    var etc: some View {
        VStack(alignment: .leading) {
            Text("기타")
                .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
                .foregroundStyle(Color.black1)
                .padding(.bottom, 15)
            
            MyPageNavigatorView(title: WardStrings.noticeBoard)
                .onTapGesture {
                    router.push(.noticeBoard)
                }
            
            MyPageNavigatorView(title: WardStrings.oneOnOneInquries)
            
            MyPageNavigatorView(title: WardStrings.logOut)
                .onTapGesture {
                    logOutButtonTrigger.send()
                }
        }
    }
}

#Preview {
    MyPageAssembler().view()
}
