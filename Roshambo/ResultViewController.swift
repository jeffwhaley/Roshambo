//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Jeff Whaley on 4/15/15.
//  Copyright (c) 2015 Jeff Whaley. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {

    var userThrow: Throw?
    var computerThrow: Throw?
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        if userThrow == computerThrow {
            resultImage.image = UIImage(named: "itsATie.png")
            resultLabel.text = "Tied."
        
        } else if userThrow == .paper {
            if computerThrow == .rock {
                resultImage.image = UIImage(named: "PaperCoversRock.jpg")
                resultLabel.text = "You Win!"
            } else if computerThrow == .scissors {
                resultImage.image = UIImage(named: "ScissorsCutPaper.jpg")
                resultLabel.text = "You Lose!"
            }

        } else if userThrow == .rock {
            if computerThrow == .paper {
                resultImage.image = UIImage(named: "PaperCoversRock.jpg")
                resultLabel.text = "You Lose!"
            } else if computerThrow == .scissors {
                resultImage.image = UIImage(named: "RockCrushesScissors.jpeg")
                resultLabel.text = "You Win!"
            }
            
        } else if userThrow == .scissors {
            if computerThrow == .rock {
                resultImage.image = UIImage(named: "RockCrushesScissors.jpeg")
                resultLabel.text = "You Lose!"
            } else if computerThrow == .paper {
                resultImage.image = UIImage(named: "ScissorsCutPaper.jpg")
                resultLabel.text = "You Win!"
            }
            
        }
        resultImage.alpha = 0
        resultLabel.alpha = 0
        playAgainButton.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3) {
            self.resultImage.alpha = 1
            self.resultLabel.alpha = 1
            self.playAgainButton.alpha = 1
        }
        
    }
    
    @IBAction func playAgain(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
