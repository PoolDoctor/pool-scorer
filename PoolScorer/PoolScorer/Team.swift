//
//  Team.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class Team: NSObject {
    
    static var MAX_TEAM_SIZE: Int = 8
    var name: String
    var teamId: Int
    var homeLocation: String
    var members: [Player]
    
    func addPlayer(player: Player) {
        members.append(player)
    }
    
    func removePlayer(player: Player) {
        for (index, member) in members.enumerated() {
            print("Player \(index + 1): \(member)")
            if member.playerId == player.playerId {
                members.remove(at: index)
            }
        }
    }
    
    init(name: String, teamId: Int, homeLocation: String) {
        self.name = name
        self.teamId = teamId
        self.homeLocation = homeLocation
        self.members = [Player]()
    }
}
