//
//  ContentView.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-05-22.
//

import SwiftUI

struct ArticleListView: View {
    @ObservedObject var articlesList: ArticleListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articlesList.articles) {article in
                    NavigationLink{
                        ArticleWebView(url: article.articleURL)
                    }label: {
                        ArticleView(article: article)
                            .listRowInsets(.init(top: 0, leading: 0,bottom: 0, trailing: 0))
                    }
                }
                .onDelete(perform: delete)
                
            }
            .listStyle(.plain)
            .navigationTitle("News")
            .task {
                try? await articlesList.fetch(category: .general)
            }
        }
    }
    
    
    func delete(at offsets: IndexSet) {
        print("hi")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(articlesList: ArticleListViewModel())
        
//        ArticleListView(articles: Article.previewData)
//            .preferredColorScheme(.light)
    }
}
