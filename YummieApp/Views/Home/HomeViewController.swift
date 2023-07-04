//
//  Created by Timofey Hammer on 2023-07-04.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "idl", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "idl", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "idl", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "idl", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "idl", name: "Africa Dish", image: "https://picsum.photos/100/200")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: categories[indexPath.row])
        
        return cell
    }
}
