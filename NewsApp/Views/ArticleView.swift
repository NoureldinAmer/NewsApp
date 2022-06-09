//
//  ArticleView.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-05-23.
//


import SwiftUI

struct ArticleView: View {
    let article: Article
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                articleImage
                VStack(alignment: .leading) {
                    articleHeader
                    Spacer()
                    articleSource
                }
            }
            Spacer()
        }
    }
    
    
    var articleHeader: some View {
        Text(article.title)
            .font(.headline)
            .padding(.trailing, 2.9)

    }
    
    var articleImage: some View {
        AsyncImage(url: article.imageURL) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 100)
    }
    
    var articleSource: some View {
        Text(article.source.name)
            .font(.footnote)
            .foregroundColor(.secondary)
    }
}






    



struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ArticleView(article: Article.previewData[0])
                .listRowInsets(.init(top: 3, leading: 0,bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        
        
    }
}


