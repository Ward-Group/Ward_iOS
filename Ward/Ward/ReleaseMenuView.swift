//
//  ReleaseMenuView.swift
//  Ward
//
//  Created by 강신규 on 2/14/24.
//

import SwiftUI

struct ReleaseMenuView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeaderView()
                TextClockView()
                ImageSlider(imageSample:  ["ReleaseImage1","ReleaseImage1"])
                SelectItemView(items: ["조회순", "오늘 등록", "공개 예정", "발매 확정"])
            }.padding(.horizontal, 12)
        }
 
    }
}

struct HeaderView: View {
    var body: some View {
        HStack() {
            Image("WardLogo")
            Spacer()
            Image("Search")
        }
    }
}

struct TextClockView : View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment : .leading) {
                    Text("오늘 마감").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 24)).padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                    Text("얼마 안남은 행운을 즐겨 보세요").foregroundColor(Color(red: 118/255, green: 118/255, blue: 118/255)).fontWeight(.regular).font(.system(size: 14))
                }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                HStack {
                    //TODO : 임시 퍼블리싱 시간폰트수정, 마감시간 시간초 로직 추가
                    Text("09").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 20))
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .foregroundColor(Color(red: 37/255, green: 98/255, blue: 255/255))
                        .background(Color(red: 234/255, green: 240/255, blue: 255/255))
                        .clipShape(Circle())
                    Text(":").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 20)).foregroundColor(Color(red: 43/255, green: 99/255, blue: 241/255))
                    Text("11").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 20))
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .foregroundColor(Color(red: 239/255, green: 243/255, blue: 254/255))
                        .background(Color(red: 43/255, green: 99/255, blue: 241/255))
                        .clipShape(Circle())
                    Text(":").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 20)).foregroundColor(Color(red: 43/255, green: 99/255, blue: 241/255))
                    Text("03").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 20))
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .foregroundColor(Color(red: 239/255, green: 243/255, blue: 254/255))
                        .background(Color(red: 43/255, green: 99/255, blue: 241/255))
                        .clipShape(Circle())
                }
            }
            
        }
    }
}


struct ImageSlider : View {
    
    @State var imageSample : [String]
    
    var body: some View {
        TabView {
              ForEach(imageSample, id: \.self) { item in
                   Image(item)
//                      .resizable()
                      .scaledToFill()
                      .clipShape(RoundedRectangle(cornerRadius: 25))
                   
              }
          }
          .tabViewStyle(PageTabViewStyle())
          .frame(height : 200)
    }
}

struct SelectItemView : View {
    @State var selectedIndex = 0
    var items : [String]

    var body: some View {
        VStack(alignment : .leading) {
            Text("신발응모").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 24)).padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            HStack {
                ForEach(Array(zip(items.indices, items)), id : \.0) { index, item in
                    SelectButtonView(sliderText : item, myIndex : index, selectedIndex: $selectedIndex)
                }
                Spacer()
            }
            VStack {
                selectedIndex == 0 ? AnyView(PopularView()) : selectedIndex == 1 ? AnyView(TodayRegisterView()) : selectedIndex == 2 ? AnyView(OpenLaterView()) :
                selectedIndex == 3 ? AnyView(ReleaseConfirmView()) : AnyView(Text("None"))
            }
          
        }.background {
            Color.white
        }
    }
}

struct SelectButtonView : View {
    
    @State var isChecked:Bool = false
    var sliderText = ""
    var myIndex = 0
    @Binding var selectedIndex : Int
    
    var body: some View {
        Button(sliderText) {
            selectedIndex = myIndex
        }
        .foregroundColor(.white)
        .padding(.init(top: 8, leading: 10, bottom: 8, trailing: 10))
        .background(myIndex == selectedIndex ? Color(red: 0, green: 72/255, blue: 255/255) : Color(red: 210/255, green: 216/255, blue: 231/255))
        .clipShape(Capsule())
        
    }
}

struct PopularView : View {
    var body: some View {
        VStack(alignment : .leading) {
            //TODO : Components , ServerData, TabView
            PopularTableRowView()
            PopularTableRowView()
            PopularTableRowView()
            PopularTableRowView()
            PopularTableRowView()
            
            
        }
        .border(Color(red: 240/255, green: 240/255, blue: 240/255), width: 2).clipShape(RoundedRectangle(cornerRadius:8)).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct PopularTableRowView : View {
    var body: some View {
        HStack {
            Text("01").foregroundColor(.black).fontWeight(.semibold).font(.system(size: 18))
            
            //TODO : Image Server Data
            Image("PopularImage").resizable().frame(width : 50, height : 50).padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            VStack(alignment : .leading) {
                Text("브랜드명").foregroundColor(Color(red: 118/255, green: 118/255, blue: 118/255)).fontWeight(.semibold).font(.system(size: 14)).padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
                Text("제품명").foregroundColor(.black).fontWeight(.semibold).font(.system(size: 14))
            }
            Spacer()
            Image("HeartOff")
            
        }.padding()
        Divider().padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct TodayRegisterView : View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment : .top) {
                //TODO : ServerData
                OpenLaterTableView()
                OpenLaterTableView()
                OpenLaterTableView()
            }
            
        }
    }
}
struct OpenLaterTableView : View {
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



struct OpenLaterView : View {
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

struct ReleaseConfirmView : View {
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
    ReleaseMenuView()
}

