//
//  SingleMatchScoringViewController.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class SingleMatchScoringViewController: UIViewController, ScoringViewDelegate {
    
    @IBOutlet weak var p1scoreView: ScoringView!
    @IBOutlet weak var p2ScoreView: ScoringView!
    var match : SingleMatch?
    var currentFrame : Frame?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if ((match?.frames.count)! > 0) {
            /*if (match?.frames[match?.frames.count-1].frameEnded == true) {
                currentFrame = Frame(p1Needs: <#T##Int#>, p2Needs: <#T##Int#>, p1TimeOutsAllowed: <#T##Int#>, p2TimeOutsAllowed: <#T##Int#>)
            }*/
        }
        /*p1scoreView.scoreIncButton.addTarget(self, action: #selector(changeScore(playerPosition:score:)), for: UIControlEvents.touchUpInside)
        
        p1scoreView.scoreIncButton.addTarget(self, action: #selector(changeScore(playerPosition:score:)), for: UIControlEvents.touchUpInside)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func p1Score(sender: UIButton) {
        if (sender.titleLabel?.text == "-") {
            //match?.p1Score -= 1
        } else if (sender.titleLabel?.text == "+") {
            //match?.p1Score += 1
        }
    }
    func p1Defense(sender: UIButton) {
        
    }

    func p2Score(sender: UIButton) {
        
    }
    func p2Defense(sender: UIButton) {
        
    }
    
    func changeScore(playerPosition: Int, score: Int) {
        
    }
    func changeDefense(playerPosition: Int, defense: Int) {
        
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
