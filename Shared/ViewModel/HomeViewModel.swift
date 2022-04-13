//
//  HomeViewModel.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var currentTab: HomeTab = .Home
    
}

enum HomeTab {
    
    case Home
    case NewFeed
    
}
