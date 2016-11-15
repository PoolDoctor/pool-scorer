//
//  Frame.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class Frame: NSObject {
    private(set) var p1Score: Int = 0
    private(set) var p2Score: Int = 0
    var innings: Int = 0
    var deadBallCount: Int = 0
    var p1TimeOutsLeft: Int
    var p2TimeOutsLeft: Int
    let p1PointsLeftToWin: Int
    let p2PointsLeftToWin: Int
    static var MAX_POINTS_PER_FRAME: Int = 10
    
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
                return 0
            } else {
                print("Only \(totalSoFar) points out of \(Frame.MAX_POINTS_PER_FRAME) in this frame were accounted for. Do you want to mark the remaining \(Frame.MAX_POINTS_PER_FRAME - totalSoFar) balls dead?")
                // Show user popup and ask yes/no
            
                // User pressed no
                return -1
            }
        } else {
            // Show popup to confirm frame details
            return 0
        }
        
    }
    
    func incP1Score () {
        p1Score += 1
        if p1Score == p1PointsLeftToWin {
            print("Player 1 won")
            endFrame(force: true)
        }
    }
    
    func incP2Score () {
        p2Score += 1
        if p2Score == p2PointsLeftToWin {
            print("Player 2 won")
            endFrame(force: true)
        }
    }
    
    func decP1Score () {
        p1Score -= 1
    }
    
    func decP2Score () {
        p2Score -= 1
    }

    
    func p1TakingTimeOut () {
        if p1TimeOutsLeft == 0 {
            print("No timeouts left for player1")
        } else {
            p1TimeOutsLeft -= 1
        }
    }
    
    func p2TakingTimeOut () {
        if p1TimeOutsLeft == 0 {
            print("No timeouts left for player2")
        } else {
            p2TimeOutsLeft -= 1
        }
    }
}
