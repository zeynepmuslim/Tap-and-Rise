//
//  CharacterVC.swift
//  Hostes
//
//  Created by Zeynep Müslim on 27.12.2020.
//

import UIKit

class CharacterVC: UIViewController {
    
    let highscore = UserDefaults.standard.object(forKey: "highscore") as! Int
    

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var characterLabel: UILabel!
    
    @IBOutlet weak var purpleBatImg: UIButton!
    @IBOutlet weak var purpleBatLabel: UILabel!
    
    @IBOutlet weak var blackBatImg: UIButton!
    @IBOutlet weak var blackBatLabel: UILabel!
    
    @IBOutlet weak var greenBirdImg: UIButton!
    @IBOutlet weak var greenBirdLabel: UILabel!
    
    @IBOutlet weak var flyMoneyImg: UIButton!
    @IBOutlet weak var flyMoneyLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var backgroundLabel: UILabel!
    
    @IBOutlet weak var caveBackgroundImg: UIButton!
    @IBOutlet weak var caveBackgroundLabel: UILabel!
    
    @IBOutlet weak var skyBackgroundImg: UIButton!
    @IBOutlet weak var skyBackgroundLabel: UILabel!
    
    @IBOutlet weak var themeLabel: UILabel!
    
    @IBOutlet weak var spaceThemeImg: UIButton!
    @IBOutlet weak var spaceThemeLabel: UILabel!
    
    @IBOutlet weak var seaThemeImg: UIButton!
    @IBOutlet weak var seaThemeLabel: UILabel!
    
    let width = UserDefaults.standard.object(forKey: "width") as! Double
    let height = UserDefaults.standard.object(forKey: "height") as! Double
    
    @IBOutlet weak var attributionLabel: UILabel!
    
    @IBOutlet weak var writerLabel: UILabel!
    
    @IBOutlet weak var turkishButton: UIButton!
    @IBOutlet weak var frenchButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var germanButton: UIButton!
    
    var defaultText: String = ""
    var highscoreText: String = ""
    var backText: String = ""
    var selectedText: String = ""
    var unlockedText: String = ""
    var characterText: String = ""
    var themeText: String = ""
    var backgroundText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let root = UIApplication.shared.keyWindow?.rootViewController
        root?.dismiss(animated: true, completion: nil)
        
        let language = UserDefaults.standard.object(forKey: "language") as! String
        let highscore = UserDefaults.standard.object(forKey: "highscore") as! Int
        
        blackBatImg.isEnabled = false
        skyBackgroundImg.isEnabled = false
        greenBirdImg.isEnabled = false
        spaceThemeImg.isEnabled = false
        seaThemeImg.isEnabled = false
        flyMoneyImg.isEnabled = false
        
        if highscore > 44 {
            flyMoneyImg.isEnabled = true
        }
        if highscore > 34 {
            seaThemeImg.isEnabled = true
        }
        if highscore > 29 {
            spaceThemeImg.isEnabled = true
        }
        if highscore > 24 {
            greenBirdImg.isEnabled = true
        }
        if highscore > 19 {
            skyBackgroundImg.isEnabled = true
            
        }
        if highscore > 14 {
            blackBatImg.isEnabled = true
        }
        
        let wi = view.frame.size.width
        //let he = view.frame.size.height
        
        backButton.frame = CGRect(x: wi * 0.1, y: wi * 0.1, width: wi * 0.4, height: wi * 0.10)
        backButton.layer.cornerRadius = 15
        
        characterLabel.frame = CGRect(x: wi * 0.1, y: wi * 0.25, width: wi * 0.8, height: wi * 0.15)
        
        purpleBatImg.frame = CGRect(x: wi * 0.1, y: wi * 0.4, width: wi * 0.35, height: wi * 0.35)
        purpleBatLabel.frame = CGRect(x: wi * 0.1, y: wi * 0.75, width: wi * 0.35, height: wi * 0.15)
        
        blackBatImg.frame = CGRect(x: wi * 0.55, y: wi * 0.4, width: wi * 0.35, height: wi * 0.35)
        blackBatLabel.frame = CGRect(x: wi * 0.55, y: wi * 0.75, width: wi * 0.35, height: wi * 0.15)
        
        greenBirdImg.frame = CGRect(x: wi * 0.1, y: wi * 0.95, width: wi * 0.35, height: wi * 0.35)
        greenBirdLabel.frame = CGRect(x: wi * 0.1, y: wi * 1.30, width: wi * 0.35, height: wi * 0.15)
        
