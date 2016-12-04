//
//  Frame.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit
/*
func pointsForLevel (level: Int) -> Int {
    switch (level) {
    case 1:
        return 
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    }
}
*/
class Frame: NSObject {
    private(set) var p1Score: Int = 0
    private(set) var p2Score: Int = 0
    private(set) var innings: Int = 0
    private(set) var deadBallCount: Int = 0
    var p1TimeOutsLeft: Int
    var p2TimeOutsLeft: Int
    let p1PointsLeftToWin: Int
    let p2PointsLeftToWin: Int
    static var MAX_POINTS_PER_FRAME: Int = 10
    var frameEnded: Bool = false
    
    init(p1Needs: Int, p2Needs: Int, p1TimeOutsAllowed: Int, p2TimeOutsAllowed: Int) {
        self.p1TimeOutsLeft = p1TimeOutsAllowed
        self.p2TimeOutsLeft = p2TimeOutsAllowed
        self.p1PointsLeftToWin = p1Needs
        self.p2PointsLeftToWin = p2Needs
    }
    
    var totalSoFar: Int {
        get {
            return p1Score + p2Score + deadBallCount
        }
    }
    
    
    func endFrame(force: Bool = false) -> Int {
        if totalSoFar != Frame.MAX_POINTS_PER_FRAME {
            if force {
                deadBallCount += Frame.MAX_POINTS_PER_FRAME - totalSoFar
                //print("Frame Ended. Player 1 scored:\(p1Score) ,Player 2 Scored:\(p2Score) ,Innings:\(innings), DeadBalls:\(deadBallCount)")
                frameEnded = true
                return 0
            } else {
                //print("Only \(totalSoFar) points out of \(Frame.MAX_POINTS_PER_FRAME) in this frame were accounted for. Do you want to mark the remaining \(Frame.MAX_POINTS_PER_FRAME - totalSoFar) balls dead?")
                // Show user popup and ask yes/no
            
                // User pressed no
                return -1
            }
        } else {
            // Show popup to confirm frame details
            //print("Frame Ended. Player 1 scored:\(p1Score) ,Player 2 Scored:\(p2Score) ,Innings:\(innings), DeadBalls:\(deadBallCount)")
            frameEnded = true
            return 0
        }
        
    }
    
    func incP1Score () -> Int {
        if !frameEnded {
            p1Score += 1
            //print("Player 1 scored. Current score : \(p1Score) - \(p2Score)")
            if totalSoFar == Frame.MAX_POINTS_PER_FRAME {
                endFrame()
            }
            if p1Score == p1PointsLeftToWin {
                //print("Player 1 won")
                endFrame(force: true)
            }
            return 1
        }
        return 0
    }
    
    func incDeadBallCount () {
        if !frameEnded {
            deadBallCount += 1
            if totalSoFar == Frame.MAX_POINTS_PER_FRAME {
                endFrame()
            }
        }
    }
    
    func incInnings () {
        if !frameEnded {
            innings += 1
        }
    }


    
    func incP2Score () -> Int {
        if !frameEnded {
            p2Score += 1
            //print("Player 2 scored. Current score : \(p1Score) - \(p2Score)")
            if totalSoFar == Frame.MAX_POINTS_PER_FRAME {
                endFrame()
            }
            if p2Score == p2PointsLeftToWin {
                //print("Player 2 won")
                endFrame(force: true)
            }
            return 1
        }
        return 0
    }
    
    func decP1Score () -> Int {
        if !frameEnded {
            p1Score -= 1
            return 1
        }
        return 0
    }
    
    func decP2Score () -> Int {
        if !frameEnded {
            p2Score -= 1
            return 1
        }
        return 0
    }

    
    func p1TakingTimeOut () {
        if p1TimeOutsLeft == 0 {
            //print("No timeouts left for player1")
        } else {
            p1TimeOutsLeft -= 1
        }
    }
    
    func p2TakingTimeOut () {
        if p1TimeOutsLeft == 0 {
            //print("No timeouts left for player2")
        } else {
            p2TimeOutsLeft -= 1
        }
    }
}
