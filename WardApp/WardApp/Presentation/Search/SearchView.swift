//
//  SearchView.swift
//  WardApp
//
//  Created by peppermint100 on 6/3/24.
//

import SwiftUI
import Combine

struct SearchView: View {
    
    @ObservedObject private var input: SearchViewModel.Input
    @ObservedObject private var output: SearchViewModel.Output
    
    @FocusState private var searchBarFocused: Bool
    
    private let searchBarFocusTrigger = PassthroughSubject<Bool, Never>()
    private let searchTextTrigger = PassthroughSubject<String, Never>()
    private let removeAllTabTrigger = PassthroughSubject<Void, Never>()
    private let xMarkButtonTappedTrigger = PassthroughSubject<UUID, Never>()
    private let searchButtonTrigger = PassthroughSubject<Void, Never>()
    private let clearSearchBarButtonTrigger = PassthroughSubject<Void, Never>()
    
    private let cancelBag = CancelBag()
    
    init(vm: SearchViewModel) {
        let input = SearchViewModel.Input(
            searchTextTrigger: searchTextTrigger.asDriver(),
            searchBarFocusTrigger: searchBarFocusTrigger.asDriver(),
            removeAllTabTrigger: removeAllTabTrigger.asDriver(),
            xMarkButtonTappedTrigger: xMarkButtonTappedTrigger.asDriver(),
            searchButtonTrigger: searchButtonTrigger.asDriver(),
            clearSearchBarButtonTrigger: clearSearchBarButtonTrigger.asDriver()
        )
        
        let output = vm.transform(input, cancelBag: cancelBag)
        self.input = input
        self.output = output
    }
    
    var body: some View {
        ZStack {
            Color.background
            
            GeometryReader { geo in
                VStack {
                    HStack {
                        if output.searchText.isEmpty {
                            searchButton
                        }
                        Spacer()
                        searchBar
                        if !output.searchText.isEmpty {
                            clearSearchBarButton
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 4)
                    
                    if output.searchBarFocused || output.searchResultItems.isEmpty {
                        searchBarDivider
                            .frame(width: geo.size.width, height: 2)
                        recentHistoryAndRemoveAllButton
                        searchHistory
                    } else {
                        
                        Divider()
                        
                        WardSegementedControl(
                            tabs: output.tabs, currentTab: $output.selectedTab,
                            active: Color.black0, inactive: Color.black0,
                            font: WardFonts.Pretendard.semiBold.swiftUIFont(size: 16)
                        )
                        .padding(.horizontal)
                        .frame(height: 45)
                        
                        HStack {
                            itemCount
                            Spacer()
                            showMore
                        }
                        .padding(.horizontal)
                        
                        ScrollView {
                            LazyVStack(spacing: geo.size.height * 0.035) {
                                itemList
                            }}
                    }
                }
            }
        }
    }
}

extension SearchView {
    
    private var searchBar: some View {
        TextField("", text: $output.searchText)
            .background {
                HStack(spacing: 5) {
                    if !output.searchBarFocused && output.searchText.isEmpty {
                        Text(WardStrings.typeProductCodeNames)
                            .font(WardFonts.Pretendard.medium.swiftUIFont(size: 16))
                            .foregroundStyle(Color.darkGray)
                    }
                    Spacer()
                }
            }
            .focused($searchBarFocused)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .onChange(of: searchBarFocused) {
                searchBarFocusTrigger.send(searchBarFocused)
            }
            .onChange(of: output.searchText) {
                searchTextTrigger.send(output.searchText)
            }
            .onSubmit {
                searchButtonTrigger.send()
            }
            .submitLabel(.search)
    }
    
    private var clearSearchBarButton: some View {
        WardAssets.Image.Icon.xMarkFill.swiftUIImage
            .onTapGesture {
                clearSearchBarButtonTrigger.send()
            }
    }
    
    private var searchButton: some View {
        Button(
            action: {
                searchButtonTrigger.send()
                UIApplication.shared.endEditing()
            },
            label: {
                WardAssets.Image.Icon.searching.swiftUIImage
                    .renderingMode(.template)
                    .foregroundStyle(Color.mainBlue)
            }
        )
    }
    
    private var searchBarDivider: some View {
        Rectangle()
            .foregroundStyle(Color.mainBlue)
            .padding(.horizontal)
    }
    
    private var recentHistoryAndRemoveAllButton: some View {
        HStack {
            Text(WardStrings.recentSearchTermHistory)
                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 12))
                .foregroundStyle(Color.black2)
            Spacer()
            Text(WardStrings.removeAll)
                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 12))
                .foregroundStyle(Color.black2)
                .onTapGesture {
                    removeAllTabTrigger.send()
                }
        }
        .padding(.top, 7)
        .padding(.bottom, 10)
        .padding(.horizontal)
    }
    
    private var searchHistory: some View {
        ScrollView {
            LazyVStack {
                ForEach($output.searchHistory, id: \.id) { history in
                    HStack {
                        Text(history.wrappedValue.term)
                            .font(WardFonts.Pretendard.semiBold.swiftUIFont(size: 18))
                            .foregroundStyle(Color.black0)
                        
                        Spacer()
                        
                        Button(action: {
                            xMarkButtonTappedTrigger.send(history.wrappedValue.id)
                        }, label: {
                            WardAssets.Image.Icon.xMark.swiftUIImage
                        })
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    private var itemCount: some View {
        Group {
            Text(WardStrings.items)
                .font(WardFonts.Pretendard.medium.swiftUIFont(size: 16))
                .foregroundStyle(Color.black0)
            Text("\(output.searchResultItems.count)")
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                .foregroundStyle(Color.darkGray)
        }
    }
    
    private var showMore: some View {
        Button(action: {
        }, label: {
            Text(WardStrings.showMore)
                .font(WardFonts.Pretendard.regular.swiftUIFont(size: 14))
                .foregroundStyle(Color.black2)
            WardAssets.Image.Icon.chevronRight.swiftUIImage
        })
    }
    
    private var itemList: some View {
        ForEach($output.searchResultItems) { item in
            SearchResultItemRowView(item: item.wrappedValue)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 80)
        }
    }
}

#Preview {
    SearchViewAssembler().view()
}
