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
    visitingTeamTotalScore
//
//    //single match elements
//    p1Team,
//    p2Team,
//    p1Id,
//    p2Id,
//    p1Name,
//    p2Name,
//    p1SL,
//    p2SL,
//    p1BallCount,
//    p2BallCount,
//    p1NineSnap,
//    p1BnR,
//    p2NineSnap,
//    p2BnR,
//    innings,
//    p1Defenses,
//    p2Defenses,
//    p1Score,
//    p2Score,
//    p1Points,
//    p2Points,
//    team1RunningTotal,
//    team2RunningTotal
}
//
var UIElementPositions: [UIElementTags: CGRect] = [
    UIElementTags.scoreSheetImage:          CGRect(x: 0, y: 0, width: 792, height: 612),
    UIElementTags.teamPutFirstPlayer:       CGRect(x: 120, y: 3, width: 25, height: 20),
    UIElementTags.startTime:                CGRect(x: 575, y: 3, width: 80, height: 20),
    UIElementTags.endTime:                  CGRect(x: 690, y: 3, width: 80, height: 20),
    UIElementTags.homeTeamName:             CGRect(x: 165, y: 564, width: 110, height: 20),
    UIElementTags.homeTeamId:               CGRect(x: 285, y: 564, width: 30, height: 20),
    UIElementTags.homeTeamTotalScore:       CGRect(x: 335, y: 564, width: 40, height: 20),
    UIElementTags.visitingTeamName:         CGRect(x: 563, y: 564, width: 110, height: 20),
    UIElementTags.visitingTeamId:           CGRect(x: 683, y: 564, width: 30, height: 20),
    UIElementTags.visitingTeamTotalScore:   CGRect(x: 733, y: 564, width: 40, height: 20)
//
//    //singleMatch element positions
//    UIElementTags.p1Team:                   CGRect(x: 1, y: 25, width: 20, height: 20),
//    UIElementTags.p2Team:                   CGRect(x: 1, y: 61, width: 20, height: 20),
//    UIElementTags.p1Id:                     CGRect(x: 27, y: 19, width: 115, height: 16),
//    UIElementTags.p1Name:                   CGRect(x: 27, y: 36, width: 115, height: 16),
//    UIElementTags.p2Id:                     CGRect(x: 27, y: 53, width: 115, height: 16),
//    UIElementTags.p2Name:                   CGRect(x: 27, y: 70, width: 115, height: 16),
//    UIElementTags.p1SL:                     CGRect(x: 142, y: 18, width: 15, height: 15),
//    UIElementTags.p1BallCount:              CGRect(x: 156, y: 40, width: 15, height: 15),
//    UIElementTags.p2SL:                     CGRect(x: 142, y: 52, width: 15, height: 15),
//    UIElementTags.p2BallCount:              CGRect(x: 156, y: 64, width: 15, height: 15)
//
]
//
var labelTextSizes: [UIElementTags: CGFloat] = [
    UIElementTags.teamPutFirstPlayer:       15,
    UIElementTags.startTime:                15,
    UIElementTags.endTime:                  15,
    UIElementTags.homeTeamName:             10,
    UIElementTags.homeTeamId:               14,
    UIElementTags.homeTeamTotalScore:       14,
    UIElementTags.visitingTeamName:         11,
    UIElementTags.visitingTeamId:           14,
    UIElementTags.visitingTeamTotalScore:   14
//
//    //singleMatch label text sizes
//    UIElementTags.p1Team:                   15,
//    UIElementTags.p2Team:                   15,
//    UIElementTags.p1Id:                     12,
//    UIElementTags.p1Name:                   12,
//    UIElementTags.p2Id:                     12,
//    UIElementTags.p2Name:                   12,
//    UIElementTags.p1SL:                     12,
//    UIElementTags.p1BallCount:              10,
//    UIElementTags.p2SL:                     12,
//    UIElementTags.p2BallCount:              10
//
]
//
func addLabelToView(view: UIView, tag: UIElementTags, text: String) {
    let label: UILabel = UILabel(frame: UIElementPositions[tag]!)
    label.font = UIFont(name: "ChalkboardSE-Regular", size: 20)
    label.font = label.font.withSize(labelTextSizes[tag]!)
    label.textAlignment = .center
    label.textColor = UIColor.blue
    label.text = text
    view.addSubview(label)
}

class SingleMatchView: UIView {
    var match: SingleMatch
    init(match: SingleMatch, frame: CGRect) {
        self.match = match
        super.init(frame: frame)
        //self.addCustomView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func addCustomView() {
//        let p1: Player = match.p1BrokeFirst ? match.player1 : match.player2
//        let p2: Player = match.p1BrokeFirst ? match.player2 : match.player1
//
//        
//        // Add team numbers
//        let  p1Team: String = (p1.currentTeam == nil ? String("") : String((p1.currentTeam!.teamId) % 100))
//        addLabelToView(view: self, tag: UIElementTags.p1Team, text: p1Team)
//        let  p2Team: String = (p2.currentTeam == nil ? String("") : String((p2.currentTeam!.teamId) % 100))
//        addLabelToView(view: self, tag: UIElementTags.p2Team, text: p2Team)
//        addLabelToView(view: self, tag: UIElementTags.p1Id, text: p1.playerId)
//        addLabelToView(view: self, tag: UIElementTags.p2Id, text: p2.playerId)
//        addLabelToView(view: self, tag: UIElementTags.p1Name, text: p1.name)
//        addLabelToView(view: self, tag: UIElementTags.p2Name, text: p2.name)
//    }
    
    
}

class ToPrintView: UIView {
    var scoreSheetImageView: UIImageView
    var singleMatchViews = [SingleMatchView?](repeating: nil, count: 5)
    var scoreSheetUrl : URL
    var leagueMatch: LeagueMatch
    
