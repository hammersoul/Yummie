//
//  Created by Timofey Hammer on 2023-07-06.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
