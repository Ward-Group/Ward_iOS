//
//  HomeMenuView.swift
//  Ward
//
//  Created by 강신규 on 2/19/24.
//

import SwiftUI

struct HomeMenuView: View {
    var body: some View {
        ScrollView{
            VStack {
                HeaderView().padding(.bottom, 15)
                HomeSelectItemView(items: ["이벤트","패션뉴스"])
                    
            }.padding(.horizontal, 12)
   
            
        }
    }
}


struct HomeSelectItemView : View {
    @State var selectedIndex = 0
    var items : [String]

    var body: some View {
        VStack(alignment : .leading) {
            HStack {
                ForEach(Array(zip(items.indices, items)), id : \.0) { index, item in
                    SelectButtonView(sliderText : item, myIndex : index, selectedIndex: $selectedIndex)
                }
                Spacer()
            }
            VStack {
                selectedIndex == 0 ? AnyView(HomeEventView()) : selectedIndex == 1 ? AnyView(TodayRegisterView()) : selectedIndex == 2 ? AnyView(OpenLaterView()) :
                selectedIndex == 3 ? AnyView(ReleaseConfirmView()) : AnyView(Text("None"))
            }
          
        }.background {
            Color.white
        }
    }
}

struct HomeEventView : View {
    var body: some View {
        VStack(alignment : .center) {
            
            
            //TOOD : 색션 서버 값으로 분리해서
            Image("ReleaseImage1").scaledToFill()
            HStack(alignment: .top){
                Text("OOO님 추천 상품").foregroundColor(.black).fontWeight(.bold).font(.system(size: 18))
                Spacer()
            }
            RecomendProductView()
            
            HStack(alignment: .top){
                Text("새해 신규 트렌드").foregroundColor(.black).fontWeight(.bold).font(.system(size: 18))
                Spacer()
            }.padding(.top, 20)
            TrendProductView()
            
            
            //TODO : 임시 데이터
            HStack(alignment: .top){
                Text("겨울엔 부츠지").foregroundColor(.black).fontWeight(.bold).font(.system(size: 18))
                Spacer()
            }.padding(.top, 20)
            TrendProductView()
            
            
            
            
            
            
  
        }.padding(.top, 5)
    }
}

struct RecomendProductView : View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            LazyHStack(alignment : .top) {
                //TODO : ServerData
  
                RecomendTableView()
                RecomendTableView()
                RecomendTableView()
            }
            
        }
    }
}

struct RecomendTableView : View {
    var body: some View {
        VStack(alignment : .leading) {
            
            ZStack(alignment: .bottomTrailing) {
                Image("ReleaseImage1").resizable().frame(width : 145, height : 145)
                Image("HeartOff").frame(width : 50, height: 50)
            }
            Text("브랜드명").foregroundColor(.black).fontWeight(.bold).font(.system(size: 12))
            Text("제품명 입력 자리입니다").padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)).foregroundColor(.black).fontWeight(.regular).font(.system(size: 12))
            Text("최대 두줄까지 가능합니다").foregroundColor(.black).fontWeight(.regular).font(.system(size: 12))
            Text("가격").foregroundColor(.black).fontWeight(.bold).font(.system(size: 12)).padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct TrendProductView : View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            LazyHStack(alignment : .top) {
                //TODO : ServerData
                TrendTableView()
                TrendTableView()
                TrendTableView()
            }
            
        }
    }
}

struct TrendTableView : View {
    var body: some View {
        VStack(alignment : .leading) {
            
            ZStack(alignment: .bottomTrailing) {
                Image("ReleaseImage1").resizable().frame(width : 145, height : 145)
                Image("HeartOff").frame(width : 50, height: 50)
            }
            Text("브랜드명").foregroundColor(.black).fontWeight(.bold).font(.system(size: 12))
            Text("제품명 입력 자리입니다").padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)).foregroundColor(.black).fontWeight(.regular).font(.system(size: 12))
            Text("최대 두줄까지 가능합니다").foregroundColor(.black).fontWeight(.regular).font(.system(size: 12))
            Text("가격").foregroundColor(.black).fontWeight(.bold).font(.system(size: 12)).padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
        }
    }
}








#Preview {
    HomeMenuView()
}
