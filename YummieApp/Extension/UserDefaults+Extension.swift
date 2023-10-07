//
//  Created by Timofey Hammer on 2023-07-10.
//

import Foundation

extension UserDefaults {
    
    private enum UserDefaultsKeys: String {
        case hasOnboarder
    }
    
    var hasOnboarder: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarder.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarder.rawValue)
        }
    }
}
