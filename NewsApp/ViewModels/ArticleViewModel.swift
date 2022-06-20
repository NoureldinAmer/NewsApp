//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-06-09.
//

import SwiftUI

class ArticleListViewModel : ObservableObject {
    @Published var articles : [Article]
    
    var newsAPI = NewsAPI.shared
    
    init() {
        self.articles = []
    }
    
    // MARK: - Intent(s)
    func fetch(category: Category) async throws -> Void {
        Task {
            self.articles = try! await newsAPI.fetch(from: category)
        }
    }
}
