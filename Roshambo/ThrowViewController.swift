//
//  ThrowViewController.swift
//  Roshambo
//
//  Created by Jeff Whaley on 4/15/15.
//  Copyright (c) 2015 Jeff Whaley. All rights reserved.
//

import UIKit

enum Throw {
    case rock, paper, scissors
}

class ThrowViewController: UIViewController {
    
    var whichbutton: Throw?
    
    func randomThrow() -> Throw {
        // generate a random throw from
        var t:Throw
        
        let r = 1 + arc4random() % 3
        
        if r == 1 {
            t = .rock
        } else if r == 2 {
            t = .paper
        } else {
            t = .scissors
        }
        
        return t
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        whichbutton = nil
    }
    
    @IBAction func rockButton(sender: AnyObject) {
        var controller: ResultViewController
        
        whichbutton = .rock
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        controller.userThrow = .rock
        controller.computerThrow = randomThrow()
        
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    @IBAction func paperButton(sender: AnyObject) {
        whichbutton = .paper
        performSegueWithIdentifier("showResults", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as! ResultViewController
        
        if whichbutton == nil {
            whichbutton = .scissors
        }
        
        controller.userThrow = whichbutton
        controller.computerThrow = randomThrow()
        
    }
    
}

