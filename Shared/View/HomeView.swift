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
            
            ZStack {
                
                // if viewModel.currentTab != .Home {
                    
                _HomeContentView()
                    .opacity(viewModel.currentTab == .Home ? 1 : 0)
                    .offset(x: viewModel.currentTab == .Home ? 0 : 60)
                    .zIndex(viewModel.currentTab == .Home ? 1 : 0)
                    
                // } else {
                    
                    _HomeNewFeed()
                    .opacity(viewModel.currentTab == .NewFeed ? 1 : 0)
                    .offset(x: viewModel.currentTab == .NewFeed ? 0 : 60)
                    .zIndex(viewModel.currentTab == .NewFeed ? 1 : 0)
                    
                // }
                
            }
            
        }
            .environmentObject(viewModel)
    }
    
    fileprivate func _HomeContentView() -> some View {
        return ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20) {
                
                
                HomeSearchView()
                
                HomeBannerView()
                
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
