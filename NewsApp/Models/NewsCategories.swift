import Foundation

enum Category: String, CaseIterable, Identifiable {
    case general
    case business
    case technology
    case entertainment
    case sports
    case science
    case health
    
    var text: String {
        if self == .general {
            return "Latest"
        }
        return rawValue.capitalized
    }
    
    var id: Self { self }
}

