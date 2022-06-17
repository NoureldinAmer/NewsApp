//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-05-22.
//

import SwiftUI

@main
struct NewsApp: App {
    var body: some Scene {
        WindowGroup {
            ArticleListView()
            //ArticleListView(articles: Article.previewData)
        }
    }
}
