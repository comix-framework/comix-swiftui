//
//  ContentView.swift
//  Shared
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            MainView()
            
        }
        .onAppear {
            
            UINavigationBar.appearance().isHidden = true
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
