//
//  MainTabView.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var mainApp: MainViewModel
    
    @State var baseOffset: CGFloat
    
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Button {
                
                withAnimation(.spring()) {
                    mainApp.showMenu.toggle()
                }
            
            } label: {
                
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal, 20)

            
            Group {
                
                Button {
                    
                } label: {
                    
                    ImageView("https://lh3.googleusercontent.com/ogw/ADea4I5v7BxfpIZM29kxVScZ_7Kg6nH7XgovzklB0MzQ")
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                }
                
                Text("Nguyên Trần")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.title)
                    .padding(.top, 5)
                
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            
            VStack(alignment: .leading, spacing: 10) {
                
                MainTabBuilder(tab: .Home, title: "Trang Chủ")
                
                MainTabBuilder(tab: .Categories, title: "Thể Loại")
                
                MainTabBuilder(tab: .Ranking, title: "Xếp Hạng")
                
                MainTabBuilder(tab: .Setting, title: "Cài Đặt")
                
            }
            .padding(.top, 15)

            
        }
        //.padding(.horizontal, 20)
        .padding(.top)
        .frame(maxWidth: baseOffset - 100, alignment: .leading)
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .offset(x: mainApp.showMenu ? 0 : -(baseOffset - 100))
    }
    
    
    @ViewBuilder
    func MainTabBuilder(tab: MainTab, title: String) -> some View {
        
        Button {
            
            withAnimation {
                
                mainApp.currentTab = tab
                
            }
            
        } label: {
            
            HStack {
                
                Image(systemName: tab.rawValue)
                    .font(.title2)
                
                Text(title)
                    .fontWeight(.semibold)
                
            }
            .foregroundColor(mainApp.currentTab != tab ? .white : Color("MainStartColor"))
            .padding(.vertical, 10)
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                
                Group {
                    
                    if mainApp.currentTab == tab {
                        
                        Color.white
                            .clipShape(BorderOnlyShape(radius: 20, corners: [.bottomRight, .topRight]))
                            .matchedGeometryEffect(id: "MAIN_TAB", in: animation)
                        
                    }
                    
                }
            
            )
            
        }

        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
