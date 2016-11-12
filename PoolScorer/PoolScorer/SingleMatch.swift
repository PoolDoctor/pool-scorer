//
//  SingleMatch.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class SingleMatch: NSObject {
    var player1: Player
    var player2: Player
    var status: MatchStatus = MatchStatus.Unstarted
    var matchId: Int = 0
    var frames: [Frame] = [Frame]()
    var p1BrokeFirst: Bool = true
    var p1Points: Int = 0
    var p2Points: Int = 0
    var p1Defenses: Int = 0
    var p2Defenses: Int = 0
    
    var innings: Int {
        get {
            var innings = 0
            for frame in frames {
                innings += frame.innings
            }
            return innings
        }
    }
    
    var p1Score: Int {
        get {
            var p1Score = 0
            for frame in frames {
                p1Score += frame.p1Score
            }
            return p1Score
        }
    }
    
    var p2Score: Int {
        get {
            var p2Score = 0
            for frame in frames {
                p2Score += frame.p2Score
            }
            return p2Score
        }
    }
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    enum MatchStatus {
        case Unstarted, Ongoing, Player1Won, Player2Won
    }
    
    
    func startMatch(p1BrokeFirst: Bool) {
        self.p1BrokeFirst = p1BrokeFirst
        self.status = MatchStatus.Ongoing
        startNewFrame()
    }
    
    func startNewFrame() {
        frames.last?.endFrame()
        frames.append(Frame(p1TimeOutsAllowed: player1.timeOutsAllowed, p2TimeOutsAllowed: player2.timeOutsAllowed))
    }
    
    func finishMatch() {
        
    }
    
    func forfeitMatch() {
        
    }
    
    func resumeMatch() {
        
    }
    
    func getResult() {
            
    }

}


class NineBallSingleMatch: SingleMatch {
    var breakNRunP1: Bool = false
    var breakNRunP2: Bool = false
    var nineOnBreakP1: Bool = false
    var nineOnBreakP2: Bool = false
    
    class func scoreToPoints () {
        // Implement this to convert final score to match points earned
    }
}
