//
//  Article.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-05-22.
//

import Foundation

fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

struct Article: Codable, Equatable, Identifiable {
    
    // This id will be unique and auto generated from client side to avoid clashing of Identifiable in a List as NewsAPI response doesn't provide unique identifier
    let id = UUID()

    let source: Source
    let title: String
    let url: String
    let publishedAt: Date
    
    let author: String?
    let description: String?
    let urlToImage: String?
    
    
    enum CodingKeys: String, CodingKey {
        case source
        case title
        case url
        case publishedAt
        case author
        case description
        case urlToImage
    }
    
    var authorText: String {
        author ?? ""
    }
    
    var descriptionText: String {
        description ?? ""
    }
    
    var articleDate: String {
        relativeDateFormatter.localizedString(for: publishedAt, relativeTo: Date())
    }
    
    var captionText: String {
        "\(source.name) ‧ \(relativeDateFormatter.localizedString(for: publishedAt, relativeTo: Date()))"
    }
                                              
    
    
    var articleURL: URL {
        URL(string: url)!
    }
    
    var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
    
}

extension Article {
    
    //data to preview
    static var previewData: [Article] {
        
        //this is the local url to news.json
        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")!
        //this converts the contents into a bag of bits (if not successful, compilation error occurs)
        let data = try! Data(contentsOf: previewDataURL)
        
        //this decods json
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        //if not successful, error returned
        let apiResponse = try! jsonDecoder.decode(NewsAPIResponse.self, from: data)
        return apiResponse.articles ?? []
    }
    
}


struct Source: Codable, Equatable {
    let name: String
}
