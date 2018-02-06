//
//  Presenter.swift
//  fevronia
//
//  Created by Александр Чернов on 08.01.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import UIKit

class Presenter: NSObject
{
   
     weak var viewInput: ViewInput?
    var dataSource = NSMutableArray()
    func getData () {
            DataLayer.gerGirlsToFuck(success: { (array) in
                self.dataSource = array as! NSMutableArray
                self.viewInput?.reloadData()
            }) { (error) in
                
        }
    }
}

extension Presenter: PresenterInput
{
    func updateView() {
            DataLayer.gerGirlsToFuck(success: { (array) in
                self.dataSource.addObjects(from: array as! [Any])
                print(self.dataSource.count)
            }) { (error) in
                
            }
    }
    
    func viewLoad(view: ViewInput) {
        self.viewInput = view
        getData()
    }
}

extension Presenter: PresenterOutPut {
    func numberOfEntities() -> Int {
        return self.dataSource.count
    }
    
    func entityAt(indexPath: Int) -> Any? {
        
        if self.dataSource.count - 1 < indexPath
        {
            return nil
        }
        else
        {
            return self.dataSource[indexPath]
        }
    }
    
    func passLike( index: Int) {
        DataLayer.passLike(id: (self.dataSource[index] as! FBGirl).id )
    }
    
    func passDisLike( index: Int) {
        DataLayer.passDislike(id: (self.dataSource[index] as! FBGirl).id)
    }
    
    
}
