//
//  NoticeBoardView.swift
//  WardApp
//
//  Created by peppermint100 on 6/4/24.
//

import SwiftUI
import Combine

struct NoticeBoardView: View {
    
    @ObservedObject private var input: NoticeBoardViewModel.Input
    @ObservedObject private var output: NoticeBoardViewModel.Output
    
    private let openNoticeButtonTrigger = PassthroughSubject<UUID, Never>()
    
    private let cancelBag = CancelBag()
    
    init(vm: NoticeBoardViewModel) {
        let input = NoticeBoardViewModel.Input(
            openNoticeButtonTrigger: openNoticeButtonTrigger.asDriver()
        )
        let output = vm.transform(input, cancelBag: cancelBag)
        self.input = input
        self.output = output
    }
    
    var body: some View {
        ZStack {
            Color.background
            VStack {
                InlineNavBarView(title: WardStrings.noticeBoard)
                ScrollView {
                    LazyVStack(spacing: 15) {
                        noticeBoardList
                    }
                }
            }
        }
    }
}

#Preview {
    NoticeBoardView(vm: NoticeBoardAssemblerImpl().resolve())
}

extension NoticeBoardView {
    
    private var noticeBoardList: some View {
        ForEach($output.items, id: \.id) { item in
            DisclosureGroup(isExpanded: item.isCollapsed) {
                Text(item.wrappedValue.content)
                    .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                    .foregroundStyle(Color.black0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom)
            } label: {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(item.wrappedValue.title)
                            .font(WardFonts.Pretendard.bold.swiftUIFont(size: 16))
                            .foregroundStyle(Color.black0)
                            .lineLimit(1)
                        
                        Text(item.wrappedValue.createdAt.format(formatString: "yyyy-MM-dd"))
                            .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 14))
                            .foregroundStyle(Color.white3)
                    }
                }
                .padding()
            }
            .disclosureGroupStyle(DarkChevronDisclosureGroupStyle(button: WardAssets.Image.Icon.chevronDown.swiftUIImage))
            Divider()
        }
    }
}
