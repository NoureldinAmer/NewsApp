//
//  BookmarkTabView.swift
//  NewsApp
//
//  Created by Noureldin Amer on 6/27/21.
//

import SwiftUI

struct BookmarkTabView: View {
    
    @EnvironmentObject var articleBookmarkVM: ArticleBookmarkViewModel
    
    var body: some View {
        let articles = self.articles
        
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
            .navigationTitle("Saved Stories")
        }
    }
    
    private var articles: [Article] {
        articleBookmarkVM.bookmarks  
    }
}

struct BookmarkTabView_Previews: PreviewProvider {
    
    @StateObject static var articleBookmarkVM = ArticleBookmarkViewModel.shared

    static var previews: some View {
        BookmarkTabView()
            .environmentObject(articleBookmarkVM)
    }
}
    
