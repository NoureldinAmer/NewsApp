//
//  test.swift
//  NewsApp
//
//  Created by Noureldin Amer on 2022-06-16.
//

import SwiftUI

struct test: View {
    var body: some View {
        Button {
            Task {
                do {
                    try await NewsAPI().fetch()
                } catch {
                    print("error")
                }
               
            }
            
        } label: {
            Text("fetch restults")
            
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
