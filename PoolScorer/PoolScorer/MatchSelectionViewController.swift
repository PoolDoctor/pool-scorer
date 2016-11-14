//
//  MatchSelectionViewController.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class MatchSelectionViewController: UIViewController {

    @IBOutlet weak var ballImage: UIImageView!
    @IBAction func onResumePress(_ sender: AnyObject) {
    }
    
    @IBOutlet weak var onRecreational: UIButton!
    
    @IBAction func onRecreational(_ sender: AnyObject) {
    }
    @IBAction func onLeaguePress(_ sender: AnyObject) {
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
