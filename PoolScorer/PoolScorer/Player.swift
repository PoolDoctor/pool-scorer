//
//  Player.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit
import RealmSwift

class Player: Object {
    //Stored properties
    dynamic var playerId: Int = 0
    dynamic var skillLevel: Int = 0
    dynamic var firstName: String = ""
    dynamic var lastName: String = ""
    dynamic var timeOutsAllowed: Int = 1
    dynamic var currentTeam: Team?
    
    //Computed Properties
    var name: String {
        get {
            return "\(firstName) \(lastName)"
        }
    }
    
    // set primary key
    override class func primaryKey() -> String? {
        return "playerId"
    }

    
    //Initializers
    convenience init(firstName: String, lastName: String, playerId: Int, skillLevel: Int, team: Team? = nil) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
        self.playerId = playerId
        self.skillLevel = skillLevel
        self.currentTeam = team
        switch skillLevel {
        case 1...3:
            self.timeOutsAllowed = 2
        case 4...9:
            self.timeOutsAllowed = 1
        default:
            print("Invalid player skill level \(skillLevel)")
        }
    }
}
