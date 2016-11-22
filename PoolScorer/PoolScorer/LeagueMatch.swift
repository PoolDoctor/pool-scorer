//
//  LeagueMatch.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class LeagueMatch: NSObject {
    
    
    var hostTeam: Team
    var visitingTeam: Team
    var location: String
    //TODO : choose a better type for start and end time
    var startTime: String
    var endTime: String
    var hostPutFirstPlayer: Bool
    var matches: [SingleMatch?]
    static var SINGLE_MATCHES_IN_LEAGUE_MATCH = 5
    
    init(hostTeam: Team, visitingTeam: Team) {
        self.hostTeam = hostTeam
        self.visitingTeam = visitingTeam
        self.location = hostTeam.homeLocation
        self.startTime = String("7:00 pm")
        self.endTime = String("10:30 pm")
        self.hostPutFirstPlayer = true
        self.matches = [SingleMatch?](repeating: nil, count: LeagueMatch.SINGLE_MATCHES_IN_LEAGUE_MATCH)
    }
    
    var hostTeamScore: Int {
        get {
            var score = 0
            for match in matches {
                if match != nil {
                    score += ((match?.hostPlayerBrokeFirst)! ? match?.p1Points : match?.p2Points)!
                }
            }
            return score
        }
    }
    
    var visitingTeamScore: Int {
        get {
            var score = 0
            for match in matches {
                if match != nil {
                    score += ((match?.hostPlayerBrokeFirst)! ? match?.p2Points : match?.p1Points)!
                }
            }
            return score
        }
    }
    
    func getResult() {
        
    }
    
    func addMatch(index: Int, p1: Player, p2: Player) {
        if matches[index] == nil {
            matches[index] = NineBallSingleMatch(hostPlayer: p1, visitingPlayer: p2)
        } else {
            print("Match \(index) is already populated.")
        }
    }
    
    func saveMatch() {
        
    }
    
    func exportMatch() {
        
    }

}

