//
//  ArticleView.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-05-23.
//


import SwiftUI

struct ArticleView: View {
    @EnvironmentObject var articleBookmarkVM: ArticleBookmarkViewModel
    @State var bookmarkIconTapped = false
    
    let article: Article
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                articleImage
                VStack(alignment: .leading) {
                    HStack {
                        articleDate
                        Spacer()
                         Image(systemName: "bookmark")
                            .foregroundColor(bookmarkIconTapped ? .pink : .secondary)
                            .onTapGesture {
                                withAnimation {
                                    bookmarkIconTapped.toggle()
                                }
                                if bookmarkIconTapped {
                                    articleBookmarkVM.addBookmark(for: article)
                                } else {
                                    articleBookmarkVM.removeBookmark(for: article)
                                }
                                
                            }
                    }
                    
                    articleHeader
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
        .cornerRadius(5)
    }
    
    var articleSource: some View {
        Text(article.source.name)
            .font(.footnote)
            .foregroundColor(.secondary)
    }
    
    var articleDate: some View {
        Text(article.captionText)
            .font(.footnote)
            .foregroundColor(.secondary)
    }
}






struct ArticleView_Previews: PreviewProvider {
    @StateObject static var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
  
    
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
        .environmentObject(articleBookmarkVM)
    }
}


