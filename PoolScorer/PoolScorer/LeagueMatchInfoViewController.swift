//
//  LeagueMatchInfoViewController.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class LeagueMatchInfoViewController: UIViewController {

    @IBAction func onConfirm(_ sender: AnyObject) {
    }
    @IBOutlet weak var firstTeamName: UITextField!
    @IBOutlet weak var firstTeamId: UITextField!
    @IBOutlet weak var secondTeamName: UITextField!
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var teamMemberNum: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var secondTeamId: UITextField!

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
