//
//  ViewController.swift
//  FastTouch
//
//  Created by Moises Gil on 4/29/17.
//  Copyright © 2017 Moises Gil. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var touchButton: UIButton!
    @IBAction func TapButton(_ sender: UIButton) {
        // Find the button's width and height
            let buttonWidth = touchButton.frame.width
            let buttonHeight = touchButton.frame.height

            // Find the width and height of the enclosing view
            let viewWidth = touchButton.superview!.bounds.width
            let viewHeight = touchButton.superview!.bounds.height

            // Compute width and height of the area to contain the button's center
            let xwidth = viewWidth - buttonWidth
            let yheight = viewHeight - buttonHeight

            // Generate a random x and y offset
            let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
            let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))

            // Offset the button's center by the random offsets.
        touchButton.center.x = xoffset + buttonWidth
        touchButton.center.y = yoffset + buttonHeight
        }
        
        
        
    
    var timer:Timer?
    var seconds = 0
    var touches = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultValues()
    }
    
    
    @IBAction func countTouches(_ sender: UIButton) {
        
        if(touches == 10){
            startGame()
            touchButton.setTitle("Touch!", for: UIControlState.normal)
        }
        
        touches -= 1
        counterLabel.text = String(touches)
        
        
    }
    
    
    @objc func count() {
        seconds += 1
        
        timerLabel.text = String(seconds)
        
        if(touches == 0){
            
            self.timer!.invalidate()
            self.timer = nil
            
            
            var alert = UIAlertController(title: "That's all!", message: "Your score is \(seconds) seconds", preferredStyle: UIAlertControllerStyle.alert)
            
            //            alert.addAction(UIAlertAction(title: "Play again", style: UIAlertActionStyle.default, handler:{_ in
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The\"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
    }
    
    
    
    
    func setDefaultValues(){
        
        seconds = 0
        touches = 10
        
        counterLabel.text = String(touches)
        timerLabel.text = String(seconds)
        
        touchButton.setTitle("Ready?", for: UIControlState.normal)
        
    }
    
    func startGame() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.count), userInfo: nil, repeats: true)
        
    }
    
}
