//
//  MainNavigationController.swift
//  Venture
//
//  Created by Tanner York on 11/1/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for items in self.navigationBar.titleTextAttributes! {
            print(items)
        }
    }
    

    

}
