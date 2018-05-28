//
//  ViewController.swift
//  InstagramSearchPage
//
//  Created by nilomi on 5/25/18.
//  Copyright © 2018 nilomi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, GridLayoutDelegate {
    var arrImages = [#imageLiteral(resourceName: "image1"),#imageLiteral(resourceName: "image2"),#imageLiteral(resourceName: "image3"),#imageLiteral(resourceName: "image4"),#imageLiteral(resourceName: "image5"),#imageLiteral(resourceName: "image6"),#imageLiteral(resourceName: "image7"),#imageLiteral(resourceName: "image8"),#imageLiteral(resourceName: "image9"),#imageLiteral(resourceName: "image10"),#imageLiteral(resourceName: "image11"),#imageLiteral(resourceName: "image12"),#imageLiteral(resourceName: "image13"),#imageLiteral(resourceName: "image14"),#imageLiteral(resourceName: "image15"),#imageLiteral(resourceName: "image16"),#imageLiteral(resourceName: "image17"),#imageLiteral(resourceName: "image18"),#imageLiteral(resourceName: "image19"),#imageLiteral(resourceName: "image1")]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var gridLayout: GridLayout!
    var arrInstaBigCells = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        arrImages.append(contentsOf: arrImages)
        arrImages.append(contentsOf: arrImages)
        arrImages.append(contentsOf: arrImages)

        arrInstaBigCells.append(1)
        var tempStorage = false
        for _ in 1...21 {
            if(tempStorage){
                arrInstaBigCells.append(arrInstaBigCells.last! + 10)
            } else {
                arrInstaBigCells.append(arrInstaBigCells.last! + 8)
            }
            tempStorage = !tempStorage
        }
        
        print(arrInstaBigCells)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.contentOffset = CGPoint(x: -10, y: -10)
        
        gridLayout.delegate = self
        gridLayout.itemSpacing = 3
        gridLayout.fixedDivisionCount = 3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 99
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
          cell.imgView.image = arrImages[indexPath.row]
        return cell
    }
    
    // MARK: - PrimeGridDelegate
    
    func scaleForItem(inCollectionView collectionView: UICollectionView, withLayout layout: UICollectionViewLayout, atIndexPath indexPath: IndexPath) -> UInt {
        if(arrInstaBigCells.contains(indexPath.row) || (indexPath.row == 1)){
            return 2
        } else {
            return 1
        }
    }
    
    func itemFlexibleDimension(inCollectionView collectionView: UICollectionView, withLayout layout: UICollectionViewLayout, fixedDimension: CGFloat) -> CGFloat {
        return fixedDimension
    }
}

