//
//  Created by Timofey Hammer on 2023-07-06.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me/"
    
    case temp
    
    var description: String {
        switch self {
            case .temp: return "/temp"
        }
    }
}
