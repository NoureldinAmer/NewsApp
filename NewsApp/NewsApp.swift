//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-05-22.
//

import SwiftUI

@main
struct NewsApp: App {
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ArticleListView(articles: ArticleListViewModel())
                .environmentObject(articleBookmarkVM)
        }
    }
}
