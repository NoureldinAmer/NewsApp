//
//  WebView.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-06-09.
//

import SwiftUI
import WebKit

struct ArticleWebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
       
       var url: URL
       
       func makeUIView(context: Context) -> WKWebView {
           let webView = WKWebView()
           webView.load(URLRequest(url: url))
           return webView
       }
       
       func updateUIView(_ uiView: WKWebView, context: Context) {
           
       }
    
}
