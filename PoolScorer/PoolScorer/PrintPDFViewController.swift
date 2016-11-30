//
//  PrintPDFViewController.swift
//  PoolScorer
//
//  Created by Abhinav Rai on 11/20/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

enum UIElementTags {
    case
    scoreSheetImage,
    teamPutFirstPlayer,
    startTime,
    endTime,
    homeTeamName,
    homeTeamId,
    homeTeamTotalScore,
    visitingTeamName,
    visitingTeamId,
    visitingTeamTotalScore,
    
    //single match elements
    p1Team,
    p2Team,
    p1Id,
    p2Id,
    p1Name,
    p2Name,
    p1SL,
    p2SL,
    p1BallCount,
    p2BallCount,
    p1NineSnap,
    p1BnR,
    p2NineSnap,
    p2BnR,
    innings,
    p1Defenses,
    p2Defenses,
    p1Score,
    p2Score,
    p1Points,
    p2Points,
    team1RunningTotal,
    team2RunningTotal,
    
    //frame details
    frameP1Score,
    frameInnings,
    frameDeadBalls,
    frameP2Score,
    frameSeparator
}


var UIElementPositions: [UIElementTags: (x: Int, y: Int, width: Int, height: Int)] = [
    UIElementTags.scoreSheetImage:          (x: 0, y: 0, width: 792, height: 612),
    UIElementTags.teamPutFirstPlayer:       (x: 120, y: 3, width: 25, height: 20),
    UIElementTags.startTime:                (x: 575, y: 3, width: 80, height: 20),
    UIElementTags.endTime:                  (x: 690, y: 3, width: 80, height: 20),
    UIElementTags.homeTeamName:             (x: 165, y: 564, width: 110, height: 20),
    UIElementTags.homeTeamId:               (x: 285, y: 564, width: 30, height: 20),
    UIElementTags.homeTeamTotalScore:       (x: 335, y: 564, width: 40, height: 20),
    UIElementTags.visitingTeamName:         (x: 563, y: 564, width: 110, height: 20),
    UIElementTags.visitingTeamId:           (x: 683, y: 564, width: 30, height: 20),
    UIElementTags.visitingTeamTotalScore:   (x: 733, y: 564, width: 40, height: 20),

    //singleMatch element positions
    UIElementTags.p1Team:                   (x: 1, y: 25, width: 20, height: 20),
    UIElementTags.p2Team:                   (x: 1, y: 61, width: 20, height: 20),
    UIElementTags.p1Id:                     (x: 30, y: 19, width: 100, height: 16),
    UIElementTags.p1Name:                   (x: 35, y: 33, width: 100, height: 16),
    UIElementTags.p2Id:                     (x: 30, y: 53, width: 100, height: 16),
    UIElementTags.p2Name:                   (x: 35, y: 67, width: 100, height: 16),
    UIElementTags.p1SL:                     (x: 142, y: 18, width: 15, height: 15),
    UIElementTags.p1BallCount:              (x: 156, y: 38, width: 15, height: 15),
    UIElementTags.p2SL:                     (x: 142, y: 52, width: 15, height: 15),
    UIElementTags.p2BallCount:              (x: 156, y: 72, width: 15, height: 15),
    UIElementTags.p1NineSnap:               (x: 525, y: 23, width: 20, height: 12),
    UIElementTags.p1BnR:                    (x: 525, y: 41, width: 20, height: 12),
    UIElementTags.p2NineSnap:               (x: 525, y: 59, width: 20, height: 12),
    UIElementTags.p2BnR:                    (x: 525, y: 77, width: 20, height: 12),
    UIElementTags.innings:                  (x: 546, y: 47, width: 20, height: 20),
    UIElementTags.p1Defenses:               (x: 592, y: 20, width: 20, height: 20),
    UIElementTags.p2Defenses:               (x: 592, y: 65, width: 20, height: 20),
    UIElementTags.p1Score:                  (x: 639, y: 20, width: 25, height: 20),
    UIElementTags.p2Score:                  (x: 639, y: 65, width: 25, height: 20),
    UIElementTags.p1Points:                 (x: 665, y: 8, width: 25, height: 25),
    UIElementTags.p2Points:                 (x: 665, y: 68, width: 25, height: 25),
    UIElementTags.team1RunningTotal:        (x: 692, y: 8, width: 30, height: 30),
    UIElementTags.team2RunningTotal:        (x: 692, y: 68, width: 30, height: 30),
    
    // frame 0 positions
    UIElementTags.frameP1Score:             (x: 192, y: 15, width: 21, height: 20),
    UIElementTags.frameInnings:             (x: 192, y: 31, width: 21, height: 20),
    UIElementTags.frameDeadBalls:           (x: 192, y: 49, width: 21, height: 20),
    UIElementTags.frameP2Score:             (x: 192, y: 66, width: 21, height: 20),
    UIElementTags.frameSeparator:           (x: 212, y: 18, width: 1, height: 68)
]


