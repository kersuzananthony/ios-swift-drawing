//
//  ViewController.swift
//  drawing app
//
//  Created by Kersuzan on 04/05/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonsView: UIStackView!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(showButtons), name: UIApplicationDidBecomeActiveNotification, object: nil)
    }

    func showButtons() {
        self.buttonsView.hidden = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.buttonsView.hidden = true
        
        if let touch = touches.first {
            let location = touch.locationInView(self.mainImageView)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.buttonsView.hidden = false
    }
    
    @IBAction func randomButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func yellowButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func redButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func greenButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func blueButtonPressed(sender: AnyObject) {
    }
}

