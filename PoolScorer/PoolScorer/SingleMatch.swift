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
    
    var currentFrame: Frame {
        return frames.last!
    }
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
            if p1Score == getPlayerTargetPoints(player: player1) {
                print(" \(player1.name) won the match!")
                status = MatchStatus.Player1Won
                updatePointsFromScores()
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
            if p2Score == getPlayerTargetPoints(player: player2) {
                print(" \(player2.name) won the match!")
                status = MatchStatus.Player2Won
                updatePointsFromScores()
            }
            return p2Score
        }
    }
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        print ("Starting match between \(player1.name) and \(player2.name)")
    }
    
    enum MatchStatus {
        case Unstarted, Ongoing, Player1Won, Player2Won
    }
    
    
    func startMatch(p1BrokeFirst: Bool) {
        self.p1BrokeFirst = p1BrokeFirst
        self.status = MatchStatus.Ongoing
        frames.append(Frame(p1Needs: getPlayerTargetPoints(player: player1), p2Needs: getPlayerTargetPoints(player: player2), p1TimeOutsAllowed: player1.timeOutsAllowed, p2TimeOutsAllowed: player2.timeOutsAllowed))
    }
    
    func startNewFrame() {
        if currentFrame.endFrame() == 0 { // Successfully ended the last frame
            frames.append(Frame(p1Needs: (getPlayerTargetPoints(player: player1)-p1Score), p2Needs: (getPlayerTargetPoints(player: player2)-p2Score), p1TimeOutsAllowed: player1.timeOutsAllowed, p2TimeOutsAllowed: player2.timeOutsAllowed))
        }
    }
    
    func finishMatch() {
        
    }
    
    func forfeitMatch() {
        
    }
    
    func resumeMatch() {
        
    }
    
    func getResult() {
            
    }
    
    func getPlayerTargetPoints (player: Player) -> Int {
        print("dummy function, this should not have been called")
        return 0
    }
    
    func updatePointsFromScores () {
        print("dummy updatePoints method, this should not have been called")
    }

}


class NineBallSingleMatch: SingleMatch {
    var breakNRunP1: Bool = false
    var breakNRunP2: Bool = false
    var nineOnBreakP1: Bool = false
    var nineOnBreakP2: Bool = false
    static var MAX_MATCH_POINTS = 20
    
     override func updatePointsFromScores () {
        if (status == MatchStatus.Player1Won) {
            p2Points = NineBallSingleMatch.getLoserPointsFromScore(loserSkillLevel: player2.skillLevel!, loserScore: p2Score)
            p1Points = NineBallSingleMatch.MAX_MATCH_POINTS - p2Points
        } else if (status == MatchStatus.Player2Won) {
            p1Points = NineBallSingleMatch.getLoserPointsFromScore(loserSkillLevel: player1.skillLevel!, loserScore: p1Score)
            p2Points = NineBallSingleMatch.MAX_MATCH_POINTS - p1Points
        }
    }
    
    override func getPlayerTargetPoints (player: Player) -> Int {
        var arr = [14, 19, 25, 31, 38, 46, 55, 65, 75]
        return arr[player.skillLevel!-1]
    }
    
    class func getLoserPointsFromScore (loserSkillLevel: Int, loserScore: Int) -> Int {
        switch loserSkillLevel {
        case 1:
            switch loserScore {
            case 0...2:
                return 0
            case 3:
                return 1
            case 4:
                return 2
            case 5...6:
                return 3
            case 7:
                return 4
            case 8:
                return 5
            case 9...10:
                return 6
            case 11:
                return 7
            case 12...13:
                return 8
            default:
                return -1
            }
        case 2:
            switch loserScore {
            case 0...3:
                return 0
            case 4...5:
                return 1
            case 6...7:
                return 2
            case 8:
                return 3
            case 9...10:
                return 4
            case 11...12:
                return 5
            case 13...14:
                return 6
            case 15...16:
                return 7
            case 17...18:
                return 8
            default:
                return -1
            }
        case 3:
            switch loserScore {
            case 0...4:
                return 0
            case 5...6:
                return 1
            case 7...9:
                return 2
            case 10...11:
                return 3
            case 12...14:
                return 4
            case 15...16:
                return 5
            case 17...19:
                return 6
            case 20...21:
                return 7
            case 22...24:
                return 8
            default:
                return -1
            }
        case 4:
            switch loserScore {
            case 0...5:
                return 0
            case 6...8:
                return 1
            case 9...11:
                return 2
            case 12...14:
                return 3
            case 15...18:
                return 4
            case 19...21:
                return 5
            case 22...24:
                return 6
            case 25...27:
                return 7
            case 28...30:
                return 8
            default:
                return -1
            }
        case 5:
            switch loserScore {
            case 0...6:
                return 0
            case 7...10:
                return 1
            case 11...14:
                return 2
            case 15...18:
                return 3
            case 19...22:
                return 4
            case 23...26:
                return 5
            case 27...29:
                return 6
            case 30...33:
                return 7
            case 34...37:
                return 8
            default:
                return -1
            }
        case 6:
            switch loserScore {
            case 0...8:
                return 0
            case 9...12:
                return 1
            case 13...17:
                return 2
            case 18...22:
                return 3
            case 23...27:
                return 4
            case 28...31:
                return 5
            case 32...36:
                return 6
            case 37...40:
                return 7
            case 41...45:
                return 8
            default:
                return -1
            }
        case 7:
            switch loserScore {
            case 0...10:
                return 0
            case 11...15:
                return 1
            case 16...21:
                return 2
            case 22...26:
                return 3
            case 27...32:
                return 4
            case 33...37:
                return 5
            case 38...43:
                return 6
            case 44...49:
                return 7
            case 50...54:
                return 8
            default:
                return -1
            }
        case 8:
            switch loserScore {
            case 0...13:
                return 0
            case 14...19:
                return 1
            case 20...26:
                return 2
            case 27...32:
                return 3
            case 33...39:
                return 4
            case 40...45:
                return 5
            case 46...52:
                return 6
            case 53...58:
                return 7
            case 59...64:
                return 8
            default:
                return -1
            }
        case 9:
            switch loserScore {
            case 0...17:
                return 0
            case 18...24:
                return 1
            case 25...31:
                return 2
            case 32...38:
                return 3
            case 39...46:
                return 4
            case 47...53:
                return 5
            case 54...60:
                return 6
            case 61...67:
                return 7
            case 68...74:
                return 8
            default:
                return -1
            }
        default:
            return -1
        }
    }
    
    
}
