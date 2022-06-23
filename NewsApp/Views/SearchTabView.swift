//
//  SearchTabView.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-06-22.
//

import SwiftUI

struct SearchTabView: View {
    @StateObject var searchVM = ArticleSearchViewModel.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articles) {article in
                    NavigationLink{
                        ArticleWebView(url: article.articleURL)
                            .edgesIgnoringSafeArea(.all)
                    }label: {
                        ArticleView(article: article)
                            .listRowInsets(.init(top: 0, leading: 0,bottom: 0, trailing: 0))
                            .edgesIgnoringSafeArea(.bottom)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Search")
        }
        .searchable(text: $searchVM.searchQuery)
        .onChange(of: searchVM.searchQuery) { newValue in
            if newValue.isEmpty {
                searchVM.phase = .empty
            }
        }
        .onSubmit(of: .search, search)
    }
    
    private var articles: [Article] {
        if case .success(let articles) = searchVM.phase {
            return articles
        } else {
            return []
        }
    }
    
    private func search() {
        let searchQuery = searchVM.searchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        if !searchQuery.isEmpty {
            searchVM.addHistory(searchQuery)
        }
        
        Task {
            await searchVM.searchArticle()
        }
    }
}

struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView()
    }
}
