//
//  SingleMatchScoringViewController.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class SingleMatchScoringViewController: UIViewController, ScoringViewDelegate {
    
    func pointsNeeded (skill : Int) -> Int {
        switch(skill) {
        case 1:
            return 14
        case 2:
            return 19
        case 3:
            return 25
        case 4:
            return 31
        case 5:
            return 38
        case 6:
            return 46
        case 7:
            return 55
        case 8:
            return 65
        case 9:
            return 75
        default:
            return 99
        }
    }
    
    @IBOutlet weak var p1scoreView: ScoringView!
    @IBOutlet weak var p2scoreView: ScoringView!
    var match : SingleMatch?
    var currFrameNo : Int!
    var currentFrame : Frame?
    
    @IBOutlet weak var frameLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if ((match?.frames.count)! == 0) {
            currentFrame = Frame(p1Needs: pointsNeeded(skill: (match?.hostPlayer.skillLevel)!), p2Needs: pointsNeeded(skill: (match?.visitingPlayer.skillLevel)!), p1TimeOutsAllowed: 2, p2TimeOutsAllowed: 2)
            match?.frames.append(currentFrame!)
            currFrameNo = 1
        } else {
            currFrameNo = match?.frames.count
            currentFrame = match?.frames[currFrameNo - 1]
        }
        p1scoreView.scoreLabel.text = String(describing: currentFrame?.p1Score)
        p2scoreView.scoreLabel.text = String(describing: currentFrame?.p2Score)
        p1scoreView.defenseLabel.text = String(describing: match?.p1Defenses)
        p2scoreView.defenseLabel.text = String(describing: match?.p2Defenses)
        
        p1scoreView.scoreIncButton.addTarget(self, action: #selector(p1changeScore), for: UIControlEvents.touchUpInside)
        
        p1scoreView.scoreDecButton.addTarget(self, action: #selector(p1changeScore), for: UIControlEvents.touchUpInside)

        p2scoreView.scoreIncButton.addTarget(self, action: #selector(p2changeScore), for: UIControlEvents.touchUpInside)
        
        p2scoreView.scoreDecButton.addTarget(self, action: #selector(p2changeScore), for: UIControlEvents.touchUpInside)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func p1changeScore(sender: UIButton) {
        if (sender.titleLabel?.text == "+") {
            currentFrame?.incP1Score()
        } else if (sender.titleLabel?.text == "-") {
            currentFrame?.decP1Score()
        }
        print("The p1 current frame points \(currentFrame?.p1Score)")
        p1scoreView.scoreLabel.text = String(describing: currentFrame?.p1Score)
    }
    func p1changeDefense(sender: UIButton) {
        if (sender.titleLabel?.text == "+") {
            match?.p1Defenses += 1
        } else if (sender.titleLabel?.text == "-") {
            match?.p1Defenses -= 1
        }
        print("The p1 current def points \(match?.p1Defenses)")
        p1scoreView.defenseLabel.text = String(describing: match?.p1Defenses)
    }
    func p2changeScore(sender: UIButton) {
        if (sender.titleLabel?.text == "+") {
            currentFrame?.incP2Score()
        } else if (sender.titleLabel?.text == "-") {
            currentFrame?.decP2Score()
        }
        print("The p2 current frame points \(currentFrame?.p2Score)")
        p2scoreView.scoreLabel.text = String(describing: currentFrame?.p2Score)
        
    }
    func p2changeDefense(sender: UIButton) {
        if (sender.titleLabel?.text == "+") {
            match?.p2Defenses += 1
        } else if (sender.titleLabel?.text == "-") {
            match?.p2Defenses -= 1
        }
        print("The p2 current def points \(match?.p2Defenses)")
        p2scoreView.defenseLabel.text = String(describing: match?.p2Defenses)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
