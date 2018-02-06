//
//  FBGirl.swift
//  fevronia
//
//  Created by Александр Чернов on 03.12.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import Foundation

class FBGirl {
    var id: String
    var name: String
    var age: Int
    var educationInfo: String
    var workInfo: String
    var photos: NSArray
    var distance: Double
    
    init(id: String, name: String, age: Int, educationInfo: String, workInfo: String, photos: NSArray, distance: Double) {
        self.id = id
        self.name = name
        self.age = age
        self.educationInfo = educationInfo
        self.workInfo = workInfo
        self.photos = photos
        self.distance = distance
    }
}
