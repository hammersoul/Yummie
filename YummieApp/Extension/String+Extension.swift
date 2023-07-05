//
//  Created by Timofey Hammer on 2023-07-04.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