        flyMoneyImg.frame = CGRect(x: wi * 0.55, y: wi * 0.95, width: wi * 0.35, height: wi * 0.35)
        flyMoneyLabel.frame = CGRect(x: wi * 0.55, y: wi * 1.30, width: wi * 0.35, height: wi * 0.15)
        
        backgroundLabel.frame = CGRect(x: wi * 0.1, y: wi * 1.45, width: wi * 0.8, height: wi * 0.15)
        
        caveBackgroundImg.frame = CGRect(x: wi * 0.1, y: wi * 1.6, width: wi * 0.35, height: wi * 0.35)
        caveBackgroundLabel.frame = CGRect(x: wi * 0.1, y: wi * 1.95, width: wi * 0.35, height: wi * 0.15)
        
        skyBackgroundImg.frame = CGRect(x: wi * 0.55, y: wi * 1.6, width: wi * 0.35, height: wi * 0.35)
        skyBackgroundLabel.frame = CGRect(x: wi * 0.55, y: wi * 1.95, width: wi * 0.35, height: wi * 0.15)
        
        themeLabel.frame = CGRect(x: wi * 0.1, y: wi * 2.1, width: wi * 0.8, height: wi * 0.15)
        
        spaceThemeImg.frame = CGRect(x: wi * 0.1, y: wi * 2.25, width: wi * 0.35, height: wi * 0.35)
        spaceThemeLabel.frame = CGRect(x: wi * 0.1, y: wi * 2.60, width: wi * 0.35, height: wi * 0.15)
        
        seaThemeImg.frame = CGRect(x: wi * 0.55, y: wi * 2.25, width: wi * 0.35, height: wi * 0.35)
        seaThemeLabel.frame = CGRect(x: wi * 0.55, y: wi * 2.60, width: wi * 0.35, height: wi * 0.15)
        
        englishButton.frame = CGRect(x: wi * 0.1, y: wi * 2.90, width: wi * 0.35, height: wi * 0.1)
        turkishButton.frame = CGRect(x: wi * 0.55, y: wi * 2.90, width: wi * 0.35, height: wi * 0.1)
        frenchButton.frame = CGRect(x: wi * 0.1, y: wi * 3.05, width: wi * 0.35, height: wi * 0.1)
        germanButton.frame = CGRect(x: wi * 0.55, y: wi * 3.05, width: wi * 0.35, height: wi * 0.1)
        
        ButtonSet(i: turkishButton)
        ButtonSet(i: englishButton)
        ButtonSet(i: frenchButton)
        ButtonSet(i: germanButton)
        
        bodyFontLight(i: purpleBatLabel)
        bodyFontLight(i: blackBatLabel)
        bodyFontLight(i: greenBirdLabel)
        bodyFontLight(i: flyMoneyLabel)
        bodyFontLight(i: caveBackgroundLabel)
        bodyFontLight(i: skyBackgroundLabel)
        bodyFontLight(i: spaceThemeLabel)
        bodyFontLight(i: seaThemeLabel)
        
        titleFontLight(i: characterLabel)
        titleFontLight(i: backgroundLabel)
        titleFontLight(i: themeLabel)
        
        
        attributionLabel.frame = CGRect(x: wi * 0.1, y: wi * 3.5, width: wi * 0.8, height: wi * 0.2)
        
        writerLabel.frame = CGRect(x: wi * 0.1, y: wi * 3.8, width: wi * 0.8, height: wi * 0.2)
        