var labelTextSizes: [UIElementTags: CGFloat] = [
    UIElementTags.teamPutFirstPlayer:       15,
    UIElementTags.startTime:                15,
    UIElementTags.endTime:                  15,
    UIElementTags.homeTeamName:             10,
    UIElementTags.homeTeamId:               14,
    UIElementTags.homeTeamTotalScore:       14,
    UIElementTags.visitingTeamName:         11,
    UIElementTags.visitingTeamId:           14,
    UIElementTags.visitingTeamTotalScore:   14,
    
    //singleMatch label text sizes
    UIElementTags.p1Team:                   15,
    UIElementTags.p2Team:                   15,
    UIElementTags.p1Id:                     12,
    UIElementTags.p1Name:                   12,
    UIElementTags.p2Id:                     12,
    UIElementTags.p2Name:                   12,
    UIElementTags.p1SL:                     12,
    UIElementTags.p1BallCount:              10,
    UIElementTags.p2SL:                     12,
    UIElementTags.p2BallCount:              10,
    UIElementTags.p1NineSnap:               9,
    UIElementTags.p1BnR:                    9,
    UIElementTags.p2NineSnap:               9,
    UIElementTags.p2BnR:                    9,
    UIElementTags.innings:                  13,
    UIElementTags.p1Defenses:               13,
    UIElementTags.p2Defenses:               13,
    UIElementTags.p1Score:                  13,
    UIElementTags.p2Score:                  13,
    UIElementTags.p1Points:                 16,
    UIElementTags.p2Points:                 16,
    UIElementTags.team1RunningTotal:        18,
    UIElementTags.team2RunningTotal:        18,
    
    // frame label text sizes
    UIElementTags.frameP1Score:             14,
    UIElementTags.frameInnings:             11,
    UIElementTags.frameDeadBalls:           9,
    UIElementTags.frameP2Score:             14
]



func addLabelToView(view: UIView, tag: UIElementTags, text: String) {
    let tuple1: (x: Int, y: Int, width: Int,height: Int) = UIElementPositions[tag]!
    let label: UILabel = UILabel(frame: CGRect(x: tuple1.x, y: tuple1.y, width: tuple1.width, height: tuple1.height))
    label.font = UIFont(name: "ChalkboardSE-Regular", size: 20)
    label.font = label.font.withSize(labelTextSizes[tag]!)
    label.textAlignment = .center
    label.textColor = UIColor.blue
    label.text = text
    view.addSubview(label)
}

