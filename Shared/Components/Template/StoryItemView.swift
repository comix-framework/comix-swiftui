//
//  StoryItemView.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct StoryItemView: View {
    
    @EnvironmentObject var homeApp: HomeViewModel
    
    var story: Story
    @State var height: CGFloat = .zero
    
    @State var test: CGFloat = .zero
    
    var body: some View {
        
        NavigationLink {
            
            Color.green
            
        } label: {
            
            VStack {
                
                GeometryReader { proxy in
                    
                    // if proxy.size != .zero && homeApp.currentTab == .NewFeed {
                        
                        VStack {
                            
                            ImageView(story.avatar)
                                .scaledToFill()
                                .frame(width: proxy.size.width, height: 300)
                                .overlay(
                                    
                                    Text("HOT")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 6)
                                        .background(.red)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                        .offset(x: 20, y: 20)
                                    
                                    ,alignment: .topLeading
                                    
                                )
                            
                        //}
                        .onChange(of: proxy.size) { newSize in
                            
                            test = newSize.width
                            
                            height = newSize.width / 2
                            
                        }
                        
                    }
                    
                }
                .frame(height: height)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(story.name)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("TextColor"))
                        .lineLimit(2)
                    
                    HStack {
                        
                        Text("Chapter 20")
                        
                        Spacer()
                        
                        Text("12/04/2022")
                        
                    }
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                .padding(.bottom, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 7, x: 0, y: 0)
            
        }

        
    }
}

struct StoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