    init(scoreSheetUrl: URL, leagueMatch: LeagueMatch) {
        let bounds = UIElementPositions[UIElementTags.scoreSheetImage]
        self.scoreSheetImageView = UIImageView(frame: bounds!)
        self.scoreSheetUrl = scoreSheetUrl
        self.leagueMatch = leagueMatch
        super.init(frame: bounds!)

        addCustomViews()
    }
//    
//    func addScoresToView(leagueMatch: LeagueMatch) {
//        for (idx, singleMatch) in leagueMatch.matches.enumerated() {
//            if singleMatch == nil {
//                print (" match \(idx) is nil")
//                return
//            } else {
//                print ("printing match \(idx)")
//                let bounds: CGRect = CGRect(x: 53, y: (106*idx + 27), width: 722, height: 105)
//                singleMatchViews[idx] = SingleMatchView(match: singleMatch!, frame: bounds)
//                self.addSubview(singleMatchViews[idx]!)
//                return
//            }
//        }
//    }
    
    func addCustomViews() {
        // Add ScoreSheet Image
        self.scoreSheetImageView.image = drawPDFfromURL(url: scoreSheetUrl)
        self.addSubview(scoreSheetImageView)
        self.bringSubview(toFront: scoreSheetImageView)

        
        // Add Label - which team put the player first
        addLabelToView(view: self, tag: UIElementTags.teamPutFirstPlayer, text: String(leagueMatch.hostPutFirstPlayer ? (leagueMatch.hostTeam.teamId % 100) : (leagueMatch.visitingTeam.teamId % 100)))
        
        // Add Label - Start Time and End Time
        addLabelToView(view: self, tag: UIElementTags.startTime, text: leagueMatch.startTime)
        addLabelToView(view: self, tag: UIElementTags.endTime, text: leagueMatch.endTime)
        
        // Add Host Team details
        addLabelToView(view: self, tag: UIElementTags.homeTeamName, text: leagueMatch.hostTeam.name)
        addLabelToView(view: self, tag: UIElementTags.homeTeamId, text: String(leagueMatch.hostTeam.teamId%100))
        addLabelToView(view: self, tag: UIElementTags.homeTeamTotalScore, text: String(leagueMatch.hostTeamScore))

        
        // Add Visiting Team details
        addLabelToView(view: self, tag: UIElementTags.visitingTeamName, text: leagueMatch.visitingTeam.name)
        addLabelToView(view: self, tag: UIElementTags.visitingTeamId, text: String(leagueMatch.visitingTeam.teamId%100))
        addLabelToView(view: self, tag: UIElementTags.visitingTeamTotalScore, text: String(leagueMatch.visitingTeamScore))

        
        // Add all SingleMatch scores
        //self.addScoresToView(leagueMatch: leagueMatch)
        
        
        createPdfFromView(fileName: "filledScoreSheet.pdf")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawPDFfromURL(url: URL) -> UIImage? {
        guard let document = CGPDFDocument(url as CFURL) else { return nil }
        guard let page = document.page(at: 1) else { return nil }
        
        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)
            print("height is : \(pageRect.size.height)")
            print("width is: \(pageRect.size.width)")
            
            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height);
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0);
            
            ctx.cgContext.drawPDFPage(page);
        }
        
        return img
    }
    
    func createPdfFromView(fileName: String)
    {
        let pdfData = NSMutableData()
        let bounds: CGRect = UIElementPositions[UIElementTags.scoreSheetImage]!
        UIGraphicsBeginPDFContextToData(pdfData, bounds, nil)
        UIGraphicsBeginPDFPage()
        
        guard let pdfContext = UIGraphicsGetCurrentContext() else { return }
        
        self.layer.render(in: pdfContext)
        UIGraphicsEndPDFContext()
        
        if let documentDirectories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            print("Saving pdf in directory: \(documentDirectories)")
            let documentsFileName = documentDirectories + "/" + fileName
            debugPrint(documentsFileName)
            pdfData.write(toFile: documentsFileName, atomically: true)
        }
    }
}

class PrintPDFViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
        let globalTestLeagueMatch = TestLeagueMatch()

        let toPrintView: ToPrintView = ToPrintView(scoreSheetUrl: URL(fileReferenceLiteralResourceName: "scoresheet.pdf"), leagueMatch: globalTestLeagueMatch.currentLeagueMatch)
        self.view.addSubview(toPrintView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
