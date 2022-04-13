//
//  MainViewAppBar.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct HomeAppBarView: View {
    
    @EnvironmentObject var mainApp: MainViewModel
    @EnvironmentObject var homeApp: HomeViewModel
    
    @Namespace var animation
    
    var body: some View {
        
        HStack {
            
            Button {
                
                withAnimation(.spring()) {
                    mainApp.showMenu.toggle()
                }
                
            } label: {
                
                Image(systemName: "line.3.horizontal")
                    .font(.title3)
                
            }
            .foregroundColor(.primary)

            
            Spacer()
            
            
            HStack(spacing: 15) {
                
                _HomeTabView(title: "Home", tab: .Home)
                
                _HomeTabView(title: "NewFeed", tab: .NewFeed)

                
            }
            .font(.subheadline)
            
            Spacer()
            
            Button {
                
            } label: {
                
                ImageView("https://lh3.googleusercontent.com/ogw/ADea4I5v7BxfpIZM29kxVScZ_7Kg6nH7XgovzklB0MzQ")
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
            }

            
        }
        .padding(.bottom, 5)
        .padding(.horizontal, 20)
        
    }
    
    fileprivate func _HomeTabView(title: String, tab: HomeTab) -> some View {
        return Button {
            
            withAnimation(.spring()) {
                homeApp.currentTab = tab
            }
            
        } label: {
            
            Text(title)
                .foregroundColor(homeApp.currentTab == tab ? Color("TextColor") : .secondary)
                .overlay(
                
                    Group {
                        
                        if homeApp.currentTab == tab {
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color("MainStartColor"))
                                .frame(height: 3)
                                .offset(y: 7)
                                .matchedGeometryEffect(id: "HOME_TAB", in: animation)
                            
                        }
                        
                    }
                    
                    ,alignment: .bottom
                    
                )
            
        }
    }
    
}

struct HomeAppBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}
