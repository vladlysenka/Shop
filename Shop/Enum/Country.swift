// Created by Vlad Lysenka 09.08.2024 

import SwiftUI

enum Country: String, Codable {
    case france = "Франция"
    
    var image: String {
        switch self {
        case .france: "🇫🇷"
        }
    }
}
