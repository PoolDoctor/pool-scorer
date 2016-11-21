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
    var currentLeagueMatch: LeagueMatch
    
    init() {
        let hosts = Team(name: "Justice League", teamId: 30201, homeLocation: "Edgies Billiards")
        let visitors = Team(name: "Avengers", teamId: 30210, homeLocation: "Lucky Shot Billiards")
        
        //8 players in host team
        hosts.addPlayer(player: Player(firstName: "Clark", lastName: "Kent", playerId: 48952, skillLevel: 2, team: hosts))
        hosts.addPlayer(player: Player(firstName: "Bruce", lastName: "Wayne", playerId: 29482, skillLevel: 7, team: hosts))
        hosts.addPlayer(player: Player(firstName: "Diana", lastName: "Prince", playerId: 19483, skillLevel: 4, team: hosts))
        hosts.addPlayer(player: Player(firstName: "Oliver", lastName: "Green", playerId: 28403, skillLevel: 3, team: hosts))
        hosts.addPlayer(player: Player(firstName: "Guy", lastName: "Gardner", playerId: 10382, skillLevel: 6, team: hosts))
        hosts.addPlayer(player: Player(firstName: "Flash", lastName: "", playerId: 18021, skillLevel: 5, team: hosts))
        hosts.addPlayer(player: Player(firstName: "Black", lastName: "Canary", playerId: 8402, skillLevel: 1, team: hosts))
        hosts.addPlayer(player: Player(firstName: "", lastName: "Hawkman", playerId: 46382, skillLevel: 8, team: hosts))
        
        //7 players in visiting team
        visitors.addPlayer(player: Player(firstName: "Tony", lastName: "Stark", playerId: 02912, skillLevel: 2, team: visitors))
        visitors.addPlayer(player: Player(firstName: "Thor", lastName: "", playerId: 24021, skillLevel: 3, team: visitors))
        visitors.addPlayer(player: Player(firstName: "Robert Bruce", lastName: "Banner", playerId: 20392, skillLevel: 9, team: visitors))
        visitors.addPlayer(player: Player(firstName: "Steve", lastName: "Rogers", playerId: 02912, skillLevel: 4, team: visitors))
        visitors.addPlayer(player: Player(firstName: "Quick", lastName: "Silver", playerId: 94922, skillLevel: 3, team: visitors))
        visitors.addPlayer(player: Player(firstName: "Black", lastName: "Panther", playerId: 29482, skillLevel: 2, team: visitors))
        visitors.addPlayer(player: Player(firstName: "Scarlet", lastName: "Witch", playerId: 37205, skillLevel: 4, team: visitors))

        currentLeagueMatch = LeagueMatch(hostTeam: hosts, visitingTeam: visitors)
        
        currentLeagueMatch.addMatch(index: 0, p1: hosts.members[6], p2: visitors.members[0])
        currentLeagueMatch.addMatch(index: 1, p1: hosts.members[3], p2: visitors.members[1])

        currentLeagueMatch.addMatch(index: 2, p1: hosts.members[2], p2: visitors.members[5])

        currentLeagueMatch.addMatch(index: 3, p1: hosts.members[4], p2: visitors.members[4])

        currentLeagueMatch.addMatch(index: 4, p1: hosts.members[7], p2: visitors.members[2])

        
        
        //First match
        //-----------
        
        let firstMatch: SingleMatch = currentLeagueMatch.matches[0]!
        firstMatch.startMatch(p1BrokeFirst: false)
        
        // 1st frame
        // Tony made 7 balls in a row
        for _ in 1...7 {
            firstMatch.currentFrame.incP2Score()
        }
        // Black Canary missed
        firstMatch.currentFrame.incInnings()
        //Tony missed
        firstMatch.currentFrame.incInnings()
        
        //Black Canary made 3 balls
        firstMatch.currentFrame.incP1Score()
        firstMatch.currentFrame.incP1Score()
        firstMatch.currentFrame.incP1Score()
        
        // 7-3, 2nd frame
        firstMatch.startNewFrame()
        //Black canary made 3 point balls including the 9 ball. 7 balls dead
        firstMatch.currentFrame.incP1Score()
        firstMatch.currentFrame.incP1Score()
        firstMatch.currentFrame.incP1Score()
        
        // noop attempt to end the frame
        firstMatch.startNewFrame()
        for _ in 1...7 {
            firstMatch.currentFrame.incDeadBallCount()
        }
        
        // 7-6, actually starting the 3rd frame
        firstMatch.startNewFrame()
        
        //Black canary missed
        firstMatch.currentFrame.incInnings()
        //Tony scored 2
        firstMatch.currentFrame.incP2Score()
        firstMatch.currentFrame.incP2Score()
        
        //Black canary scored 5
        for _ in 1...5 {
            firstMatch.currentFrame.incP1Score()
        }
        
        firstMatch.currentFrame.incInnings()
        
        //tony played defence
        firstMatch.p1Defenses += 1
        //Black canary missed
        firstMatch.currentFrame.incInnings()
        
        //tony made remaining 3 balls in the frame
        firstMatch.currentFrame.incP2Score()
        firstMatch.currentFrame.incP2Score()
        firstMatch.currentFrame.incP2Score()
        
        //12-11, 4th frame
        firstMatch.startNewFrame()
        //tony made 7 balls
        for _ in 1...7 {
            firstMatch.currentFrame.incP2Score()
        }
        
        //match ended 19-11

        print("Match 1 results between \(firstMatch.player1.name) and \(firstMatch.player2.name)")
        print("Score: \(firstMatch.p1Score) - \(firstMatch.p2Score)")
        print("Points: \(firstMatch.p1Points) - \(firstMatch.p2Points)")
        print("Innings: \(firstMatch.innings), Defenses: \(firstMatch.p1Defenses) - \(firstMatch.p2Defenses)")
        print(" ")

    
        
        for i in 1...4 {
            let currentMatch: SingleMatch = currentLeagueMatch.matches[i]!
            playRandomMatch(match: currentMatch)
            print("Match \(i+1) results between \(currentMatch.player1.name) and \(currentMatch.player2.name)")
            print("Score: \(currentMatch.p1Score) - \(currentMatch.p2Score)")
            print("Points: \(currentMatch.p1Points) - \(currentMatch.p2Points)")
            print("Innings: \(currentMatch.innings), Defenses: \(currentMatch.p1Defenses) - \(currentMatch.p2Defenses)")
            print(" ")
        }
        
        print ("Test League Match Finished")

    }
    
    func playRandomMatch(match: SingleMatch) {
        match.startMatch(p1BrokeFirst: true)
        while match.status != SingleMatch.MatchStatus.Player1Won &&
            match.status != SingleMatch.MatchStatus.Player2Won {
                let random_num = Int(arc4random_uniform(11) + 1) // generates 0 to 10.
                switch random_num%11 {
                case 0:
                    match.currentFrame.incInnings()
                case 1,2,3:
                    match.currentFrame.incP1Score()
                case 4,5,6:
                    match.currentFrame.incP2Score()
                case 7:
                    match.p1Defenses += 1
                case 8:
                    match.p2Defenses += 1
                case 9,10:
                    match.startNewFrame()
                default:
                    match.currentFrame.incInnings()
                }

        }
        
    }

    
}

