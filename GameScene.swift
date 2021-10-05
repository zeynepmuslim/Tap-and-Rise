//
//  GameScene.swift
//  Hostes
//
//  Created by Zeynep Müslim on 17.12.2020.
//

import SpriteKit
import GameplayKit
import GameKit

class GameScene: SKScene, SKPhysicsContactDelegate, GKGameCenterControllerDelegate{
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Düzelt
    
    let LEADERBOARD_ID = "com.sirinmuslim.Hostes"
 
    var coinTimer : Timer?
    var bombTimer : Timer?
    var ceil : SKSpriteNode?
    var scoreLabel = SKLabelNode(text: " ")
    var yourScoreLabel : SKLabelNode?
    var finalScoreLabel : SKLabelNode?
    var highScoreLabel : SKLabelNode?
    var highScore = 0
    var isGameOver = false
    let characterButton = SKSpriteNode(imageNamed: "selectCharacter")
    var box : SKSpriteNode?
    
    let winnerButton = SKSpriteNode(imageNamed: "winner")
    
   // var coSize = CGSize(width: UIScreen.main.bounds.height / 15, height: UIScreen.main.bounds.height / 15)
    
    let coinManCategory : UInt32 = 0x1 << 1
    let coinCategory : UInt32 = 0x1 << 2
    let bombCategory : UInt32 = 0x1 << 3
    let groundAndCeil : UInt32 = 0x1 << 4
    
    var score = 0
    
    let coinMan = SKSpriteNode(imageNamed: "purpleBat-frame-1")
    
    let startBackground = SKSpriteNode(imageNamed: "background")
    let gameStartButton = SKSpriteNode(imageNamed: "basla")
    let startBat = SKSpriteNode(imageNamed: "purpleBat-frame-1")
    let startButton = SKSpriteNode(imageNamed: "start")
    let gameName = SKLabelNode(text: "Tap and Rise")
    
    var settingsLabel = SKLabelNode(text: "Seçenekler")
    var startLabel = SKLabelNode(text: "Başlat")
    let settingsButton = SKSpriteNode(imageNamed: "settings")
    
    var startText = ""
    var scorText = ""
    var settingText = ""
    var highscoreText = ""
    
    @objc func arkadayim(_ notification: Notification) {
        scene?.isPaused = true
    }
    
    @objc func aktifoldum(_ notification: Notification) {
        if isGameOver == true {
        scene?.isPaused = true
        }
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        isGameOver = false
        
        
        
        if UserDefaults.standard.object(forKey: "height") == nil {
            UserDefaults.standard.set(size.height, forKey: "height")
        }
        if UserDefaults.standard.object(forKey: "width") == nil {
            UserDefaults.standard.set(size.width, forKey: "width")
        }
        
        let height = UserDefaults.standard.object(forKey: "height")
        let width = UserDefaults.standard.object(forKey: "width")
        
        if UserDefaults.standard.object(forKey: "language") == nil {
            UserDefaults.standard.set("english", forKey: "language")
        }
        if UserDefaults.standard.object(forKey: "highscore") == nil {
            UserDefaults.standard.set(0, forKey: "highscore")
        }
        if UserDefaults.standard.object(forKey: "ground") == nil {
            UserDefaults.standard.set("stone", forKey: "ground")
        }
        if UserDefaults.standard.object(forKey: "groundSizeWidth") == nil {
            UserDefaults.standard.set(16 * size.height / 15 / 7, forKey: "groundSizeWidth")
        }
        if UserDefaults.standard.object(forKey: "groundSizeHeight") == nil {
            UserDefaults.standard.set(size.height / 15, forKey: "groundSizeHeight")
        }
        if UserDefaults.standard.object(forKey: "character") == nil {
            UserDefaults.standard.set("purpleBat", forKey: "character")
        }
        if UserDefaults.standard.object(forKey: "characterFrame") == nil {
            UserDefaults.standard.set(4, forKey: "characterFrame")
        }
        if UserDefaults.standard.object(forKey: "characterTime") == nil {
            UserDefaults.standard.set(0.1, forKey: "characterTime")
        }
        if UserDefaults.standard.object(forKey: "characterSizeWidth") == nil {
            UserDefaults.standard.set(height as! Double / 7.5, forKey: "characterSizeWidth")
        }
        if UserDefaults.standard.object(forKey: "characterSizeHeight") == nil {
            UserDefaults.standard.set(height as! Double / 7.5, forKey: "characterSizeHeight")
        }
        if UserDefaults.standard.object(forKey: "backgroundSizeWidth") == nil {
            UserDefaults.standard.set(height as! Int * 414 / 179 , forKey: "backgroundSizeWidth")
        }
        if UserDefaults.standard.object(forKey: "backgroundSizeHeight") == nil {
            UserDefaults.standard.set(height, forKey: "backgroundSizeHeight")
        }
        if UserDefaults.standard.object(forKey: "background") == nil {
            UserDefaults.standard.set("cave", forKey: "background")
        }
        if UserDefaults.standard.object(forKey: "language") == nil {
            UserDefaults.standard.set("english", forKey: "language")
        }
    
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(aktifoldum), name: UIApplication.didBecomeActiveNotification, object: nil)

