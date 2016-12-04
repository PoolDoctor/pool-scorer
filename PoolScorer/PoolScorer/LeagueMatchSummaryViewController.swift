//
//  LeagueMatchSummaryViewController.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class LeagueMatchSummaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CreateMatchDelegate {

    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var player: Player?
    var leagueMatch : LeagueMatch?
    var thisMatch: SingleMatch?
    
    @IBOutlet weak var addMatchLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(red: CGFloat(0x3A/255.0), green: CGFloat(0x77/255.0), blue: CGFloat(0x4B/255.0), alpha: 1.0)
        // Do any additional setup after loading the view.
        addMatchLabel.text = "No matches added.\nAdd a match below!"
        addMatchLabel.isHidden = true
        if (leagueMatch?.matches.count == 0) {
            print ("Label is hidden!")
            addMatchLabel.isHidden = false
        }
        player = Player(firstName: "mar", lastName: "shen", playerId: 12345, skillLevel: 4)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (leagueMatch?.matches.count == 0) {
            addMatchLabel.isHidden = false
        } else {
            addMatchLabel.isHidden = true
        }
        self.tableView.reloadData()
        if (player != nil) {
            print ("the player first name is \(player?.firstName)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row + 1 <= leagueMatch!.matches.count) {
            let sMatch = leagueMatch!.matches[indexPath.row] as SingleMatch?
            let cell  = tableView.dequeueReusableCell(withIdentifier: "MatchTableViewCell", for: indexPath) as! MatchTableViewCell
            cell.matchName.text = "Match \((indexPath.row + 1))"
            var statusText : String
            var buttonText : String
            switch (sMatch!.status) {
                case .Unstarted:
                    statusText = "Unstarted"
                    buttonText = "Start"
                case .Ongoing:
                    statusText = "Ongoing"
                    buttonText = "Resume"
                case .Player1Won:
                    statusText = "P1 Victory"
                    buttonText = "Results"
                case .Player2Won:
                    statusText = "P2 Victory"
                    buttonText = "Results"
            }
            
            cell.matchStatus.text = statusText
            cell.button.setTitle(buttonText, for: .normal)             
            cell.button.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
            return cell
        } else {
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor(red: CGFloat(0x3A/255.0), green: CGFloat(0x77/255.0), blue: CGFloat(0x4B/255.0), alpha: 1.0)
            return cell
        }
    }
    
    func CreateMatchDelegate(createMatch: CreateMatchViewController, match: SingleMatch) {
        if (leagueMatch != nil) {
            print ("Added the match to the array!")
            leagueMatch?.matches.append(match)
        }
        
    }
    
    func buttonAction (sender : UIButton) {
        let view = sender.superview!
        let cell = view.superview as! MatchTableViewCell
        let indexPath = tableView.indexPath(for: cell)
        thisMatch = leagueMatch?.matches[(indexPath?.row)!]
        print ("The index path row is  \(indexPath!.row)")
        
//        thisMatch = LeagueMatch
        performSegue(withIdentifier: "MatchResume", sender: nil)
    }
    
    @IBAction func onAdd(_ sender: Any) {
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "pushToCreateMatch") {
            let dest = segue.destination as! CreateMatchViewController
            dest.delegate = self
            dest.player = self.player
        } else if (segue.identifier == "MatchResume") {
            let destVC = segue.destination as! SingleMatchScoringViewController
                destVC.match = thisMatch
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
