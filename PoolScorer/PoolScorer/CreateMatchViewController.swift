//
//  CreateMatchViewController.swift
//  PoolScorer
//
//  Created by Liang Rui on 11/15/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class CreateMatchViewController: UIViewController {

    @IBOutlet weak var firstTeamLabel: UILabel!
    @IBOutlet weak var firstPlayerName: UITextField!
    @IBOutlet weak var firstPlayerNumber: UITextField!
    @IBOutlet weak var firstPlayerSkill: UITextField!
    @IBOutlet weak var secondPlayerName: UITextField!
    @IBOutlet weak var secondPlayerNumber: UITextField!
    @IBOutlet weak var secondPlayerSkill: UITextField!
    @IBAction func startMatchAction(_ sender: Any) {
    // Should increase matches number, which should then increase # of cells in the match tableview
    }
    @IBAction func enterScoreAction(_ sender: Any) {
        // Should take us to a VC where we enter the score for a finished match
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
