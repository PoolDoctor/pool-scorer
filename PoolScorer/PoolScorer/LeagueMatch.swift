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
    //TODO : choose a better time for start and end time
    var startTime: Int
    var endTime: Int
    var hostTeamScore: Int
    var visitingTeamScore: Int
    var hostPutFirstPlayer: Bool
    var matches: [SingleMatch?]
    static var SINGLE_MATCHES_IN_LEAGUE_MATCH = 5
    
    init(hostTeam: Team, visitingTeam: Team) {
        self.hostTeam = hostTeam
        self.visitingTeam = visitingTeam
        self.location = hostTeam.homeLocation
        self.startTime = 0
        self.endTime = 0
        self.hostTeamScore = 0
        self.visitingTeamScore = 0
        self.hostPutFirstPlayer = true
        self.matches = [SingleMatch?](repeating: nil, count: LeagueMatch.SINGLE_MATCHES_IN_LEAGUE_MATCH)
    }
    
    func getResult() {
        
    }
    
    func saveMatch() {
        
    }
    
    func exportMatch() {
        
    }

}
