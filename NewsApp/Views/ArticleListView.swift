//
//  ArticleListView.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-06-18.
//

import SwiftUI

struct ArticleListView: View {
    @StateObject var articles = ArticleListViewModel()
    @State var newsCategory : Category = .general
    
    var body: some View {
        NavigationView {
            VStack {
                newsCategories.padding(.vertical, 2.0)
                List {
                    ForEach(articles.articles) {article in
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
                .navigationTitle("Trending News")
                .task {
                    if articles.articles.isEmpty {
                        try? await articles.fetch(category: newsCategory)
                    }
                }
                .refreshable {
                    do {
                        try await articles.fetch(category: newsCategory)
                    }
                    catch {
                        return
                    }
                    
                    
                }
                
            }
            
        }
    }
    
    
    func delete(at offsets: IndexSet) {
        print("hi")
    }
    
    var newsCategories : some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Category.allCases, id: \.self) { genre in
                    Button {
                        newsCategory = genre
                        print(newsCategory.text)
                        print(newsCategory.rawValue)
                        Task {
                            try? await articles.fetch(category: newsCategory)
                        }
                    } label: {
                        Text(genre.text)
                    }
                    .buttonStyle(.bordered)
                    .padding(.leading, 5)
                    .onTapGesture {
                        
                    }
                }
            }
        }
    }
}


struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
            .preferredColorScheme(.dark)
        ArticleListView()
            .preferredColorScheme(.light)
            
    }
}
