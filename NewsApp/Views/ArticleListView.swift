//
//  ContentView.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-05-22.
//

import SwiftUI

struct ArticleListView: View {
    var articles: [Article]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articles) {article in
                    ArticleView(article: article)
                        .listRowInsets(.init(top: 0, leading: 0,bottom: 0, trailing: 0))
                }
                .onDelete(perform: delete)
                
            }
            .listStyle(.plain)
            .navigationTitle("News")
            
        }
        
        
    }
    
    func delete(at offsets: IndexSet) {
            print("hi")
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(articles: Article.previewData)
            .preferredColorScheme(.light)
    }
}

