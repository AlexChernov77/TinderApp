//
//  FVGirlFabrique.swift
//  fevronia
//
//  Created by Александр Чернов on 03.12.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import Foundation
import SwiftyJSON

class FVGirlFabrique {
    class func gerFromJSON (json: JSON) -> FBGirl {
        
        var workInfo = ""
        var education = ""
        
        let photos = NSMutableArray()
        for object in json["photos"].arrayValue {
            let Url = object["url"].stringValue
            photos.add(Url)
        }
        
        let teasersArray = json["teasers"].arrayValue
        if teasersArray.count != 0 {
            for teaser in teasersArray {
                let type = teaser["type"]
                if type == "job" || type == "position" || type == "jobPosition" {
                    workInfo = teaser["string"].stringValue
                } else if type == "school" {
                    education = teaser["string"].stringValue
                } 
            }
        }
        let id = json["_id"].stringValue
        let name = json["name"].stringValue
        let birth_date = json["birth_date"].stringValue
        let age = figureOutAge(birth: birth_date)
        let distance = json["distance_mi"].doubleValue
        let photoURL = json["photos"]["url"].stringValue
        
        photos.adding(photoURL)
        
        let fbGril = FBGirl(id: id, name: name, age: age, educationInfo: education, workInfo: workInfo, photos: photos, distance: distance)
        
        return fbGril
    }
}

extension FVGirlFabrique
{
    class func figureOutAge(birth date: String) -> Int
    {
        let dateFormatter = DateFormatter()
        let isoDateFormatter = ISO8601DateFormatter()
        let calendar = Calendar.current
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        guard let date = dateFormatter.date(from: date) else {return 0}
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let stringISO8610 = dateFormatter.string(from: date)
        
        guard let firstDate = isoDateFormatter.date(from: stringISO8610) else{return 0}
        let finalDate = Date()
        
        let dateBegin = calendar.startOfDay(for: firstDate)
        let dateEnd = calendar.startOfDay(for: finalDate)
        
        let years = calendar.dateComponents([.year], from: dateBegin, to: dateEnd)
        
        guard let yearsCount = years.year else {return 0}
        
        return yearsCount
    }
}

