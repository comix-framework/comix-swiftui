//
//  HomeView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            
            HomeAppBarView()
            
            TabView(selection: $viewModel.currentTab) {
                
                _HomeContentView()
                    .tag(HomeTab.Home)
                
                _HomeNewFeed()
                    .tag(HomeTab.NewFeed)
                
            }
            .tabViewStyle(PageTabViewStyle())
            
        }
            .environmentObject(viewModel)
    }
    
    fileprivate func _HomeContentView() -> some View {
        return ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20) {
                
                
                HomeSearchView()
                
                HomeBannerView()
                
                HomeCategoriesView()
                    .padding(.top, 5)
                
                HomeTopViewsView()
                
                HomeCompletedView()
                
                
            }
            .padding(.horizontal, 20)
            
        }
        .background(Color.white)
    }
    
    fileprivate func _HomeNewFeed() -> some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20) {
                
                
                HomeUpdatedView()
                    .padding(.top)
                
            }
            .padding(.horizontal, 20)
            
        }
        .background(Color.white)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
