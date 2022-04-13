//
//  ImageView.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageView: View {
    
    @State var image: String
    
    init(_ src: String?) {
        
        self.image = src ?? ""
        
    }
    
    var body: some View {
        WebImage(url: URL(string: image))
            .resizable()
    }
}