class SingleMatchView: UIView {
    var match: SingleMatch
    init(match: SingleMatch, frame: CGRect, hostTeamTotalSoFar: Int, visitingTeamTotalSoFar: Int) {
        self.match = match
        super.init(frame: frame)
        self.addMatchDetails(hostTeamTotalSoFar: hostTeamTotalSoFar, visitingTeamTotalSoFar: visitingTeamTotalSoFar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addFrameLabelToView(tag: UIElementTags, text: Int, index: Int) {
        let tuple1: (x: Int, y: Int, width: Int,height: Int) = UIElementPositions[tag]!
        let label: UILabel = UILabel(frame: CGRect(x: (tuple1.x + tuple1.width * index), y: tuple1.y, width: tuple1.width, height: tuple1.height))
        label.font = UIFont(name: "ChalkboardSE-Regular", size: 20)
        label.font = label.font.withSize(labelTextSizes[tag]!)
        label.textAlignment = .center
        label.textColor = UIColor.blue
        label.text = String(text)
        self.addSubview(label)
        if (tag == UIElementTags.frameP2Score) {
            let tuple2: (x: Int, y: Int, width: Int,height: Int) = UIElementPositions[UIElementTags.frameSeparator]!
            let separator = UIView(frame: CGRect(x: (tuple2.x + tuple1.width * index), y: tuple2.y, width: tuple2.width, height: tuple2.height))
            separator.layer.borderColor = UIColor.darkGray.cgColor
            separator.layer.borderWidth = 1.0;
            self.addSubview(separator)
        }
    }
    
    func addFrames() {
        for (idx,frame) in match.frames.enumerated() {
            addFrameLabelToView(tag: UIElementTags.frameP1Score, text: frame.p1Score, index: idx)
            addFrameLabelToView(tag: UIElementTags.frameInnings, text: frame.innings, index: idx)
            addFrameLabelToView(tag: UIElementTags.frameDeadBalls, text: frame.deadBallCount, index: idx)
            addFrameLabelToView(tag: UIElementTags.frameP2Score, text: frame.p2Score, index: idx)
        }
    }

    func addMatchDetails(hostTeamTotalSoFar: Int, visitingTeamTotalSoFar: Int) {
        let p1: Player = match.player1
        let p2: Player = match.player2

        
        // Add team numbers
        let  p1Team: String = (p1.currentTeam == nil ? String("") : String((p1.currentTeam!.teamId) % 100))
        addLabelToView(view: self, tag: UIElementTags.p1Team, text: p1Team)
        let  p2Team: String = (p2.currentTeam == nil ? String("") : String((p2.currentTeam!.teamId) % 100))
        addLabelToView(view: self, tag: UIElementTags.p2Team, text: p2Team)
        addLabelToView(view: self, tag: UIElementTags.p1Id, text: String(p1.playerId))
        addLabelToView(view: self, tag: UIElementTags.p2Id, text: String(p2.playerId))
        addLabelToView(view: self, tag: UIElementTags.p1Name, text: p1.name)
        addLabelToView(view: self, tag: UIElementTags.p2Name, text: p2.name)
        addLabelToView(view: self, tag: UIElementTags.p1SL, text: String(p1.skillLevel))
        addLabelToView(view: self, tag: UIElementTags.p1BallCount, text: String(describing: NineBallSingleMatch.getPlayerTargetPoints(player: p1)))
        addLabelToView(view: self, tag: UIElementTags.p2SL, text: String(p2.skillLevel))
        addLabelToView(view: self, tag: UIElementTags.p2BallCount, text: String(describing: NineBallSingleMatch.getPlayerTargetPoints(player: p2)))
        
        addFrames()
        
        //TODO: Add BnR and 9Snap labels
        addLabelToView(view: self, tag: UIElementTags.innings, text: String(match.innings))
        addLabelToView(view: self, tag: UIElementTags.p1Defenses, text: String(match.p1Defenses))
        addLabelToView(view: self, tag: UIElementTags.p2Defenses, text: String(match.p2Defenses))
        addLabelToView(view: self, tag: UIElementTags.p1Score, text: String(match.p1Score))
        addLabelToView(view: self, tag: UIElementTags.p2Score, text: String(match.p2Score))
        addLabelToView(view: self, tag: UIElementTags.p1Points, text: String(match.p1Points))
        addLabelToView(view: self, tag: UIElementTags.p2Points, text: String(match.p2Points))
        addLabelToView(view: self, tag: UIElementTags.team1RunningTotal, text: String(match.p1Points + (match.hostPlayerBrokeFirst ? hostTeamTotalSoFar : visitingTeamTotalSoFar)))
        addLabelToView(view: self, tag: UIElementTags.team2RunningTotal, text: String(match.p2Points + (match.hostPlayerBrokeFirst ? visitingTeamTotalSoFar : hostTeamTotalSoFar)))






        


    }
    
    
}

class ToPrintView: UIView {
    var singleMatchViews = [SingleMatchView?](repeating: nil, count: 5)
    var scoreSheetImageView: UIImageView!
    var scoreSheetUrl : URL!
    var leagueMatch: LeagueMatch!
    
    init(scoreSheetUrl: URL, leagueMatch: LeagueMatch) {
        let tuple1 = UIElementPositions[UIElementTags.scoreSheetImage]
        let bounds: CGRect = CGRect(x: (tuple1?.x)!, y: (tuple1?.y)!, width: (tuple1?.width)!, height: (tuple1?.height)!)
        self.scoreSheetUrl = scoreSheetUrl
        self.leagueMatch = leagueMatch
        self.scoreSheetImageView = UIImageView(frame: bounds)
        super.init(frame: bounds)
        self.scoreSheetImageView.image = drawPDFfromURL(url: scoreSheetUrl)
        self.addSubview(scoreSheetImageView)



        addCustomViews()
    }
    
    func addScoresToView(leagueMatch: LeagueMatch) {
        var hostTeamTotalSoFar: Int = 0
        var visitingTeamTotalSoFar: Int = 0
        for (idx, match) in leagueMatch.matches.enumerated() {
            if match == nil {
                print (" match \(idx) is nil")
            } else {
                print ("printing match \(idx)")
                let bounds: CGRect = CGRect(x: 53, y: (106*idx + 27), width: 722, height: 105)
                singleMatchViews[idx] = SingleMatchView(match: match, frame: bounds, hostTeamTotalSoFar: hostTeamTotalSoFar, visitingTeamTotalSoFar: visitingTeamTotalSoFar)
                self.addSubview(singleMatchViews[idx]!)
                hostTeamTotalSoFar += ((match.hostPlayerBrokeFirst) ? match.p1Points : match.p2Points)
                visitingTeamTotalSoFar += ((match.hostPlayerBrokeFirst) ? match.p2Points : match.p1Points)

            }
        }
    }
    
    func addCustomViews() {
        // Add ScoreSheet Image

        //self.bringSubview(toFront: scoreSheetImageView)

        
        // Add Label - which team put the player first
        addLabelToView(view: self, tag: UIElementTags.teamPutFirstPlayer, text: String(leagueMatch.hostPutFirstPlayer ? ((leagueMatch.hostTeam?.teamId)! % 100) : ((leagueMatch.visitingTeam?.teamId)! % 100)))
        
        // Add Label - Start Time and End Time
        addLabelToView(view: self, tag: UIElementTags.startTime, text: String(describing: leagueMatch.startTime))
        addLabelToView(view: self, tag: UIElementTags.endTime, text: String(describing: leagueMatch.endTime))
        
        // Add Host Team details
        addLabelToView(view: self, tag: UIElementTags.homeTeamName, text: (leagueMatch.hostTeam?.name)!)
        addLabelToView(view: self, tag: UIElementTags.homeTeamId, text: String((leagueMatch.hostTeam?.teamId)!%100))
        addLabelToView(view: self, tag: UIElementTags.homeTeamTotalScore, text: String(leagueMatch.hostTeamScore))

        
        // Add Visiting Team details
        addLabelToView(view: self, tag: UIElementTags.visitingTeamName, text: (leagueMatch.visitingTeam?.name)!)
        addLabelToView(view: self, tag: UIElementTags.visitingTeamId, text: String((leagueMatch.visitingTeam?.teamId)!%100))
        addLabelToView(view: self, tag: UIElementTags.visitingTeamTotalScore, text: String(leagueMatch.visitingTeamScore))

        
        // Add all SingleMatch scores
        self.addScoresToView(leagueMatch: leagueMatch)
        
        
        createPdfFromView(fileName: "filledScoreSheet.pdf")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawPDFfromURL(url: URL, page: Int = 1) -> UIImage? {
        guard let document = CGPDFDocument(url as CFURL) else { return nil }
        guard let page = document.page(at: page) else { return nil }
        print("rotation angle is : \(page.rotationAngle)")
        
        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)
            print("height is : \(pageRect.size.height)")
            print("width is: \(pageRect.size.width)")
            
            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
            //ctx.cgContext.rotate(by: CGFloat(M_PI) / CGFloat(2.0))
            ctx.cgContext.drawPDFPage(page)
        }
        
        return img
    }
    
    func createPdfFromView(fileName: String)
    {
        let pdfData = NSMutableData()
        let tuple1 : (x: Int, y: Int, width: Int, height: Int) = UIElementPositions[UIElementTags.scoreSheetImage]!
        let bounds: CGRect = CGRect(x: tuple1.x, y: tuple1.y, width: tuple1.width, height: tuple1.height)
        UIGraphicsBeginPDFContextToData(pdfData, bounds, nil)
        UIGraphicsBeginPDFPage()
        
        guard let pdfContext = UIGraphicsGetCurrentContext() else { return }
        
        self.layer.render(in: pdfContext)
        
        
        //add page 2
        //self.scoreSheetImageView.image = drawPDFfromURL(url: scoreSheetUrl, page: 2)
        //UIGraphicsBeginPDFPage()
        //self.scoreSheetImageView.layer.render(in: pdfContext)
        //finished adding page 2
        UIGraphicsEndPDFContext()
        
        if let documentDirectories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let documentsFileName = documentDirectories + "/" + fileName
            debugPrint(documentsFileName)
            pdfData.write(toFile: documentsFileName, atomically: true)
        }
    }
}

class PrintPDFViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let globalTestLeagueMatch = TestLeagueMatch()

        let toPrintView: ToPrintView = ToPrintView(scoreSheetUrl: URL(fileReferenceLiteralResourceName: "scoresheet.pdf"), leagueMatch: globalTestLeagueMatch.currentLeagueMatch)
        self.view.addSubview(toPrintView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
