//
//  LeagueMatchInfoViewController.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class LeagueMatchInfoViewController: UIViewController {
    var team1 : Team!
    var team2 : Team!
    var leagueMatch : LeagueMatch!
    @IBAction func onConfirm(_ sender: AnyObject) {
        team1 = Team(name: homeTeamName.text!, teamId: Int(homeTeamId.text!)!, homeLocation: locationField.text!)
        team2 = Team(name: visitTeamName.text!, teamId: Int(visitTeamId.text!)!, homeLocation: locationField.text!)
        leagueMatch = LeagueMatch(hostTeam: team1, visitingTeam: team2)
        performSegue(withIdentifier: "pushToMatchesView", sender: leagueMatch)
        
    }
    @IBOutlet weak var homeTeamName: UITextField!
    @IBOutlet weak var homeTeamId: UITextField!
    @IBOutlet weak var visitTeamName: UITextField!
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var teamMemberNum: UITextField!
    @IBOutlet weak var visitTeamId: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Passing league match to next VC
        if (segue.identifier == "pushToMatchesView") {
            let leagueMatch = sender as! LeagueMatch
            let destVC = segue.destination as! LeagueMatchSummaryViewController
            destVC.leagueMatch = leagueMatch
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
