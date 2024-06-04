//
//  SearchHistoryService.swift
//  WardApp
//
//  Created by peppermint100 on 6/3/24.
//

import Foundation

class SearchHistoryService: ObservableObject {
    
    @Published private(set) var history: [SearchHistory] = []
    private let cancelBag = CancelBag()
    
    init() {
        history = getHistory()
        
        $history.sink { [weak self] newHistory in
            self?.save(newHistory)
        }
        .store(in: cancelBag)
    }
    
    private func getHistory() -> [SearchHistory] {
        if let history = UserDefaults.standard.object(forKey: UserDefaultsKey.searchHistory) as? Data {
            let decoder = JSONDecoder()
            if let loaded = try? decoder.decode([SearchHistory].self, from: history) {
                return loaded.sorted { $0.createdAt > $1.createdAt }
            }
        }
        
        return []
    }
    
    func addHistory(_ term: String) {
        history.removeAll(where: { $0.term == term })
        history.append(SearchHistory(id: UUID(), term: term))
    }
    
    func removeHistory(_ id: UUID) {
        history = history.filter { $0.id != id }
    }
    
    func removeAll() {
        history = []
    }
    
    private func save(_ history: [SearchHistory]) {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(history) {
            defaults.set(encoded, forKey: UserDefaultsKey.searchHistory)
        }
    }
}
