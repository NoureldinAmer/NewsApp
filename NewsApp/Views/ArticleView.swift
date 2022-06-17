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
            .font(.title2)
            .padding(.trailing, 2.9)
            .lineLimit(3)

    }
    
    var articleImage: some View {
        AsyncImage(url: article.imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 100)
        .clipped()
    }
    
    var articleSource: some View {
        Text(article.source.name)
            .font(.footnote)
            .foregroundColor(.secondary)
    }
}






struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        List {
            NavigationLink {
                ArticleWebView(url: Article.previewData[0].articleURL)
            } label: {
                ArticleView(article: Article.previewData[0])
                    .listRowInsets(.init(top: 3, leading: 0,bottom: 0, trailing: 0))
                
            }
            
        }
        .listStyle(.plain)
        
        
        }
    }
}