        scrollView.contentSize = CGSize(width: wi, height: wi * 4 + wi)
        
       
        if UserDefaults.standard.object(forKey: "character") as! String == "purpleBat" {
            fadeThemes()
            fadeCharacter()
            purpleBatImg.alpha = 1.0
        }
        if UserDefaults.standard.object(forKey: "character") as! String == "blackBat" {
            fadeCharacter()
            blackBatImg.alpha = 1.0
            fadeThemes()
        }
        if UserDefaults.standard.object(forKey: "character") as! String == "greenBird" {
            fadeCharacter()
            greenBirdImg.alpha = 1.0
            fadeThemes()
            
        }
        if UserDefaults.standard.object(forKey: "character") as! String == "flyMoney" {
            fadeCharacter()
            flyMoneyImg.alpha = 1.0
            fadeThemes()
        }
        if UserDefaults.standard.object(forKey: "background") as! String == "cave" {
            fadeThemes()
            fadeBackground()
            caveBackgroundImg.alpha = 1.0
        }
        if UserDefaults.standard.object(forKey: "background") as! String == "sky" {
            fadeThemes()
            fadeBackground()
            skyBackgroundImg.alpha = 1.0
        }
        if UserDefaults.standard.object(forKey: "character") as! String == "shark" {
            fadeBackground()
            fadeCharacter()
            fadeThemes()
            seaThemeImg.alpha = 1.0
        }
        if UserDefaults.standard.object(forKey: "character") as! String == "ufo" {
            fadeBackground()
            fadeCharacter()
            fadeThemes()
            spaceThemeImg.alpha = 1.0
        }
        if UserDefaults.standard.object(forKey: "language") as! String == "turkish" {
            fadeButton()
            turkishButton.alpha = 1.0
        }
        if UserDefaults.standard.object(forKey: "language") as! String == "english" {
            fadeButton()
            englishButton.alpha = 1.0
        }
        if UserDefaults.standard.object(forKey: "language") as! String == "french" {
            fadeButton()
            frenchButton.alpha = 1.0
        }
        if UserDefaults.standard.object(forKey: "language") as! String == "german" {
            fadeButton()
            germanButton.alpha = 1.0
        }
        if language == "english" {
            englishClicked((Any).self)
        } else if language == "turkish" {
            turkishClicked((Any).self)
        } else if language == "german" {
            germanClicked((Any).self)
        } else if language == "french" {
            frenchClicked((Any).self)
        }
        
