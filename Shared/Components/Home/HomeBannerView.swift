//
//  HomeBannerView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct HomeBannerView: View {
    var body: some View {
        
        ImageView("https://i.imgur.com/8wsyU0K.jpg")
            .scaledToFill()
            .cornerRadius(20)
        
    }
}

struct HomeBannerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
