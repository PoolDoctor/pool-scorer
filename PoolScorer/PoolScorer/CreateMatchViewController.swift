//
//  CreateMatchViewController.swift
//  PoolScorer
//
//  Created by Liang Rui on 11/15/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit


@objc protocol CreateMatchDelegate {
    @objc optional func CreateMatchDelegate(createMatch: CreateMatchViewController, match: SingleMatch)
}

class CreateMatchViewController: UIViewController {

    @IBOutlet weak var firstTeamLabel: UILabel!
    @IBOutlet weak var firstPlayerName: UITextField!
    @IBOutlet weak var firstPlayerNumber: UITextField!
    @IBOutlet weak var firstPlayerSkill: UITextField!
    @IBOutlet weak var secondPlayerName: UITextField!
    @IBOutlet weak var secondPlayerNumber: UITextField!
    @IBOutlet weak var secondPlayerSkill: UITextField!
    var thisMatch : SingleMatch?
    var player : Player?
    var player1 : Player?
    var player2 : Player?
    weak var delegate : CreateMatchDelegate?
    
    @IBAction func startMatchAction(_ sender: Any) {
        var firstArr = firstPlayerName.text?.components(separatedBy: " ")
        var secondArr = secondPlayerName.text?.components(separatedBy: " ")
        print ("The names captured are \(firstArr![0]) \(firstArr![1]) \(secondArr![0]) \(secondArr![1])")
        player1 = Player(firstName: firstArr![0], lastName: firstArr![1], playerId: Int(firstPlayerNumber.text!)!, skillLevel: Int(firstPlayerSkill.text!)!)
        player2 = Player(firstName: secondArr![0], lastName: secondArr![1], playerId: Int(secondPlayerNumber.text!)!, skillLevel: Int(secondPlayerSkill.text!)!)
        thisMatch = SingleMatch(player1: player1!, player2: player2!)
        if (self.delegate != nil) {
            self.delegate?.CreateMatchDelegate!(createMatch: self, match: thisMatch!)
        }
        self.navigationController?.popViewController(animated: true)
    // Should increase matches number, which should then increase # of cells in the match tableview
    }
    @IBAction func enterScoreAction(_ sender: Any) {
        // Should take us to a VC where we enter the score for a finished match
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        player?.firstName = "MarvinKKK"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
