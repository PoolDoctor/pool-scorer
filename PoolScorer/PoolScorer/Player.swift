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
    var playerId: Int?
    var skillLevel: Int?
    var firstName: String
    var lastName: String?
    
    //Computer Properties
    var name: String {
        get {
            return "\(firstName) \(lastName)"
        }
    }
    
    //Initializers
    init(firstName: String, lastName: String, playerId: Int, skillLevel: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.playerId = playerId
        self.skillLevel = skillLevel
    }
}
