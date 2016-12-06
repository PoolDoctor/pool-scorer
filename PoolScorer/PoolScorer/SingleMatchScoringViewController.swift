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
    
 
    @IBOutlet weak var currInning: UILabel!
    @IBOutlet weak var deadBallCt: UILabel!
    @IBOutlet weak var endInningButton: UIButton!
    @IBOutlet weak var deadBallButton: UIButton!
    @IBOutlet weak var prevFrameButton: UIButton!
    @IBOutlet weak var nextFrameButton: UIButton!
    @IBOutlet weak var p1scoreView: ScoringView!
    @IBOutlet weak var p2scoreView: ScoringView!
    var match : SingleMatch?
    var currFrameNo : Int!
    var currentFrame : Frame?
    
    @IBOutlet weak var frameNoLabel: UILabel!
    @IBOutlet weak var frameStatusLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if (match!.status == .Unstarted) {
            match!.status = .Ongoing
        }
        if ((match?.frames.count)! == 0) {
            currentFrame = Frame(p1Needs: pointsNeeded(skill: (match?.hostPlayer.skillLevel)!), p2Needs: pointsNeeded(skill: (match?.visitingPlayer.skillLevel)!), p1TimeOutsAllowed: 2, p2TimeOutsAllowed: 2)
            match?.frames.append(currentFrame!)
            currFrameNo = 1
        } else {
            currFrameNo = match?.frames.count
            currentFrame = match?.currentFrame
        }
        prevFrameButton.layer.cornerRadius = 2.0
        prevFrameButton.layer.masksToBounds = true
        nextFrameButton.layer.cornerRadius = 2.0
        nextFrameButton.layer.masksToBounds = true
        endInningButton.layer.cornerRadius = 2.0
        endInningButton.layer.masksToBounds = true
        deadBallButton.layer.cornerRadius = 2.0
        deadBallButton.layer.masksToBounds = true
        
        reloadViews()
    }
    
    func reloadViews () {
        p1scoreView.playerName.text = match?.player1.firstName
        p2scoreView.playerName.text = match?.player2.firstName
        p1scoreView.playerSkill.text = String(describing: match!.player1.skillLevel)
        p2scoreView.playerSkill.text = String(describing: match!.player2.skillLevel)
        
        p1scoreView.scoreLabel.text = String(describing: currentFrame!.p1Score)
        p2scoreView.scoreLabel.text = String(describing: currentFrame!.p2Score)
        
        p1scoreView.defenseLabel.text = String(describing: match!.p1Defenses)
        p2scoreView.defenseLabel.text = String(describing: match!.p2Defenses)
        
        p1scoreView.scoreIncButton.addTarget(self, action: #selector(p1changeScore), for: UIControlEvents.touchUpInside)
        p1scoreView.scoreDecButton.addTarget(self, action: #selector(p1changeScore), for: UIControlEvents.touchUpInside)
        p1scoreView.defenseIncButton.addTarget(self, action: #selector(p1changeDef), for: UIControlEvents.touchUpInside)
        p1scoreView.defenseDecButton.addTarget(self, action: #selector(p1changeDef), for: UIControlEvents.touchUpInside)
        
        p2scoreView.scoreIncButton.addTarget(self, action: #selector(p2changeScore), for: UIControlEvents.touchUpInside)
        p2scoreView.scoreDecButton.addTarget(self, action: #selector(p2changeScore), for: UIControlEvents.touchUpInside)
        p2scoreView.defenseIncButton.addTarget(self, action: #selector(p2changeDef), for: UIControlEvents.touchUpInside)
        p2scoreView.defenseDecButton.addTarget(self, action: #selector(p2changeDef), for: UIControlEvents.touchUpInside)
        
        frameNoLabel.text = String(describing: currFrameNo!)
        if (currentFrame?.frameEnded == true) {
            frameStatusLabel.text = "Ended"
        } else {
            frameStatusLabel.text = "In Progress"
        }
        currInning.text = String(describing:currentFrame!.innings)
        deadBallCt.text = String(describing:currentFrame!.deadBallCount)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPrev(_ sender: Any) {
        print ("Prev button!")
        if (currFrameNo > 1) {
            print ("We can go back framess!")
            // If this is not the last frame
            currentFrame = match?.frames[currFrameNo-2]
            currFrameNo = currFrameNo - 1
            reloadViews()
        }
    }
    
    
    @IBAction func onDeadBall(_ sender: Any) {
        match?.currentFrame.incDeadBallCount()
        reloadViews()
    }
    
    @IBAction func onEndInning(_ sender: Any) {
        match?.currentFrame.incInnings()
        reloadViews()
    }
    
    @IBAction func onNext(_ sender: Any) {
        print ("Next button!")
        if (currentFrame?.frameEnded == true) {
            // We can only go to the next frame if the current one is completed
            // We must create a new frame if this is the last one
            if (currentFrame == match?.currentFrame) {
                let alert = UIAlertController(title: "Frame Completed", message: "Frame Ended. Player 1 scored:\(currentFrame?.p1Score) ,Player 2 Scored:\(currentFrame?.p2Score) ,Innings:\(currentFrame?.innings), DeadBalls:\(currentFrame?.deadBallCount).\nWould you like to proceed or edit the frame?", preferredStyle: UIAlertControllerStyle.alert)
                
                let proceedHandler = { (action:UIAlertAction!) -> Void in
                    print ("Proceed Handler")
                    self.currentFrame?.endFrame(force: true)
                    
                    self.currentFrame = Frame(p1Needs: self.pointsNeeded(skill: (self.match?.hostPlayer.skillLevel)!), p2Needs: self.pointsNeeded(skill: (self.match?.visitingPlayer.skillLevel)!), p1TimeOutsAllowed: 2, p2TimeOutsAllowed: 2)
                    self.match?.frames.append(self.currentFrame!)
                    self.currFrameNo = self.match?.frames.count
                }
                
                let editHandler = { (action:UIAlertAction!) -> Void in
                    print ("Edit Handler")
                    self.currentFrame?.endFrame(force: true)
                }
                
                alert.addAction(UIAlertAction(title: "Proceed", style: UIAlertActionStyle.default,handler: proceedHandler ))
                alert.addAction(UIAlertAction(title: "Edit", style: UIAlertActionStyle.default,handler: editHandler))
                
            } else {
                print ("This is not the last frame!")
                // If this is not the last frame
                currentFrame = match?.frames[currFrameNo]
                currFrameNo = currFrameNo + 1
            }
            reloadViews()
        } else {
            let alert = UIAlertController(title: "Frame Incomplete", message: "Only \(currentFrame!.totalSoFar) points out of \(Frame.MAX_POINTS_PER_FRAME) in this frame were accounted for. Do you want to mark the remaining \(Frame.MAX_POINTS_PER_FRAME - currentFrame!.totalSoFar) balls dead?", preferredStyle: UIAlertControllerStyle.alert)
            
            let yesHandler = { (action:UIAlertAction!) -> Void in
                self.currentFrame?.endFrame(force: true)
                
                self.currentFrame = Frame(p1Needs: self.pointsNeeded(skill: (self.match?.hostPlayer.skillLevel)!), p2Needs: self.pointsNeeded(skill: (self.match?.visitingPlayer.skillLevel)!), p1TimeOutsAllowed: 2, p2TimeOutsAllowed: 2)
                self.match?.frames.append(self.currentFrame!)
                self.currFrameNo = self.match?.frames.count
                
            }
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default,handler: yesHandler))
            alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default,handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func p1changeScore(sender: UIButton) {
        if (sender.titleLabel?.text == "+") {
            currentFrame?.incP1Score()
        } else if (sender.titleLabel?.text == "-") {
            currentFrame?.decP1Score()
        }
        print("The p1 current frame points \(currentFrame?.p1Score)")
        p1scoreView.scoreLabel.text = String(describing: currentFrame!.p1Score)
        reloadViews()
    }
    func p1changeDef(sender: UIButton) {
        if (sender.titleLabel?.text == "+") {
            match?.p1Defenses += 1
        } else if (sender.titleLabel?.text == "-") {
            match?.p1Defenses -= 1
        }
        print("The p1 current def points \(match?.p1Defenses)")
        p1scoreView.defenseLabel.text = String(describing: match!.p1Defenses)
    }
    func p2changeScore(sender: UIButton) {
        if (sender.titleLabel?.text == "+") {
            currentFrame?.incP2Score()
        } else if (sender.titleLabel?.text == "-") {
            currentFrame?.decP2Score()
        }
        print("The p2 current frame points \(currentFrame?.p2Score)")
        p2scoreView.scoreLabel.text = String(describing: currentFrame!.p2Score)
        reloadViews()
        
    }
    func p2changeDef(sender: UIButton) {
        if (sender.titleLabel?.text == "+") {
            match?.p2Defenses += 1
        } else if (sender.titleLabel?.text == "-") {
            match?.p2Defenses -= 1
        }
        print("The p2 current def points \(match?.p2Defenses)")
        p2scoreView.defenseLabel.text = String(describing: match!.p2Defenses)
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
