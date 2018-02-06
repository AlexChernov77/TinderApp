//
//  PresenterInput.swift
//  fevronia
//
//  Created by Александр Чернов on 08.01.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import Foundation

protocol PresenterInput: class {
    func viewLoad (view : ViewInput)
    func updateView ()
}
