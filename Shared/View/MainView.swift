//
//  MainView.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    @State var baseOffset: CGFloat = 280
    
    var body: some View {
       
        ZStack(alignment: .topLeading) {
            
            //NavigationView {
                
                ZStack {
                    
                    HomeView()
                        .disabled(viewModel.currentTab != .Home)
                        .opacity(viewModel.currentTab == .Home ? 1 : 0)
                    
                    Color.red
                        .disabled(viewModel.currentTab != .Categories)
                        .opacity(viewModel.currentTab == .Categories ? 1 : 0)
                    
                    Color.blue
                        .disabled(viewModel.currentTab != .Ranking)
                        .opacity(viewModel.currentTab == .Ranking ? 1 : 0)
                    
                    Color.green
                        .disabled(viewModel.currentTab != .Setting)
                        .opacity(viewModel.currentTab == .Setting ? 1 : 0)
                    
                }
                
            //}
            .padding(.vertical, viewModel.showMenu ? 15 : 0)
            .padding(.horizontal, viewModel.showMenu ? 5 : 0)
            .background {
                
                Color.white
                    .cornerRadius( viewModel.showMenu ? 20 : 0)
                
            }
            .scaleEffect(viewModel.showMenu ? 0.9 : 1)
            .offset(x: viewModel.showMenu ? baseOffset : 0)
            .disabled(viewModel.showMenu)
            .zIndex(1)
            .onTapGesture {
                if viewModel.showMenu {
                    
                    withAnimation(.spring()) {
                        viewModel.showMenu.toggle()
                    }
                    
                }
            }
            
            Color.white
                .cornerRadius(viewModel.showMenu ? 20 : 0)
                .offset(x: viewModel.showMenu ? baseOffset - 10 : 0)
                .scaleEffect(viewModel.showMenu ? 0.83 : 1)
                .opacity(viewModel.showMenu ? 0.7 : 0)
                .zIndex(0)
            
            
            Color.white
                .cornerRadius(viewModel.showMenu ? 20 : 0)
                .offset(x: viewModel.showMenu ? baseOffset - 55 : 0)
                .scaleEffect(viewModel.showMenu ? 0.75 : 1)
                .opacity(viewModel.showMenu ? 0.7 : 0)
                .zIndex(0)
            
            MainTabView(baseOffset: baseOffset)
            
        }
        .background(
            
            LinearGradient(colors: [Color("MainStartColor"), Color("MainEndColor")], startPoint: .leading, endPoint: .trailing)
                .opacity( viewModel.showMenu ? 1 : 0 )
                .ignoresSafeArea()
        
        )
        .environmentObject(viewModel)
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
