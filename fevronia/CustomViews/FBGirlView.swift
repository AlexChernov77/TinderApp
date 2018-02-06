//
//  FBGirlView.swift
//  fevronia
//
//  Created by Александр Чернов on 03.12.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import UIKit

//MARK
class FBGirlView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    var cell: FVGirlViewCell!
    var indexGirl = 0
    @IBOutlet weak var disLikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
//    var likeClosure : ((FBGirl) -> Void )!
//    var dislikeClosure : ((FBGirl) -> Void )!
//    var model : FBGirl!
    
    var dataSource = NSArray()
    let kFapPhotoNIB = UINib(nibName: "FVGirlViewCell", bundle: nil)
    let kFapPhotoCellReuseIdentifer = "kFapPhotoCellReuseIdentifier"
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(kFapPhotoNIB, forCellWithReuseIdentifier: kFapPhotoCellReuseIdentifer)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configureSelf ( dataModel: FBGirl) {
//        likeClosure = like
//        dislikeClosure = dislike
//        self.model = dataModel
        
        dataSource = dataModel.photos
        nameLabel.text = dataModel.name + ", " + "\(dataModel.age)"
        workLabel.text = dataModel.workInfo
        educationLabel.text = dataModel.educationInfo
        let distanceKm = dataModel.distance * 1.61
        distanceLabel.text = "В \(Int(distanceKm)) км от вас"

        
        collectionView.reloadData()
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        let indexPathArray = collectionView.indexPathsForVisibleItems as NSArray
        let currentIndexPath = indexPathArray.object(at: 0) as! IndexPath
        print(currentIndexPath)
        let nextIndexPath = IndexPath(item: currentIndexPath.item + 1, section: 0)
        if nextIndexPath.row < dataSource.count {
            collectionView.scrollToItem(at: nextIndexPath, at: .right, animated: true)
        }
    }
    
    @IBAction func leftButtonPressed(_ sender: UIButton) {
        let indexPathArray = collectionView.indexPathsForVisibleItems as NSArray
        let currentIndexPath = indexPathArray.object(at: 0) as! IndexPath
        print(currentIndexPath)
        let nextIndexPath = IndexPath(item: currentIndexPath.item - 1, section: 0)
        if nextIndexPath.row >= 0 {
            collectionView.scrollToItem(at: nextIndexPath, at: .left, animated: true)
        }
    }
    
//    @IBAction func disLikeButtonPressed(_ sender: UIButton) {
//        dislikeClosure(model)
//    }
//
//    @IBAction func likeButtonPressed(_ sender: UIButton) {
//        likeClosure(model)
//    }
    
}



//MARK:- процедуры Delegate, dataSource

extension FBGirlView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: kFapPhotoCellReuseIdentifer, for: indexPath) as! FVGirlViewCell
       cell.configureSelf(imageUrl: dataSource[indexPath.item] as! String)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

