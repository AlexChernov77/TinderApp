//
//  DependencyInjector.swift
//  fevronia
//
//  Created by Александр Чернов on 08.01.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import Foundation
class DependencyInjector {
    class func assignPresenter ( view: ViewInput) {
        if (view is FVHopesViewController) {
            let presenter = Presenter()
            view.assign(presenterInput: presenter, presenterOutput: presenter)
        }
    }
}
