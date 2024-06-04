//
//  InterestedView.swift
//  WardApp
//
//  Created by peppermint100 on 5/30/24.
//

import SwiftUI
import Combine

struct InterestedView: View {
    
    @ObservedObject var input: InterestedViewModel.Input
    @ObservedObject var output: InterestedViewModel.Output
    
    @EnvironmentObject private var router: InterestedRouter
    
    private var currentTabTrigger = PassthroughSubject<WardSegmentedControlTab, Never>()
    private var currentFilterOptionTrigger = PassthroughSubject<FilterOption, Never>()
    
    private let cancelBag = CancelBag()
    
    init(vm: InterestedViewModel) {
        let input = InterestedViewModel.Input(
            currentTabTrigger: currentTabTrigger.asDriver(),
            currentFilterOptionTrigger: currentFilterOptionTrigger.asDriver()
        )
        output = vm.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            GeometryReader { geo in
                VStack {
                    WardSegementedControl(tabs: output.tabs, currentTab: $output.currentTab)
                        .frame(height: geo.size.height * 0.07)
                    
                    HStack {
                        itemCount
                        Spacer()
                        filter
                    }
                    .padding(.horizontal)
                    
                    if output.items.isEmpty {
                        emptyItem
                    } else {
                        itemList
                    }
                }
            }
        }
    }
}

extension InterestedView {
    
    private var itemCount: some View {
        VStack {
            Text("\(WardStrings.total) \($output.items.count)\(WardStrings.countingUnitKorean)")
                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                .foregroundStyle(Color.black8)
        }
    }
    
    private var filter: some View {
        Menu {
            ForEach(output.filterOptions, id: \.id) { option in
                Button(action: {
                    currentFilterOptionTrigger.send(option)
                }, label: {
                    Text(option.title)
                        .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
                    
                    if option == output.currentFilterOption {
                        WardAssets.Image.Icon.arrowDown.swiftUIImage
                            .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
                    }
                })
            }
        } label: {
            Button(action: {
            }, label: {
                Text(output.currentFilterOption.title)
                    .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
                    .foregroundStyle(Color.black8)
                
                WardAssets.Image.Icon.arrowDown.swiftUIImage
                    .font(WardFonts.Pretendard.bold.swiftUIFont(size: 14))
            })
        }
    }
    
    private var itemList: some View {
        ScrollView(.vertical) {
            ForEach($output.items, id: \.id) { item in
                InterestedItemRowView(item: item.wrappedValue)
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 85)
                    .onTapGesture {
                        router.push(.detail(item: item.wrappedValue))
                    }
                Divider()
                    .padding(.top, 15)
                    .padding(.horizontal)
            }
        }
    }
    
    private var emptyItem: some View {
        VStack {
            Spacer()
            Text(WardStrings.interestedItemsDoNotExist)
                .multilineTextAlignment(.center)
                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 14))
                .foregroundStyle(Color.gray3)
            
            Button(
                action: {
                },
                label: {
                    Text(WardStrings.redirectToReleaseMenu)
                        .foregroundStyle(Color.black6)
                        .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                        .background(
                            Rectangle()
                                .foregroundStyle(.clear)
                                .border(Color.gray2)
                                .frame(minWidth: 131, minHeight: 50)
                        )
                })
            .padding(.vertical, 35)
            Spacer()
        }
    }
}

#Preview {
    let router = InterestedAssemblerImpl()
    return InterestedView(vm: router.resolve())
        .environmentObject(InterestedRouter())
}
