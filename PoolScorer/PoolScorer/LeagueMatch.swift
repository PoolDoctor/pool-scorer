//
//  LeagueMatch.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit
import RealmSwift

class LeagueMatch: Object {
    
    dynamic var hostTeam: Team?
    dynamic var visitingTeam: Team?
    dynamic var location: String = ""
    dynamic var startTime = Date()
    dynamic var endTime: Date?
    dynamic var hostPutFirstPlayer: Bool = false
    let matches = List<SingleMatch>()
    static let SINGLE_MATCHES_IN_LEAGUE_MATCH = 5
    
    convenience init(hostTeam: Team, visitingTeam: Team) {
        self.init()
        self.hostTeam = hostTeam
        self.visitingTeam = visitingTeam
        self.location = hostTeam.homeLocation
        self.startTime = Date()
        self.hostPutFirstPlayer = true
        //self.matches = [SingleMatch?](repeating: nil, count: LeagueMatch.SINGLE_MATCHES_IN_LEAGUE_MATCH)
    }
    
    var hostTeamScore: Int {
        get {
            var score = 0
            for match in matches {
                score += ((match.hostPlayerBrokeFirst) ? match.p1Points : match.p2Points)
                
            }
            return score
        }
    }
    
    var visitingTeamScore: Int {
        get {
            var score = 0
            for match in matches {
                score += ((match.hostPlayerBrokeFirst) ? match.p2Points : match.p1Points)
                
            }
            return score
        }
    }
    
    func getResult() {
        
    }
    
    func addMatch(index: Int, p1: Player, p2: Player) {
        
        matches[index] = NineBallSingleMatch(hostPlayer: p1, visitingPlayer: p2)
    }
    
    func saveMatch() {
        let realm = try! Realm()
        try! realm.write {
            realm.add(self)
        }
    }
    
    func exportMatch() {
        
    }

}

