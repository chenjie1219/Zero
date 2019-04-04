//
//  ViewController.swift
//  iOS-URLSchemes
//
//  Created by mac on 2019/4/4.
//  Copyright © 2019 Jason. All rights reserved.
//

import UIKit
import URLSchemes

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        URLSchemes().checkApp { (apps) in
            
            print(apps)
            
        }
        
    }


}

