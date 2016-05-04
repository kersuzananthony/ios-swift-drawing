//
//  SettingsViewController.swift
//  drawing app
//
//  Created by Kersuzan on 04/05/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = false
    }
    
}
