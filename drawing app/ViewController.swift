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
    
    var lastPoint = CGPoint.zero
    var strokeWidth: CGFloat = 10.0
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(showButtons), name: UIApplicationDidBecomeActiveNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(eraseAll), name: "erase", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(changeStrokeWidth), name: "changeStrokeWidth", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(shareArt), name: "share", object: nil)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.buttonsView.hidden = true
        
        if let touch = touches.first {
            let location = touch.locationInView(self.mainImageView)
            self.lastPoint = location
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.locationInView(self.mainImageView)
            
            drawBetweenPoints(self.lastPoint, secondPoint: point)
            
            self.lastPoint = point
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.buttonsView.hidden = false
        
        if let touch = touches.first {
            let point = touch.locationInView(self.mainImageView)
            
            drawBetweenPoints(self.lastPoint, secondPoint: point)
        }

    }
    
    func drawBetweenPoints(firstPoint: CGPoint, secondPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.mainImageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        self.mainImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: self.mainImageView.frame.size.width, height: self.mainImageView.frame.size.height))
        
        CGContextMoveToPoint(context, firstPoint.x, firstPoint.y)
        CGContextAddLineToPoint(context, secondPoint.x, secondPoint.y)
        CGContextSetLineWidth(context, strokeWidth)
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetRGBStrokeColor(context, self.red, self.green, self.blue, 1)
        
        
        CGContextStrokePath(context)
        
        self.mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()

    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToSettings" {
            if let destinationVC = segue.destinationViewController as? SettingsViewController {
                destinationVC.brushWidth = self.strokeWidth
            }
        }
    }
    

    func changeStrokeWidth(notification: NSNotification) {
        if let width = notification.userInfo?["strokeWidth"] as? CGFloat {
            self.strokeWidth = width
        }
    }
    
    func shareArt() {
        if let image = self.mainImageView.image {
            let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            
            self.presentViewController(activityVC, animated: true, completion: nil)
        }
    }
    
    func generateRandomNumber() -> CGFloat {
        return CGFloat(arc4random_uniform(256))
    }
    
    @IBAction func randomButtonPressed(sender: AnyObject) {
        self.red = generateRandomNumber() / 255.0
        self.green = generateRandomNumber() / 255.0
        self.blue = generateRandomNumber() / 255.0
    }
    
    @IBAction func yellowButtonPressed(sender: AnyObject) {
        self.red = 249.0 / 255.0
        self.green = 215.0 / 255.0
        self.blue = 23.0 / 255.0
    }
    
    @IBAction func redButtonPressed(sender: AnyObject) {
        self.red = 229.0 / 255.0
        self.green = 56.0 / 255.0
        self.blue = 56.0 / 255.0
    }
    
    @IBAction func greenButtonPressed(sender: AnyObject) {
        self.red = 37.0 / 255.0
        self.green = 235.0 / 255.0
        self.blue = 114.0 / 255.0
    }
    
    @IBAction func blueButtonPressed(sender: AnyObject) {
        self.red = 56.0 / 255.0
        self.green = 109.0 / 255.0
        self.blue = 229.0 / 255.0
    }
    
    func showButtons() {
        self.buttonsView.hidden = false
    }
    
    func eraseAll() {
        self.mainImageView.image = nil
    }

}

