//
//  Player.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class Player: NSObject {
    //Stored properties
    var playerId: Int = 0
    var skillLevel: Int?
    var firstName: String
    var lastName: String = ""
    var timeOutsAllowed: Int = 1
    var currentTeam : Team?
    
    //Computer Properties
    var name: String {
        get {
            return "\(firstName) \(lastName)"
        }
    }
    
    //Initializers
    init(firstName: String, lastName: String, playerId: Int, skillLevel: Int, team: Team? = nil) {
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
