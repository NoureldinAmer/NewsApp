//
//  ApiResponse.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-06-06.
//

import Foundation

struct NewsAPIResponse: Codable {
    let status: String
    let totalResults: Int?
    let articles: [Article]?

    //code message if error occurs
    let code: String?
    let message: String?
}
