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
    var leagueMatch : LeagueMatch?
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (leagueMatch?.matches.count == 0) {
            addMatchLabel.isHidden = false
        } else {
            addMatchLabel.isHidden = true
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (leagueMatch != nil) {
            print("it's not nil!")
        } else {
            print ("it's nil")
        }
        if (indexPath.row + 1 <= leagueMatch!.matches.count) {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "MatchTableViewCell", for: indexPath) as! MatchTableViewCell
            cell.matchName.text = "Match \((indexPath.row + 1))"
            cell.matchStatus.text = "In Progress"
            cell.button.titleLabel?.text = "Resume"
            cell.button.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
            return cell
        } else {
            let cell = UITableViewCell()
            //3A774B
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
    
    func buttonAction () {
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
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
