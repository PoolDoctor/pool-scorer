//
//  Frame.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class Frame: NSObject {
    var p1Score: Int = 0
    var p2Score: Int = 0
    var innings: Int = 0
    var deadBallCount: Int = 0
    var p1TimeOutsLeft: Int
    var p2TimeOutsLeft: Int
    
    init(p1TimeOutsAllowed: Int, p2TimeOutsAllowed: Int) {
        self.p1TimeOutsLeft = p1TimeOutsAllowed
        self.p2TimeOutsLeft = p2TimeOutsAllowed
    }
    
    func endFrame() {
        //check if p1Score + p2Score + deadBallCount = 10
        
    }
    
    func incP1Score (amount: Int) {
        p1Score += amount
    }
    
    func incP2Score (amount: Int) {
        p2Score += amount
    }
    
    func incInningsCount (amount: Int) {
        innings += amount
    }

    func incDeadBallCount (amount: Int) {
        deadBallCount += amount
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
