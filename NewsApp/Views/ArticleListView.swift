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
                                .edgesIgnoringSafeArea(.all)
                        }label: {
                            ArticleView(article: article)
                                .listRowInsets(.init(top: 0, leading: 0,bottom: 0, trailing: 0))
                                .edgesIgnoringSafeArea(.bottom)
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
                .navigationBarItems(
                    leading: Button(action: {
                        // Actions
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundColor(.secondary)
                    }),

                    trailing: Button(action: {
                    // Actions
                    }, label: {
                        Image(systemName: "bookmark")
                            .imageScale(.large)
                            .foregroundColor(.secondary)
                            .padding()
                    })
                )
            }
        }
    }
    
    
    func delete(at offsets: IndexSet) {
        print("hi")
    }
    
    
    @State var selectedTab: Category = .general
    @Namespace var tabAnimation
    
    var newsCategories : some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Category.allCases, id: \.self) { tab in
                    Button {
                        guard tab != newsCategory else {return}
                        newsCategory = tab
                        Task {
                            try? await articles.fetch(category: newsCategory)
                        }
                        
                        withAnimation (Animation.interactiveSpring()) {
                            selectedTab = tab
                        }
                    } label: {
                        ZStack {
                            Text(tab.text)
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(.secondary)
                                .bold()
                                .padding(8)
                                .background(
                                    tab == selectedTab ? .pink.opacity(0.5) : .clear
                                )
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal, 5.0)
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
