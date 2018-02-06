//
//  PresenterOutPut.swift
//  fevronia
//
//  Created by Александр Чернов on 08.01.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import Foundation

protocol PresenterOutPut: class {
    func numberOfEntities() -> Int
    func entityAt ( indexPath : Int ) -> Any?
    func passLike( index: Int )
    func passDisLike( index: Int)
}
