//
//  Created by Timofey Hammer on 2023-07-03.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    
    var slides: [OnboardingSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        
    }
}
