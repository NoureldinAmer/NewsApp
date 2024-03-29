//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-06-09.
//

import SwiftUI

enum DataFetchPhase<T> {
    
    case empty
    case success(T)
    case failure(Error)
}

@MainActor
class ArticleListViewModel : ObservableObject {
    @Published var articles : [Article]
    
    var newsAPI = NewsAPI.shared
    
    init() {
        self.articles = []
    }
    
    // MARK: - Intent(s)
    func fetch(category: Category) async throws -> Void {
        var articlesTemp = [Article]()
        Task {
            articlesTemp = try! await newsAPI.fetch(from: category)
        }
        articles = articlesTemp
    }
}
