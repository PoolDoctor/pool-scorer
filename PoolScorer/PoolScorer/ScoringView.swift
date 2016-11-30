//
//  ScoringView.swift
//  PoolScorer
//
//  Created by Liang Rui on 11/18/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

@objc protocol ScoringViewDelegate {
    @objc optional func changeScore(playerPosition: Int, score: Int)
    @objc optional func changeDefense(playerPosition: Int, defense: Int)
}


class ScoringView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var playerSkill: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var scoreIncButton: UIButton!
    @IBOutlet weak var scoreDecButton: UIButton!
    @IBOutlet weak var defenseDecButton: UIButton!
    @IBOutlet weak var defenseIncButton: UIButton!
    var playerPosition : Int?
    var score : Int?
    var thisPlayer : Player?
    
    var name : String {
        get {
            return playerName.text!
        }
        set {
            playerName.text = newValue
        }
    }
    @IBAction func onScore(_ sender: UIButton) {
        
    }
    
    @IBAction func onDefense(_ sender: UIButton) {
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
     
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "ScoringView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