        print(flyMoneyLabel.font)
       
    }
    
    func bodyFontLight(i: UILabel) {
        i.font = UIFont.preferredFont(forTextStyle: .footnote)
        i.adjustsFontForContentSizeCategory = true
        i.font = UIFont.init(name: "HelveticaNeue-Light", size: i.font.pointSize)
    }
    
    func titleFontLight(i: UILabel) {
        i.font = UIFont.preferredFont(forTextStyle: .title1)
        i.adjustsFontForContentSizeCategory = true
        i.font = UIFont.init(name: "HelveticaNeue-Light", size: i.font.pointSize)
    }
    
    func ButtonSet(i : UIView){
        //  i.layer.borderWidth = CGFloat(3)
        // i.layer.borderColor = CGColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        i.layer.backgroundColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        i.layer.cornerRadius = 13
    }
    
    func makeCharacterPurpleBat() {
        let heiPurple = height / 7.5
        let widPurple = heiPurple
        
        UserDefaults.standard.set("purpleBat", forKey: "character")
        UserDefaults.standard.set(4, forKey: "characterFrame")
        UserDefaults.standard.set(0.08, forKey: "characterTime")
        UserDefaults.standard.set(widPurple, forKey: "characterSizeWidth")
        UserDefaults.standard.set(heiPurple, forKey: "characterSizeHeight")
    }
    
    func makeBackgroundCave() {
        let heiCaveB = height
        let widCaveB = 414 * heiCaveB / 179
        
        let widCaveG = width / 4
        let heiCaveG = 7 * widCaveG / 16
                
        UserDefaults.standard.set("stone", forKey: "ground")
        UserDefaults.standard.set(widCaveG, forKey: "groundSizeWidth")
        UserDefaults.standard.set(heiCaveG, forKey: "groundSizeHeight")
        
        UserDefaults.standard.set("cave", forKey: "background")
        UserDefaults.standard.set(widCaveB, forKey: "backgroundSizeWidth")
        UserDefaults.standard.set(heiCaveB, forKey: "backgroundSizeHeight")
    }
    
    func fadeThemes() {
        spaceThemeImg.alpha = 0.75
        seaThemeImg.alpha = 0.75
    }
    func fadeCharacter() {
        purpleBatImg.alpha = 0.75
        blackBatImg.alpha = 0.75
        greenBirdImg.alpha = 0.75
        flyMoneyImg.alpha = 0.75
    }
    func fadeBackground(){
        caveBackgroundImg.alpha = 0.75
        skyBackgroundImg.alpha = 0.75
    }
    func fadeButton() {
        englishButton.alpha = 0.5
        turkishButton.alpha = 0.5
        frenchButton.alpha = 0.5
        germanButton.alpha = 0.5
    }
    
    
    @IBAction func purpleBatClicked(_ sender: Any) {
        setTextsCharacter()
        setTextsTheme()
        purpleBatLabel.text = selectedText
        
        if seaThemeImg.alpha == 1.0 || spaceThemeImg.alpha == 1.0{
            fadeBackground()
            caveBackgroundImg.alpha = 1.0
            setTexts()
            purpleBatLabel.text = selectedText
            caveBackgroundLabel.text = selectedText
            makeBackgroundCave()
        }
        
        fadeThemes()
        fadeCharacter()
        purpleBatImg.alpha = 1.0
        let heiPurple = height / 7.5 // başta belirtmeyi unutma
        let widPurple = heiPurple
        UserDefaults.standard.set("purpleBat", forKey: "character")
        UserDefaults.standard.set(4, forKey: "characterFrame")
        UserDefaults.standard.set(0.1, forKey: "characterTime")
        UserDefaults.standard.set(widPurple, forKey: "characterSizeWidth")
        UserDefaults.standard.set(heiPurple, forKey: "characterSizeHeight")
    }

    
    @IBAction func blackBatClicked(_ sender: Any) {
        setTextsCharacter()
        setTextsTheme()
        blackBatLabel.text = selectedText
        
        if seaThemeImg.alpha == 1.0 || spaceThemeImg.alpha == 1.0{
            fadeBackground()
            caveBackgroundImg.alpha = 1.0
            setTexts()
            blackBatLabel.text = selectedText
            caveBackgroundLabel.text = selectedText
            makeBackgroundCave()
        }
        
        fadeThemes()
        fadeCharacter()
        blackBatImg.alpha = 1.0
        let heiBlack = height / 10
        let widBlack = heiBlack
        UserDefaults.standard.set("blackBat", forKey: "character")
        UserDefaults.standard.set(7, forKey: "characterFrame")
        UserDefaults.standard.set(0.06, forKey: "characterTime")
        UserDefaults.standard.set(widBlack, forKey: "characterSizeWidth")
        UserDefaults.standard.set(heiBlack, forKey: "characterSizeHeight")
    }
    
    @IBAction func greenBirdClicked(_ sender: Any) {
        setTextsCharacter()
        setTextsTheme()
        greenBirdLabel.text = selectedText
        
        if seaThemeImg.alpha == 1.0 || spaceThemeImg.alpha == 1.0{
            fadeBackground()
            caveBackgroundImg.alpha = 1.0
            setTexts()
            greenBirdLabel.text = selectedText
            caveBackgroundLabel.text = selectedText
            makeBackgroundCave()
        }
        fadeThemes()
        fadeCharacter()
        greenBirdImg.alpha = 1.0
        let heiGreen = height / 8
        let widGreen = heiGreen
        UserDefaults.standard.set("greenBird", forKey: "character")
        UserDefaults.standard.set(6, forKey: "characterFrame")
        UserDefaults.standard.set(0.08, forKey: "characterTime")
        UserDefaults.standard.set(widGreen, forKey: "characterSizeWidth")
        UserDefaults.standard.set(heiGreen, forKey: "characterSizeHeight")
    }
    
    @IBAction func flyMoneyClicked(_ sender: Any) {
        setTextsCharacter()
        setTextsTheme()
        flyMoneyLabel.text = selectedText
        
        if seaThemeImg.alpha == 1.0 || spaceThemeImg.alpha == 1.0{
            fadeBackground()
            setTexts()
            flyMoneyLabel.text = selectedText
            caveBackgroundLabel.text = selectedText
            caveBackgroundImg.alpha = 1.0
            makeBackgroundCave()
        }
        fadeThemes()
        fadeCharacter()
        flyMoneyImg.alpha = 1.0
        let heiFly = height / 10
        let widFly = 100 * heiFly / 91
        UserDefaults.standard.set("flyMoney", forKey: "character")
        UserDefaults.standard.set(8, forKey: "characterFrame")
        UserDefaults.standard.set(0.08, forKey: "characterTime")
        UserDefaults.standard.set(widFly, forKey: "characterSizeWidth")
        UserDefaults.standard.set(heiFly, forKey: "characterSizeHeight")
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        print(UserDefaults.standard.object(forKey: "character")!)
        
    }
    
    @IBAction func caveBackgroundClicked(_ sender: Any) {
        setTextsBackground()
        setTextsTheme()
        caveBackgroundLabel.text = selectedText
    
        fadeBackground()
        caveBackgroundImg.alpha = 1.0
        
        if seaThemeImg.alpha == 1.0 || spaceThemeImg.alpha == 1.0 {
            fadeCharacter()
            setTexts()
            caveBackgroundLabel.text = selectedText
            purpleBatLabel.text = selectedText
            purpleBatImg.alpha = 1.0
            makeCharacterPurpleBat()
        }
        
        
        fadeThemes()
        makeBackgroundCave()
        
    }
    
    @IBAction func skyBackgroundClicked(_ sender: Any) {
        setTextsBackground()
        setTextsTheme()
        skyBackgroundLabel.text = selectedText
        
        fadeBackground()
        skyBackgroundImg.alpha = 1.0
        
        if seaThemeImg.alpha == 1.0 || spaceThemeImg.alpha == 1.0 {
            fadeCharacter()
            setTexts()
            skyBackgroundLabel.text = selectedText
            purpleBatLabel.text = selectedText
            purpleBatImg.alpha = 1.0
            makeCharacterPurpleBat()
        }
        fadeThemes()
        
        let heiSkyB = height
        let widSkyB = 5 * heiSkyB / 4
        
        let widSkyG  = width / 2
        let heiSkyG = 19 * widSkyG / 96
        
        
        UserDefaults.standard.set("cloud", forKey: "ground")
        UserDefaults.standard.set(widSkyG, forKey: "groundSizeWidth")
        UserDefaults.standard.set(heiSkyG, forKey: "groundSizeHeight")
        
        UserDefaults.standard.set("sky", forKey: "background")
        UserDefaults.standard.set(widSkyB, forKey: "backgroundSizeWidth")
        UserDefaults.standard.set(heiSkyB, forKey: "backgroundSizeHeight")
        
        
    }
    
    @IBAction func spaceThemeClicked(_ sender: Any) {
        setTexts()
        spaceThemeLabel.text = selectedText
        
        fadeBackground()
        fadeCharacter()
        fadeThemes()
        spaceThemeImg.alpha = 1.0
        
        let heiSpace = height / 16
        let widSpace = 128 * heiSpace / 55
        
        let heiSpaceB = height
        let widSpaceB = 2 * heiSpaceB
        
        let widSpaceG = width / 10
        let heiSpaceG = widSpaceG
        
        
        UserDefaults.standard.set("metal", forKey: "ground")
        UserDefaults.standard.set(widSpaceG, forKey: "groundSizeWidth")
        UserDefaults.standard.set(heiSpaceG, forKey: "groundSizeHeight")
        
        UserDefaults.standard.set("ufo", forKey: "character")
        UserDefaults.standard.set(9, forKey: "characterFrame")
        UserDefaults.standard.set(0.06, forKey: "characterTime")
        UserDefaults.standard.set(widSpace, forKey: "characterSizeWidth")
        UserDefaults.standard.set(heiSpace, forKey: "characterSizeHeight")
        
        UserDefaults.standard.set("space", forKey: "background")
        UserDefaults.standard.set(widSpaceB, forKey: "backgroundSizeWidth")
        UserDefaults.standard.set(heiSpaceB, forKey: "backgroundSizeHeight")
    }
    
    @IBAction func seaThemeClicked(_ sender: Any) {
    
        setTexts()
        seaThemeLabel.text = selectedText
        
        fadeBackground()
        fadeCharacter()
        fadeThemes()
        seaThemeImg.alpha = 1.0
        
        let heiSeaB = height
        let widSeaB = 4 * height
        
        let heiSea = height / 15
        let widSea = 420 * heiSea / 163
    
        let heiSeaG = width / 10
        let widSeaG = heiSeaG
        
        UserDefaults.standard.set("sand", forKey: "ground")
        UserDefaults.standard.set(widSeaG, forKey: "groundSizeWidth")
        UserDefaults.standard.set(heiSeaG, forKey: "groundSizeHeight")
        
        UserDefaults.standard.set("shark", forKey: "character")
        UserDefaults.standard.set(10, forKey: "characterFrame")
        UserDefaults.standard.set(0.1, forKey: "characterTime")
        UserDefaults.standard.set(widSea, forKey: "characterSizeWidth")
        UserDefaults.standard.set(heiSea, forKey: "characterSizeHeight")
    
        UserDefaults.standard.set("sea", forKey: "background")
        UserDefaults.standard.set(widSeaB, forKey: "backgroundSizeWidth")
        UserDefaults.standard.set(heiSeaB, forKey: "backgroundSizeHeight")
    }
    
    @IBAction func turkishClicked(_ sender: Any) {
        UserDefaults.standard.set("turkish", forKey: "language")
        
        defaultText = "Varsayılan"
        highscoreText = "Gereken en iyi skor: "
        backText = "  Geri"
        selectedText = "Seçildi"
        unlockedText = "Kilidi Açıldı"
        characterText = "Karakterler"
        themeText = "Temalar"
        backgroundText = "Arka Planlar"
        
        setTexts()
        
        sacredFunction()
        
        fadeButton()
        turkishButton.alpha = 1.0
    }
    
    @IBAction func englishClicked(_ sender: Any) {
        UserDefaults.standard.set("english", forKey: "language")
        
        defaultText = "Default"
        highscoreText = "The required highscore: "
        backText = "  Back"
        selectedText = "Selected"
        unlockedText = "Unlocked"
        characterText = "Characters"
        themeText = "Themes"
        backgroundText = "Backgrounds"
        
        setTexts()
        
        sacredFunction()
        
        fadeButton()
        englishButton.alpha = 1.0
    }
    @IBAction func frenchClicked(_ sender: Any) {
        UserDefaults.standard.set("french", forKey: "language")
        
        defaultText = "Défaut"
        highscoreText = "Le meilleur score demandé: "
        backText = "  Retour"
        selectedText = "Choisi"
        unlockedText = "Ouvert"
        characterText = "Personnages"
        themeText = "Thèmes"
        backgroundText = "Fonds"
        
        setTexts()
        
        sacredFunction()
        
        fadeButton()
        frenchButton.alpha = 1.0
    }
    @IBAction func germanClicked(_ sender: Any) {
        UserDefaults.standard.set("german", forKey: "language")
        
        defaultText = "Voreinstellung"
        highscoreText = "Die erforderliche Highscore: "
        backText = "  Zurück"
        selectedText = "Ausgewählt"
        unlockedText = "Unversperrt"
        characterText = "Charaktere"
        themeText = "Themen"
        backgroundText = "Hintergründe"
        
        setTexts()
        
        sacredFunction()
        
        fadeButton()
        germanButton.alpha = 1.0
    }
    
    func setTextsCharacter() {
        purpleBatLabel.text = defaultText
        
        if highscore > 14 {
            blackBatLabel.text = unlockedText
        } else {
            blackBatLabel.text = highscoreText + "15"
        }
        if highscore > 44 {
            flyMoneyLabel.text = unlockedText
        } else {
            flyMoneyLabel.text = highscoreText + "45"
        }
        if highscore > 24 {
            greenBirdLabel.text = unlockedText
        } else {
            greenBirdLabel.text = highscoreText + "25"
        }
    }
    
    func setTextsBackground() {
        caveBackgroundLabel.text = defaultText
        if highscore > 19 {
            skyBackgroundLabel.text = unlockedText
        } else {
            skyBackgroundLabel.text = highscoreText + "20"
        }
    }
    
    func setTextsTheme() {
        if highscore > 34 {
            seaThemeLabel.text = unlockedText
        } else {
            seaThemeLabel.text = highscoreText + "35"
        }
        if highscore > 29 {
            spaceThemeLabel.text = unlockedText
        } else {
            spaceThemeLabel.text = highscoreText + "30"
        }
    }
    
    func setTexts() {
        backButton.setTitle(backText, for: .normal)
        characterLabel.text = characterText
        backgroundLabel.text = backgroundText
        themeLabel.text = themeText
        setTextsTheme()
        setTextsCharacter()
        setTextsBackground()
    }
    
    func sacredFunction() {
        purpleBatImg.alpha == 1.0 ? purpleBatLabel.text = selectedText : nil
        blackBatImg.alpha == 1.0 ? blackBatLabel.text = selectedText : nil
        greenBirdImg.alpha == 1.0 ? greenBirdLabel.text = selectedText : nil
        flyMoneyImg.alpha == 1.0 ? flyMoneyLabel.text = selectedText : nil
        
        caveBackgroundImg.alpha == 1.0 ? caveBackgroundLabel.text = selectedText : nil
        skyBackgroundImg.alpha == 1.0 ? skyBackgroundLabel.text = selectedText : nil
        
        seaThemeImg.alpha == 1.0 ? seaThemeLabel.text = selectedText : nil
        spaceThemeImg.alpha == 1.0 ? spaceThemeLabel.text = selectedText : nil
    }
    
}
