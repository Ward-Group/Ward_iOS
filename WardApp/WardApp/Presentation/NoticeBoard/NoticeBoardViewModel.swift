//
//  NoticeBoardViewModel.swift
//  WardApp
//
//  Created by peppermint100 on 6/4/24.
//

import Foundation

struct NoticeBoardViewModel: ViewModel {
    
    final class Input: ObservableObject {
        let openNoticeButtonTrigger: Driver<UUID>
        
        init(openNoticeButtonTrigger: Driver<UUID>) {
            self.openNoticeButtonTrigger = openNoticeButtonTrigger
        }
    }
    
    final class Output: ObservableObject {
        @Published var items: [NoticeBoardItem] = [
            NoticeBoardItem(title: "공지사항 제목", content: "공지사항 내용 내용 내용 내용 공지사항 내용 내용 내용 내용 공지사항 내용 내용 내용 내용 \n 공지사항 내용 내용 내용 내용 공지사항 내용 내용 내용 내 \n 공지사항 내용 내용 내용 내용", createdAt: Date.now),
            NoticeBoardItem(title: "공지사항 제목", content: "공지사항 내용 내용 내용 내용", createdAt: Date.now),
            NoticeBoardItem(title: "공지사항 제목", content: "공지사항 내용 내용 내용 내용", createdAt: Date.now),
            NoticeBoardItem(title: "공지사항 제목", content: "공지사항 내용 내용 내용 내용", createdAt: Date.now),
            NoticeBoardItem(title: "공지사항 제목", content: "공지사항 내용 내용 내용 내용", createdAt: Date.now)
        ]
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        input.openNoticeButtonTrigger
            .sink { id in
                if let idx = output.items.firstIndex(where: { $0.id == id }) {
                    output.items[idx].isCollapsed.toggle()
                }
            }
            .store(in: cancelBag)
        
        return output
    }
}
