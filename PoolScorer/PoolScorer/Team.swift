//
//  Team.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit
import RealmSwift

class Team: Object {
    
    static let MAX_TEAM_SIZE: Int = 8
    dynamic var name: String = ""
    dynamic var teamId: Int = 0
    dynamic var homeLocation: String = ""
    let members = List<Player>()
    
    override class func primaryKey() -> String? {
        return "teamId"
    }
    
    func addPlayer(_ player: Player) {
        if let realm = try? Realm() {
            try! realm.write {
                self.members.append(player)
            }
        }
    }
    
    // remove player from members list and not from DB
    func removePlayer(_ player: Player) {
        
        for (index, member) in members.enumerated() {
            if member.playerId == player.playerId {
                let realm = try! Realm()
                try! realm.write {
                    members.remove(objectAtIndex: index)
                }
            }
        }
    }
    
    convenience init(name: String, teamId: Int, homeLocation: String) {
        self.init()
        self.name = name
        self.teamId = teamId
        self.homeLocation = homeLocation
    }
}
