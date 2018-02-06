//
//  CreateRequest.swift
//  fevronia
//
//  Created by Александр Чернов on 08.01.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import Foundation

class CreateRequest {
    class func makeRequest ( urlString: String ) -> URLRequest {
        let url = URL(string: urlString)!
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.setValue(FVConst.URLMisc.kAccesToken, forHTTPHeaderField: "x-auth-token")
        return urlRequest as URLRequest
    }
}