        if #available(iOS 13.0, *) {
            NotificationCenter.default.addObserver(self, selector: #selector(arkadayim), name: UIScene.willDeactivateNotification, object: nil)
        } else {
            NotificationCenter.default.addObserver(self, selector: #selector(arkadayim), name: UIApplication.willResignActiveNotification, object: nil)
        }

        physicsWorld.gravity = CGVector(dx: 0, dy: height as! Double * -10.62 / 1334)
        
        //LANGUAGE
        
        let selectedLanguage = UserDefaults.standard.object(forKey: "language") as! String
        
        if selectedLanguage == "english" {
            scorText = "Score:"
            highscoreText = "Highscore: "
            startText = "Start"
            settingText = "Settings"
        }
        if selectedLanguage == "turkish" {
            scorText = "Skor:"
            highscoreText = "En yüksek skor: "
            startText = "Başlat"
            settingText = "Seçenekler"
        }
        if selectedLanguage == "french" {
            scorText = "Score:"
            highscoreText = "Meilleur score: "
            startText = "Commencer"
            settingText = "Les Options"
        }
        
        if selectedLanguage == "german" {
            scorText = "Ergebnis:"
            highscoreText = "Highscore: "
            startText = "Start"
            settingText = "Optionen"
        }
        
        startBackground.size = CGSize(width: size.width, height: size.width * 463 / 214)
        startBackground.position = CGPoint(x: 0, y: 0)
        startBackground.zPosition = 9
        addChild(startBackground)
        
        startButton.size = CGSize(width: width as! Double * 0.6, height: width as! Double * 0.6 / 3)
        startButton.position = CGPoint(x: 0, y: -300)
        startButton.zPosition = 10
        startButton.name = "gameStart"
        addChild(startButton)
        
        startLabel.text = startText
        startLabel.position = CGPoint(x: 0, y: -300)
        startLabel.zPosition = 10
        
        if selectedLanguage == "french" {
            startLabel.fontSize = 70.0
        } else {
            startLabel.fontSize = 90.0
        }
        
        gameName.fontColor = .white
        gameName.verticalAlignmentMode = .center
        gameName.zPosition = 10
        gameName.position = CGPoint(x: 0, y: 400)
        gameName.fontSize = 100
        addChild(gameName)
        
        startLabel.fontColor = .white
        startLabel.verticalAlignmentMode = .center
        addChild(startLabel)

        startBat.position = CGPoint(x: 0, y: 100)
        startBat.zPosition = 10
        startBat.size = CGSize(width: size.width * 0.3, height: size.width * 0.3)

        var flying : [SKTexture] = []
        for number in 1...4 {
            flying.append(SKTexture(imageNamed: "purpleBat-frame-\(number)"))
        }
        startBat.run(SKAction.repeatForever(SKAction.animate(with: flying, timePerFrame: 0.1)))
        addChild(startBat)
        
        scoreLabel.text = "\(scorText) 0"
        
        scoreLabel.fontSize = 70.0
        scoreLabel.fontColor = .white
        scoreLabel.position = CGPoint(x: 0, y: 500)
        scoreLabel.zPosition = 8
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if scene?.isPaused == false {
            coinMan.physicsBody?.applyForce(CGVector(dx: 0, dy: 90_000))
        }
        
        
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let theNodes = nodes(at: location)
            
            for node in theNodes {
                
            
                if node.name == "play" {
                    // yeniden başlat
                    isGameOver = false
                    score = 0
                    
                    node.removeFromParent()

                    finalScoreLabel?.removeFromParent()
                    yourScoreLabel?.removeFromParent()
                    box?.removeFromParent()
                    scoreLabel.isHidden = false
                    highScoreLabel?.removeFromParent()
                    characterButton.removeFromParent()
                    settingsLabel.removeFromParent()
                    settingsButton.removeFromParent()
                    winnerButton.removeFromParent()
                    scene?.isPaused = false
                    scoreLabel.text = "\(scorText) \(score)"
                    startTimers()
                }
                
                
                let vc = view?.window?.rootViewController;
                
                if node.name == "settings" {
                    //karakter ekranına geçiş
                    node.removeFromParent()
                    print("noluyo")
                    scoreLabel.removeFromParent()
                   
                   vc?.performSegue(withIdentifier: "toCharacterVC", sender: nil)
                    
                }
                
                if node.name == "winner" {
                    //Game Center
                    let gcVC = GKGameCenterViewController()
                        gcVC.gameCenterDelegate = self
                        gcVC.viewState = .leaderboards
                        gcVC.leaderboardIdentifier = LEADERBOARD_ID
                    vc?.present(gcVC, animated: true, completion: nil)
                }
//
                if node.name == "gameStart" {
                    //başlata dokunma
                    node.removeFromParent()
                    startBackground.removeFromParent()
                    startBat.removeFromParent()
                    startLabel.removeFromParent()
                    gameName.removeFromParent()
                    
                    ceil = childNode(withName: "ceil") as? SKSpriteNode
                    ceil?.physicsBody?.categoryBitMask = groundAndCeil
                    ceil?.physicsBody?.collisionBitMask = coinManCategory
                    
                    //scoreLabel = childNode(withName: "scoreLabel") as? SKLabelNode
                    
                    addChild(scoreLabel)
                    startTimers()
                    createBlock()
                    createBack()
                    createCoinMan()
                    
                }
                
            }
        }
    }
    
    func createBack() {
        
        let height = UserDefaults.standard.object(forKey: "height")
        
        let backgroundSizeWidth = UserDefaults.standard.object(forKey: "backgroundSizeWidth") as? CGFloat
        
        let blSize = CGSize(width: backgroundSizeWidth!, height: height as! CGFloat)
        
        let speed = 60.0
    
        let moveBGAnimation = SKAction.move(by: CGVector(dx: -blSize.width, dy: 0), duration: TimeInterval(blSize.width) / speed)
        let shiftBGAnimation = SKAction.move(by: CGVector(dx: blSize.width, dy: 0), duration: 0)
        let moveBGForever = SKAction.repeatForever(SKAction.sequence([moveBGAnimation, shiftBGAnimation]))
        
        var i: CGFloat = 0
        
        while i < 3 {
            let block = SKSpriteNode(imageNamed: UserDefaults.standard.object(forKey: "background") as! String)
            block.size = blSize
            block.position = CGPoint(x:block.size.width * i, y: self.frame.midY)
            block.size.height = self.frame.height
            block.run(moveBGForever)
            block.zPosition = -3
            self.addChild(block)
            i += 1
        }
    }
    
    func createBlock() {
        
        let wiTry = UserDefaults.standard.object(forKey: "width")
        
        
        let ground = UserDefaults.standard.object(forKey: "ground") as! String
        
        
        let groundHe = UserDefaults.standard.object(forKey: "groundSizeHeight") as? CGFloat
        let groundWi = UserDefaults.standard.object(forKey: "groundSizeWidth") as? CGFloat

        let numberOfBlock = Int(wiTry as! CGFloat / groundWi!) + 1
        
        
        for number in 0...numberOfBlock {
            let block = SKSpriteNode(imageNamed: ground)
            block.size = CGSize(width: groundWi! , height: groundHe!)
            block.physicsBody = SKPhysicsBody(rectangleOf: block.size)
            block.physicsBody?.categoryBitMask = groundAndCeil
            block.physicsBody?.collisionBitMask = coinManCategory
            block.physicsBody?.affectedByGravity = false
            
           
            block.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "metal"), size: block.size)
            block.physicsBody?.isDynamic = false
            block.physicsBody?.allowsRotation = false
            addChild(block)
            
            let blockX = -size.width / 2 + block.size.width / 2 + block.size.width * CGFloat(number)
            
            block.position = CGPoint(x: blockX, y: -size.height / 2 + block.size.height / 2)
            
            let speed = 120.0
            let firstMoveLeft = SKAction.moveBy(x: -block.size.width - block.size.width * CGFloat(number) , y: 0, duration: TimeInterval(block.size.width + block.size.width * CGFloat(number)) / speed)
            
            let resetBlock = SKAction.moveBy(x: size.width + block.size.width, y: 0, duration: 0)
            let blockFullMove = SKAction.moveBy(x: -size.width - block.size.width, y: 0, duration: TimeInterval(size.width + block.size.width) / speed)
            let blockMovingForever = SKAction.repeatForever(SKAction.sequence([blockFullMove, resetBlock]))
            
            block.run(SKAction.sequence([firstMoveLeft, resetBlock, blockMovingForever]))
            
        }
    }
    

    
    func startTimers() {
        coinTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.createCoin()
        })
        bombTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.createBomb()
        })
    }
    
    func createCoin() {
        
        
        let wiTry = UserDefaults.standard.object(forKey: "width")
        let height = UserDefaults.standard.object(forKey: "height")
        
        let coSize = CGSize(width: height as! Int / 20, height: height as! Int / 20)
        let texture = SKTexture(imageNamed: "coin")
        let coin = SKSpriteNode(imageNamed: "coin")
        coin.physicsBody = SKPhysicsBody(texture: texture, size: coSize)
        coin.physicsBody?.affectedByGravity = false
        coin.physicsBody?.categoryBitMask = coinCategory
        coin.physicsBody?.contactTestBitMask = coinManCategory
        coin.size = coSize
        coin.zPosition = -1
    
        coin.physicsBody?.collisionBitMask = 0
        
        var coinTurn : [SKTexture] = []
        for number in 1...8 {
            coinTurn.append(SKTexture(imageNamed: "coin-frame-\(number)"))
        }
        coin.run(SKAction.repeatForever(SKAction.animate(with: coinTurn, timePerFrame: 0.1)))
        
        addChild(coin)
        let blSize = CGSize(width: height as! Int / 7 * 2, height: height as! Int / 8 )
        
        let maxY = size.height / 2 - coin.size.height / 60
        let minY = -size.height / 2 + coin.size.height / 2 + blSize.height
        let range = maxY - minY
        let coinY = maxY - CGFloat(arc4random_uniform(UInt32(range)))
        
        coin.position = CGPoint(x: wiTry as! CGFloat / 2 + coin.size.width / 2, y: coinY)
        
        let moveLeft = SKAction.moveBy(x: -size.width - coin.size.width, y: 0, duration: 4)
        
        coin.run(SKAction.sequence([moveLeft, SKAction.removeFromParent()]))
    }
    
    func createBomb() {
        
        
        let height = UserDefaults.standard.object(forKey: "height")
        
        let coSize = CGSize(width: height as! Int / 20, height: height as! Int / 20)
        
        let bomb = SKSpriteNode(imageNamed: "bomb")
        bomb.physicsBody = SKPhysicsBody(rectangleOf: coSize)
        bomb.physicsBody?.affectedByGravity = false
        bomb.physicsBody?.categoryBitMask = bombCategory
        bomb.physicsBody?.contactTestBitMask = coinManCategory
        bomb.size = coSize
        bomb.physicsBody?.collisionBitMask = 0
        
        var fireBurn : [SKTexture] = []
        for number in 1...10 {
            fireBurn.append(SKTexture(imageNamed: "fire-frame-\(number)"))
        }
        bomb.run(SKAction.repeatForever(SKAction.animate(with: fireBurn, timePerFrame: 0.1)))
        
        addChild(bomb)
        
        
        let blSize = CGSize(width: height as! Int / 7 * 2 , height: height as! Int / 8 )
        //let screenSizeW = view!.frame.size.width
        let maxY = size.height / 2 - bomb.size.height / 2
        let minY = -size.height / 2 + bomb.size.height / 2 + blSize.height
        let range = maxY - minY
        let coinY = maxY - CGFloat(arc4random_uniform(UInt32(range)))
        
        bomb.position = CGPoint(x: size.width / 2 + bomb.size.width / 2, y: coinY)
        
        let moveLeft = SKAction.moveBy(x: -size.width - bomb.size.width, y: 0, duration: 4)
        
        bomb.run(SKAction.sequence([moveLeft, SKAction.removeFromParent()]))
        
    }
    
    func createCoinMan() {
        
        let coinManSizeWidth = UserDefaults.standard.object(forKey: "characterSizeWidth") as? CGFloat
        let coinManSizeHeight = UserDefaults.standard.object(forKey: "characterSizeHeight") as? CGFloat
      
            
        coinMan.size = CGSize(width: coinManSizeWidth!, height: coinManSizeHeight!)
        
        coinMan.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: UserDefaults.standard.object(forKey: "characterSizeWidth") as! CGFloat, height: UserDefaults.standard.object(forKey: "characterSizeHeight") as! CGFloat))
        
        // ağırlık
        coinMan.physicsBody?.mass = 1.5
        coinMan.physicsBody?.affectedByGravity = true
        coinMan.physicsBody?.categoryBitMask = coinManCategory
        coinMan.physicsBody?.contactTestBitMask = coinCategory | bombCategory
        coinMan.physicsBody?.collisionBitMask = groundAndCeil
        
        coinMan.physicsBody?.allowsRotation = false
        coinMan.position = CGPoint(x: -160, y: 400)
        
        let selectedCharacter = UserDefaults.standard.object(forKey: "character")
        let selectedFrame = UserDefaults.standard.object(forKey: "characterFrame") as! Int
        let selectedTime = UserDefaults.standard.object(forKey: "characterTime") as! Double
    
        var coinManRun : [SKTexture] = []
        for number in 1...selectedFrame {
            coinManRun.append(SKTexture(imageNamed: "\(selectedCharacter!)-frame-\(number)"))
        }
        
        
        coinMan.run(SKAction.repeatForever(SKAction.animate(with: coinManRun, timePerFrame: TimeInterval(selectedTime))))
        addChild(coinMan)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.categoryBitMask == coinCategory{
            contact.bodyA.node?.removeFromParent()
            score += 1
            scoreLabel.text = "\(scorText) \(score)"
            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
            impactFeedbackgenerator.prepare()
            impactFeedbackgenerator.impactOccurred()
        }
        if contact.bodyB.categoryBitMask == coinCategory{
            contact.bodyB.node?.removeFromParent()
            score += 1
            scoreLabel.text = "\(scorText) \(score)"
            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
            impactFeedbackgenerator.prepare()
            impactFeedbackgenerator.impactOccurred()
        }
        
        if contact.bodyA.categoryBitMask == bombCategory{
            contact.bodyA.node?.removeFromParent()
            gameOver()
        }
        if contact.bodyB.categoryBitMask == bombCategory{
            contact.bodyB.node?.removeFromParent()
            gameOver()
        }
    }
    
    func gameOver() {
        
        let width = UserDefaults.standard.object(forKey: "width") as! Double
        let height = UserDefaults.standard.object(forKey: "height") as! Double
        scene?.isPaused = true
        scoreLabel.isHidden = true
        isGameOver = true
        
        scoreLabel.isHidden = true
        
        coinTimer?.invalidate()
        bombTimer?.invalidate()
        
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
        
        box = SKSpriteNode(color: UIColor.black, size: CGSize(width: size.width, height: size.height))
        box?.position = CGPoint(x: 0, y: 0)
        box?.alpha = CGFloat(0.5)
        box?.zPosition = 1
        if box != nil {
            addChild(box!)
        }
        
        yourScoreLabel = SKLabelNode(text: "\(scorText)")
        yourScoreLabel?.position = CGPoint(x: 0, y: 170)
        yourScoreLabel?.fontSize = 130
        yourScoreLabel?.zPosition = 2
        if yourScoreLabel != nil {
            addChild(yourScoreLabel!)
        }
        
        finalScoreLabel = SKLabelNode(text: "\(score)")
        finalScoreLabel?.position = CGPoint(x: 0, y: 0)
        finalScoreLabel?.fontSize = 170
        finalScoreLabel?.zPosition = 2
        if finalScoreLabel != nil {
            addChild(finalScoreLabel!)
        }
        
        
        
        
      //  UserDefaults.standard.set(100, forKey: "highscore")
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
   
        
        
        
        print(storedHighScore!)
        
        

        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel = SKLabelNode(text: "\(highscoreText)\(highScore)")
        }

        if score > highScore {
            highScore = score
            
            highScoreLabel = SKLabelNode(text: "\(highscoreText)\(highScore)")
            UserDefaults.standard.set(highScore, forKey: "highscore")
            // Submit score to GC leaderboard
                let bestScoreInt = GKScore(leaderboardIdentifier: LEADERBOARD_ID)
                bestScoreInt.value = Int64(highScore)
                GKScore.report([bestScoreInt]) { (error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        print("Best Score submitted to your Leaderboard!")
                    }
                }
        }

        highScoreLabel?.position = CGPoint(x: 0, y: 300)
        highScoreLabel?.fontSize = 50
        highScoreLabel?.zPosition = 2
        if highScoreLabel != nil {
            addChild(highScoreLabel!)
        }
        
        let playButton = SKSpriteNode(imageNamed: "play")
        playButton.position = CGPoint(x: 0, y: -250)
        playButton.size = CGSize(width: width * 0.4, height: width * 0.4)
        playButton.name = "play"
        playButton.zPosition = 2
        addChild(playButton)
        
        winnerButton.size = CGSize(width: width * 0.1 , height: width * 0.1)
        let sizePlusBlack = width * 0.15 * 1.3
        winnerButton.position = CGPoint(x: 0, y: height / 2 - sizePlusBlack)
        winnerButton.name = "winner"
        winnerButton.zPosition = 2
        addChild(winnerButton)
        
        settingsButton.position = CGPoint(x: 0, y: -540)
        settingsButton.size = CGSize(width: width * 0.6, height: width * 0.15)
        settingsButton.name = "settings"
        settingsButton.zPosition = 2
        
        settingsLabel.position = CGPoint(x: 0, y: -540)
        settingsLabel.verticalAlignmentMode = .center
        settingsLabel.fontSize = 65.0
        settingsLabel.zPosition = 2
        settingsLabel.fontColor = .white
        settingsLabel.text = settingText
        
        addChild(settingsButton)
        addChild(settingsLabel)
        
        print("öldün çık")
    }
}
