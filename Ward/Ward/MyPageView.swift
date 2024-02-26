//
//  MyPageView.swift
//  Ward
//
//  Created by 강신규 on 2/26/24.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        ScrollView{
            VStack {
                HStack() {
                    Image("WardLogo")
                    Spacer()
                }
                Divider()
                MyInfoView()
                MyApplyHistoryView()
                MyActivityView()
                EtcView()
            }.padding(.horizontal, 12)
   
            
        }
    }
}

struct MyInfoView: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            //TODO : Image , NickName 개인정보값으로 변경
            Image(systemName: "").frame(width: 100, height : 100).background{ Color.mainGray }.clipShape(Circle())
            Text("닉네임").foregroundColor(.black).fontWeight(.bold).font(.system(size: 16)).padding(.top, 5)
        }.padding(.top, 24)
    }
}

struct MyApplyHistoryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            //TODO : Image , NickName 개인정보값으로 변경
            HStack{
                Text("나의 응모 내역").foregroundColor(.black).fontWeight(.bold).font(.system(size: 16)).padding(.top, 5)
                Spacer()
            }
        
            HStack {
                VStack{
                    Text("0").foregroundColor(.black).fontWeight(.bold).font(.system(size: 16))
                    Text("진행").foregroundColor(.black).fontWeight(.regular).font(.system(size: 16)).padding(.top, 2)
                }
                Spacer()
                VStack{
                    Text("0").foregroundColor(.black).fontWeight(.bold).font(.system(size: 16))
                    Text("당첨자 발표").foregroundColor(.black).fontWeight(.regular).font(.system(size: 16)).padding(.top, 2)
                }
                Spacer()
                VStack{
                    Text("0").foregroundColor(.black).fontWeight(.bold).font(.system(size: 16))
                    Text("마감").foregroundColor(.black).fontWeight(.regular).font(.system(size: 16)).padding(.top, 2)
                }
                
            }.padding(.vertical,24).padding(.horizontal, 56).background{
                Color.mainGray
            }.clipShape(RoundedRectangle(cornerRadius:12))
  
        }.padding(.top, 24).background{
            
        }
    }
}


struct MyActivityView: View {
    var body: some View {
        VStack(alignment: .leading) {
            //TODO : Image , NickName 개인정보값으로 변경
            HStack{
                Text("나의 활동").foregroundColor(Color.darkGray).fontWeight(.bold).font(.system(size: 14)).padding(.top, 5)
                Spacer()
            }
        
            
            //TODO : Component화
            HStack(alignment: .center) {
                Text("리뷰남기기").foregroundColor(.black).fontWeight(.bold).font(.system(size: 16)).padding(.top, 5)
                Spacer()
                Image("chevronRight")
                
            }.padding(.vertical,12)
            Divider()
            
            HStack(alignment: .center) {
                Text("리뷰남기기").foregroundColor(.black).fontWeight(.bold).font(.system(size: 16)).padding(.top, 5)
                Spacer()
                Image("chevronRight")
                
            }.padding(.vertical,12)
            Divider()
            
  
        }.padding(.top, 24).background{
            
        }
    }
}

struct EtcView: View {
    var body: some View {
        VStack(alignment: .leading) {
            //TODO : Image , NickName 개인정보값으로 변경
            HStack{
                Text("기타").foregroundColor(Color.darkGray).fontWeight(.bold).font(.system(size: 14)).padding(.top, 5)
                Spacer()
            }
        
            //TODO : Component화
            HStack(alignment: .center) {
                Text("공지사항").foregroundColor(.black).fontWeight(.bold).font(.system(size: 16)).padding(.top, 5)
                Spacer()
                Image("chevronRight")
                
            }.padding(.vertical,12)
            Divider()
            
            HStack(alignment: .center) {
                Text("로그아웃").foregroundColor(.black).fontWeight(.bold).font(.system(size: 16)).padding(.top, 5)
                Spacer()
                Image("chevronRight")
                
            }.padding(.vertical,12)
            Divider()
            
  
        }.padding(.top, 24).background{
            
        }
    }
}














#Preview {
    MyPageView()
}
