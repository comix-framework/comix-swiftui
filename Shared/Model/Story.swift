//
//  Story.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct Story: Identifiable {
    var id: String
    var name: String
    var slug: String
    var avatar: String
    var countViews: Int
    var countChapters: Int
}

let _stories: [Story] = [
    
    Story(
        id: "1",
        name: "Luyện Võ Đỉnh Phong",
        slug: "url1",
        avatar: "https://img.webnovel.com/bookcover/14279238705852001",
        countViews: 1200,
        countChapters: 12
    ),
    Story(
        id: "2",
        name: "Cận Kề Tiếp Xúc",
        slug: "url1",
        avatar: "https://img.webnovel.com/bookcover/16189206605128401",
        countViews: 1200,
        countChapters: 12
    ),
    Story(
        id: "3",
        name: "Tại Hạ Là Thần Tình Yêu",
        slug: "url1",
        avatar: "https://img.webnovel.com/bookcover/11609847806441001",
        countViews: 1200,
        countChapters: 12
    ),
    Story(
        id: "4",
        name: "Tình Chàng 30",
        slug: "url1",
        avatar: "https://img.webnovel.com/bookcover/18253983706056201",
        countViews: 1200,
        countChapters: 12
    )

]
