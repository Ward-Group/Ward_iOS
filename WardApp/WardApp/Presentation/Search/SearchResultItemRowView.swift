//
//  SearchResultItemRowView.swift
//  WardApp
//
//  Created by peppermint100 on 6/3/24.
//

import SwiftUI

struct SearchResultItemRowView: View {
    
    let item: SearchResultItem
    
    var body: some View {
        GeometryReader { geo in
            let imageSize = geo.size.width * 0.24
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color.gray2)
                    .frame(width: imageSize, height: imageSize)
                
                // TODO: 디자인 나오면 폰트 지정 필요
                VStack(alignment: .leading) {
                    Text(item.brand)
                            .foregroundStyle(Color.black0)
                            .lineLimit(1)
                    Text(item.name)
                            .foregroundStyle(Color.black0)
                            .lineLimit(2)
                    HStack {
                        Text(WardStrings.retailer)
                            .foregroundStyle(Color.black2)
                        Text(item.retailer)
                            .foregroundStyle(Color.black2)
                            .lineLimit(1)
                        Text(WardStrings.hits)
                            .foregroundStyle(Color.black2)
                        Text("\(item.hits)")
                            .foregroundStyle(Color.black2)
                    }
                }
            }
        }
    }
}

#Preview {
    SearchResultItemRowView(item: SearchResultItem(brand: "아식스", name: "젤 카야노 14", retailer: "ABC 마트", hits: 100))
}
