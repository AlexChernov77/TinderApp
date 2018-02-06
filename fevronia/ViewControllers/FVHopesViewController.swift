//
//  FVHopesViewController.swift
//  fevronia
//
//  Created by Александр Чернов on 03.12.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import UIKit
import SDWebImage

class FVHopesViewController: UIViewController {
//
//    var girlsArray = NSMutableArray()
    var girlsIndex = 0
    var presenterInput: PresenterInput?
    var presenterOutput: PresenterOutPut?

    @IBOutlet weak var containerView: SwipableViews!
    
     let kCardNib = UINib(nibName: "FVGirlView", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DependencyInjector.assignPresenter(view: self)
        containerView.registerNib(nib: kCardNib)
        containerView.dataSource = self
        containerView.delegate = self
    }
  
    
    @IBAction func likeButtonPressed() {
        //API_WRAPPER.passLike(id: (self.girlsArray[girlsIndex] as! FBGirl).id)
        containerView.autoSwipe(direction: .right)
    }
    
    @IBAction func disLikeButtonPressed() {
       // API_WRAPPER.passDislike(id: (self.girlsArray[girlsIndex] as! FBGirl).id)
        containerView.autoSwipe(direction: .left)
    }
    
}

extension FVHopesViewController: ViewInput
{
    func assign(presenterInput: PresenterInput, presenterOutput: PresenterOutPut) {
        self.presenterInput = presenterInput
        self.presenterOutput = presenterOutput
        presenterInput.viewLoad(view: self)
    }
    
    func reloadData() {
        containerView.reloadData()
    }
    
    
}

extension FVHopesViewController : SwipableViewsDataSource, SwipableViewsDelegate
{
    func willSwiped(direction: swipeDirection, index: Int) {
        if direction == .left {
            DataLayer.passDislike(id: (presenterOutput?.entityAt(indexPath: index) as! FBGirl).id)
        } else {
            DataLayer.passLike(id: (presenterOutput?.entityAt(indexPath: index) as! FBGirl).id)
        }
        girlsIndex = index
        if index == ((presenterOutput?.numberOfEntities())! - 1) - 6 {
            presenterInput?.updateView()
        }
        containerView.reloadData()
    }
    
    func numberOfViews() -> Int
    {
         return presenterOutput != nil ? presenterOutput!.numberOfEntities() : 0
        
    }
    
    func view ( view : UIView , atIndex index : Int )
    {
        let model = presenterOutput?.entityAt(indexPath: index) as! FBGirl
        (view as! FBGirlView).configureSelf(dataModel: model)
    }
}
