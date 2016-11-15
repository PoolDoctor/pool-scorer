//
//  testLeagueMatch.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/15/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit


class TestLeagueMatch {
    //singleton
    static let sharedInstance = TestLeagueMatch()
    
    init() {
        let hosts = Team(name: "Justice League", teamId: 30201, homeLocation: "Edgies Billiards")
        let visitors = Team(name: "Avengers", teamId: 30210, homeLocation: "Lucky Shot Billiards")
        
        //8 players in host team
        hosts.addPlayer(player: Player(firstName: "Clark", lastName: "Kent", playerId: 48952, skillLevel: 2))
        hosts.addPlayer(player: Player(firstName: "Bruce", lastName: "Wayne", playerId: 29482, skillLevel: 7))
        hosts.addPlayer(player: Player(firstName: "Diana", lastName: "Prince", playerId: 19483, skillLevel: 4))
        hosts.addPlayer(player: Player(firstName: "Oliver", lastName: "Green", playerId: 28403, skillLevel: 3))
        hosts.addPlayer(player: Player(firstName: "Guy", lastName: "Gardner", playerId: 10382, skillLevel: 6))
        hosts.addPlayer(player: Player(firstName: "Flash", lastName: "", playerId: 18021, skillLevel: 5))
        hosts.addPlayer(player: Player(firstName: "Black", lastName: "Canary", playerId: 8402, skillLevel: 1))
        hosts.addPlayer(player: Player(firstName: "", lastName: "Hawkman", playerId: 46382, skillLevel: 8))
        
        //7 players in visiting team
        visitors.addPlayer(player: Player(firstName: "Tony", lastName: "Stark", playerId: 02912, skillLevel: 2))
        visitors.addPlayer(player: Player(firstName: "Thor", lastName: "", playerId: 24021, skillLevel: 3))
        visitors.addPlayer(player: Player(firstName: "Robert Bruce", lastName: "Banner", playerId: 20392, skillLevel: 9))
        visitors.addPlayer(player: Player(firstName: "Steve", lastName: "Rogers", playerId: 02912, skillLevel: 4))
        visitors.addPlayer(player: Player(firstName: "Quick", lastName: "Silver", playerId: 94922, skillLevel: 3))
        visitors.addPlayer(player: Player(firstName: "Black", lastName: "Panther", playerId: 29482, skillLevel: 2))
        visitors.addPlayer(player: Player(firstName: "Scarlet", lastName: "Witch", playerId: 37205, skillLevel: 4))

        let currentLeagueMatch = LeagueMatch(hostTeam: hosts, visitingTeam: visitors)
        
        currentLeagueMatch.addMatch(index: 0, p1: hosts.members[6], p2: visitors.members[0])
        
        
        //First match
        //-----------
        
        let firstMatch: SingleMatch = currentLeagueMatch.matches[0]!
        firstMatch.startMatch(p1BrokeFirst: false)
        
        // 1st frame
        // Tony made 7 balls in a row
        for _ in 1...7 {
            firstMatch.currentFrame.incP1Score()
        }
        // Black Canary missed
        firstMatch.currentFrame.innings += 1
        //Tony missed
        firstMatch.currentFrame.innings += 1
        
        //Black Canary made 3 balls
        firstMatch.currentFrame.incP2Score()
        firstMatch.currentFrame.incP2Score()
        firstMatch.currentFrame.incP2Score()
        
        // 7-3, 2nd frame
        firstMatch.startNewFrame()
        //Black canary made 3 point balls including the 9 ball. 7 balls dead
        firstMatch.currentFrame.incP2Score()
        firstMatch.currentFrame.incP2Score()
        firstMatch.currentFrame.incP2Score()
        // noop attempt to end the frame
        firstMatch.startNewFrame()
        for _ in 1...7 {
            firstMatch.currentFrame.deadBallCount += 1
        }
        
        // 7-6, actually starting the 3rd frame
        firstMatch.startNewFrame()
        
        //Black canary missed
        firstMatch.currentFrame.innings += 1
        //Tony scored 2
        firstMatch.currentFrame.incP1Score()
        firstMatch.currentFrame.incP1Score()
        
        //Black canary scored 5
        for _ in 1...5 {
            firstMatch.currentFrame.incP2Score()
        }
        
        firstMatch.currentFrame.innings += 1
        
        //tony played defence
        firstMatch.p1Defenses += 1
        //Black canary missed
        firstMatch.currentFrame.innings+=1
        
        //tony made remaining 3 balls in the frame
        firstMatch.currentFrame.incP1Score()
        firstMatch.currentFrame.incP1Score()
        firstMatch.currentFrame.incP1Score()
        
        //12-11, 4th frame
        //tony made 7 balls
        for _ in 1...7 {
            firstMatch.currentFrame.incP1Score()
        }
        
        //match ended 19-11

        
    
        
        
        
        
        
        
        
        
        

    }

    
}

