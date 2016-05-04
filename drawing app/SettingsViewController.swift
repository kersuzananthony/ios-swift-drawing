//
//  SettingsViewController.swift
//  drawing app
//
//  Created by Kersuzan on 04/05/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var brushLabel: UILabel!
    
    var brushWidth: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = false
        self.slider.value = Float(brushWidth)
        updateBrushTextLabel()
    }
    
    func updateBrushTextLabel() {
        self.brushLabel.text = String(NSString(format: "%.2f", self.brushWidth))
    }
    
    @IBAction func erasePressed(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "erase", object: nil, userInfo: nil))
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func changeBrushSize(sender: UISlider) {
        var userInfo = [NSString: AnyObject]()
        userInfo["strokeWidth"] = sender.value
        self.brushWidth = CGFloat(sender.value)
        updateBrushTextLabel()
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "changeStrokeWidth", object: nil, userInfo: userInfo))
    }
    
    @IBAction func sharePressed(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "share", object: nil))
    }
}
