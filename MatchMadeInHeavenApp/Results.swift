//
//  Results.swift
//  MatchMadeInHeavenApp
//
//  Created by Edward Sotelo Jr on 7/1/19.
//  Copyright © 2019 Edward Sotelo Jr. All rights reserved.
//
// COMPARE TEXT COUNT TO ADD CONSTRAINT TO THE LARGER LABEL

import UIKit

class Results: UIViewController, UIScrollViewDelegate {
    var didOnce = 0
    var info: [String : [String]] = [:]
    var firstPersonMasculineCount = 0
    var firstPersonFeminineCount = 0
    var secondPersonMasculineCount = 0
    var secondPersonFeminineCount = 0
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var firstPersonChineseSign: UIImageView!
    @IBOutlet weak var firstPersonChinese: UILabel!
    @IBOutlet weak var firstPersonName: UILabel!
    @IBOutlet weak var firstPersonDOB: UILabel!
    @IBOutlet weak var firstPersonMasculine: UILabel!
    @IBOutlet weak var firstPersonFeminine: UILabel!
    @IBOutlet weak var firstPersonSun: UILabel!
    @IBOutlet weak var firstPersonTime: UILabel!
    @IBOutlet weak var firstSunSign: UIImageView!
    @IBOutlet weak var firstPersonMoon: UILabel!
    @IBOutlet weak var firstMoonSign: UIImageView!
    @IBOutlet weak var firstPersonMercury: UILabel!
    @IBOutlet weak var firstMercurySign: UIImageView!
    @IBOutlet weak var firstPersonVenus: UILabel!
    @IBOutlet weak var firstVenusSign: UIImageView!
    @IBOutlet weak var firstPersonMars: UILabel!
    @IBOutlet weak var firstMarsSign: UIImageView!
    @IBOutlet weak var firstPersonJupiter: UILabel!
    @IBOutlet weak var firstJupiterSign: UIImageView!
    @IBOutlet weak var firstPersonSaturn: UILabel!
    @IBOutlet weak var firstSaturnSign: UIImageView!
    @IBOutlet weak var firstPersonUranus: UILabel!
    @IBOutlet weak var firstUranusSign: UIImageView!
    @IBOutlet weak var firstPersonNeptune: UILabel!
    @IBOutlet weak var firstNeptuneSign: UIImageView!
    @IBOutlet weak var firstPersonPluto: UILabel!
    @IBOutlet weak var firstPlutoSign: UIImageView!
    
    @IBOutlet weak var secondPersonChineseSign: UIImageView!
    @IBOutlet weak var secondPersonName: UILabel!
    @IBOutlet weak var secondPersonDOB: UILabel!
    @IBOutlet weak var secondPersonMasculine: UILabel!
    @IBOutlet weak var secondPersonFeminine: UILabel!
    @IBOutlet weak var secondPersonTime: UILabel!
    @IBOutlet weak var secondPersonChinese: UILabel!
    @IBOutlet weak var secondPersonSun: UILabel!
    @IBOutlet weak var secondSunSign: UIImageView!
    @IBOutlet weak var secondPersonMoon: UILabel!
    @IBOutlet weak var secondMoonSign: UIImageView!
    @IBOutlet weak var secondPersonMercury: UILabel!
    @IBOutlet weak var secondMercurySign: UIImageView!
    @IBOutlet weak var secondPersonVenus: UILabel!
    @IBOutlet weak var secondVenusSign: UIImageView!
    @IBOutlet weak var secondPersonMars: UILabel!
    @IBOutlet weak var secondMarsSign: UIImageView!
    @IBOutlet weak var secondPersonJupiter: UILabel!
    @IBOutlet weak var secondJupiterSign: UIImageView!
    @IBOutlet weak var secondPersonSaturn: UILabel!
    @IBOutlet weak var secondSaturnSign: UIImageView!
    @IBOutlet weak var secondPersonUranus: UILabel!
    @IBOutlet weak var secondUranusSign: UIImageView!
    @IBOutlet weak var secondPersonNeptune: UILabel!
    @IBOutlet weak var secondNeptuneSign: UIImageView!
    @IBOutlet weak var secondPersonPluto: UILabel!
    @IBOutlet weak var secondPlutoSign: UIImageView!
    
    @IBOutlet weak var sunIcon: UIImageView!
    @IBOutlet weak var chineseSunConstraint1: NSLayoutConstraint!
    @IBOutlet weak var chineseSunConstraint2: NSLayoutConstraint!
    @IBOutlet weak var sunMoonConstraint1: NSLayoutConstraint!
    @IBOutlet weak var sunMoonConstraint2: NSLayoutConstraint!
    @IBOutlet weak var moonIcon: UIImageView!
    @IBOutlet weak var moonMercuryConstraint1: NSLayoutConstraint!
    @IBOutlet weak var moonMercuryConstraint2: NSLayoutConstraint!
    @IBOutlet weak var mercuryIcon: UIImageView!
    @IBOutlet weak var mercuryVenusConstraint1: NSLayoutConstraint!
    @IBOutlet weak var mercuryVenusConstraint2: NSLayoutConstraint!
    @IBOutlet weak var venusIcon: UIImageView!
    @IBOutlet weak var venusMarsConstraint1: NSLayoutConstraint!
    @IBOutlet weak var venusMarsConstraint2: NSLayoutConstraint!
    @IBOutlet weak var marsIcon: UIImageView!
    @IBOutlet weak var marsJupiterConstraint1: NSLayoutConstraint!
    @IBOutlet weak var marsJupiterConstraint2: NSLayoutConstraint!
    @IBOutlet weak var jupiterIcon: UIImageView!
    @IBOutlet weak var jupiterSaturnConstraint1: NSLayoutConstraint!
    @IBOutlet weak var jupiterSaturnConstraint2: NSLayoutConstraint!
    @IBOutlet weak var saturnIcon: UIImageView!
    @IBOutlet weak var saturnUranusConstraint1: NSLayoutConstraint!
    @IBOutlet weak var saturnUranusConstraint2: NSLayoutConstraint!
    @IBOutlet weak var uranusIcon: UIImageView!
    @IBOutlet weak var uranusNeptuneConstraint1: NSLayoutConstraint!
    @IBOutlet weak var uranusNeptuneConstraint2: NSLayoutConstraint!
    @IBOutlet weak var neptuneIcon: UIImageView!
    @IBOutlet weak var neptunePlutoConstraint1: NSLayoutConstraint!
    @IBOutlet weak var neptunePlutoConstraint2: NSLayoutConstraint!
    @IBOutlet weak var plutoIcon: UIImageView!
    @IBOutlet weak var comparison: UILabel!
  
    @IBOutlet weak var plutoMatchConstraint: NSLayoutConstraint!
    @IBOutlet weak var plutoMatchConstraint2: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.delegate = self
        let firstPersonChart = ["sun": info["Sun"]![0],
                                "moon": info["Moon"]![0],
                                "mercury": info["Mercury"]![0],
                                "venus": info["Venus"]![0],
                                "mars": info["Mars"]![0],
                                "jupiter": info["Jupiter"]![0],
                                "saturn": info["Saturn"]![0],
                                "uranus": info["Uranus"]![0],
                                "neptune": info["Neptune"]![0],
                                "pluto": info["Pluto"]![0],
        ]
        let secondPersonChart = ["sun": info["Sun"]![1],
                                "moon": info["Moon"]![1],
                                "mercury": info["Mercury"]![1],
                                "venus": info["Venus"]![1],
                                "mars": info["Mars"]![1],
                                "jupiter": info["Jupiter"]![1],
                                "saturn": info["Saturn"]![1],
                                "uranus": info["Uranus"]![1],
                                "neptune": info["Neptune"]![1],
                                "pluto": info["Pluto"]![1],
        ]
        
        firstPersonName.text = info["Name"]![0]
        secondPersonName.text = info["Name"]![1]
        firstPersonDOB.text = info["DOB"]![0]
        secondPersonDOB.text = info["DOB"]![1]
        firstPersonTime.text = info["Time"]![0]
        secondPersonTime.text = info["Time"]![1]
        
        firstPersonChineseSign.image! = UIImage(named: info["Chinese"]![0])!
        firstPersonChinese.text = getChineseDescription(sign: info["Chinese"]![0])
        secondPersonChineseSign.image! = UIImage(named: info["Chinese"]![1])!
        secondPersonChinese.text = getChineseDescription(sign: info["Chinese"]![1])
        if(firstPersonChinese.text!.count > secondPersonChinese.text!.count){
            chineseSunConstraint1.isActive = true
            chineseSunConstraint2.isActive = false
        }else{
            chineseSunConstraint1.isActive = false
            chineseSunConstraint2.isActive = true
        }
       
        firstPersonSun.text = getSunDescription(sign: getSign(sign: firstPersonChart["sun"]!))
        firstSunSign.image = UIImage(named: getSignLogo(sign: getSign(sign: firstPersonChart["sun"]!)))
        secondPersonSun.text = getSunDescription(sign: getSign(sign: secondPersonChart["sun"]!))
        secondSunSign.image = UIImage(named: getSignLogo(sign: getSign(sign: secondPersonChart["sun"]!)))
        if(firstPersonSun.text!.count > secondPersonSun.text!.count){
            sunMoonConstraint1.isActive = true
            sunMoonConstraint2.isActive = false
        }else{
            sunMoonConstraint1.isActive = false
            sunMoonConstraint2.isActive = true
        }
      
        firstPersonMoon.text = getMoonDescription(sign: getSign(sign: firstPersonChart["moon"]!))
        firstMoonSign.image = UIImage(named: getSignLogo(sign: getSign(sign: firstPersonChart["moon"]!)))
        secondPersonMoon.text = getMoonDescription(sign: secondPersonChart["moon"]!)
        secondMoonSign.image = UIImage(named: getSignLogo(sign: getSign(sign: secondPersonChart["moon"]!)))
        if(firstPersonMoon.text!.count > secondPersonMoon.text!.count){
            moonMercuryConstraint1.isActive = true
            moonMercuryConstraint2.isActive = false
        }else{
            moonMercuryConstraint1.isActive = false
            moonMercuryConstraint2.isActive = true
        }
 
        firstPersonMercury.text = getMercuryDescription(sign: getSign(sign: firstPersonChart["mercury"]!))
        firstMercurySign.image = UIImage(named: getSignLogo(sign: getSign(sign: firstPersonChart["mercury"]!)))
        secondPersonMercury.text = getMercuryDescription(sign: getSign(sign: secondPersonChart["mercury"]!))
        secondMercurySign.image = UIImage(named: getSignLogo(sign: getSign(sign: secondPersonChart["mercury"]!)))
        if(firstPersonMercury.text!.count > secondPersonMercury.text!.count){
            mercuryVenusConstraint1.isActive = true
            mercuryVenusConstraint2.isActive = false
        }else{
            mercuryVenusConstraint1.isActive = false
            mercuryVenusConstraint2.isActive = true
        }
        
        firstPersonVenus.text = getVenusDescription(sign: getSign(sign: firstPersonChart["venus"]!))
        firstVenusSign.image = UIImage(named: getSignLogo(sign: getSign(sign: firstPersonChart["venus"]!)))
        secondPersonVenus.text = getVenusDescription(sign: getSign(sign: secondPersonChart["venus"]!))
        secondVenusSign.image = UIImage(named: getSignLogo(sign: getSign(sign: secondPersonChart["venus"]!)))
        if(firstPersonVenus.text!.count > secondPersonVenus.text!.count){
            venusMarsConstraint1.isActive = true
            venusMarsConstraint2.isActive = false
        }else{
            venusMarsConstraint1.isActive = false
            venusMarsConstraint2.isActive = true
        }
       
        firstPersonMars.text = getMarsDescription(sign: getSign(sign: firstPersonChart["mars"]!))
        firstMarsSign.image = UIImage(named: getSignLogo(sign: getSign(sign: firstPersonChart["mars"]!)))
        secondPersonMars.text = getMarsDescription(sign: getSign(sign: secondPersonChart["mars"]!))
        secondMarsSign.image = UIImage(named: getSignLogo(sign: getSign(sign: secondPersonChart["mars"]!)))
        if(firstPersonMars.text!.count > secondPersonMars.text!.count){
            marsJupiterConstraint1.isActive = true
            marsJupiterConstraint2.isActive = false
        }else{
            marsJupiterConstraint1.isActive = false
            marsJupiterConstraint2.isActive = true
        }
        
        firstPersonJupiter.text = getJupiterDescription(sign: getSign(sign: firstPersonChart["jupiter"]!))
        firstJupiterSign.image = UIImage(named: getSignLogo(sign: getSign(sign: firstPersonChart["jupiter"]!)))
        secondPersonJupiter.text = getJupiterDescription(sign: getSign(sign: secondPersonChart["jupiter"]!))
        secondJupiterSign.image = UIImage(named: getSignLogo(sign: getSign(sign:secondPersonChart["jupiter"]!)))
        if(firstPersonJupiter.text!.count > secondPersonJupiter.text!.count){
            jupiterSaturnConstraint1.isActive = true
            jupiterSaturnConstraint2.isActive = false
        }else{
            jupiterSaturnConstraint1.isActive = false
            jupiterSaturnConstraint2.isActive = true
        }
        
        firstPersonSaturn.text = getSaturnDescription(sign: getSign(sign: firstPersonChart["saturn"]!))
        firstSaturnSign.image = UIImage(named: getSignLogo(sign: getSign(sign: firstPersonChart["saturn"]!)))
        secondPersonSaturn.text = getSaturnDescription(sign: getSign(sign: secondPersonChart["saturn"]!))
        secondSaturnSign.image = UIImage(named: getSignLogo(sign: getSign(sign: secondPersonChart["saturn"]!)))
        if(firstPersonSaturn.text!.count > secondPersonSaturn.text!.count){
            saturnUranusConstraint1.isActive = true
            saturnUranusConstraint2.isActive = false
        }else{
            saturnUranusConstraint1.isActive = false
            saturnUranusConstraint2.isActive = true
        }
        
        firstPersonUranus.text = getUranusDescription(sign: getSign(sign: firstPersonChart["uranus"]!))
        firstUranusSign.image = UIImage(named: getSignLogo(sign: getSign(sign: firstPersonChart["uranus"]!)))
        secondPersonUranus.text = getUranusDescription(sign: getSign(sign: secondPersonChart["uranus"]!))
        secondUranusSign.image = UIImage(named: getSignLogo(sign: getSign(sign: secondPersonChart["uranus"]!)))
        if(firstPersonUranus.text!.count > secondPersonUranus.text!.count){
            uranusNeptuneConstraint1.isActive = true
            uranusNeptuneConstraint2.isActive = false
        }else{
            uranusNeptuneConstraint1.isActive = false
            uranusNeptuneConstraint2.isActive = true
        }
        
        firstPersonNeptune.text = getNeptuneDescription(sign: getSign(sign: firstPersonChart["neptune"]!))
        firstNeptuneSign.image = UIImage(named: getSignLogo(sign: getSign(sign: firstPersonChart["neptune"]!)))
        secondPersonNeptune.text = getNeptuneDescription(sign: getSign(sign: secondPersonChart["neptune"]!))
        secondNeptuneSign.image = UIImage(named: getSignLogo(sign: getSign(sign: secondPersonChart["neptune"]!)))
        if(firstPersonNeptune.text!.count > secondPersonNeptune.text!.count){
            neptunePlutoConstraint1.isActive = true
            neptunePlutoConstraint2.isActive = false
        }else{
            neptunePlutoConstraint1.isActive = false
            neptunePlutoConstraint2.isActive = true
        }
        firstPersonPluto.text = getPlutoDescription(sign: getSign(sign: firstPersonChart["pluto"]!))
        firstPlutoSign.image = UIImage(named: getSignLogo(sign: getSign(sign: firstPersonChart["pluto"]!)))
        secondPersonPluto.text = getPlutoDescription(sign: getSign(sign: secondPersonChart["pluto"]!))
        secondPlutoSign.image = UIImage(named: getSignLogo(sign: getSign(sign: secondPersonChart["pluto"]!)))
        
        comparison.text = comparisonResults(Hash: info)
        if(firstPersonPluto.text!.count > secondPersonPluto.text!.count){
            plutoMatchConstraint.isActive = true
            plutoMatchConstraint2.isActive = false
        }else{
            plutoMatchConstraint.isActive = false
            plutoMatchConstraint2.isActive = true
        }
    }
    
    func chineseMatch(firstChineseYear: String, secondChineseYear: String) -> Int{
        if (firstChineseYear == "Rat"){
            if(secondChineseYear == "Ox" || secondChineseYear == "Dragon" || secondChineseYear == "Monkey"){
                return 6 // perfect match
            }else if(secondChineseYear == "Snake"){
                return 5 // good friend
            }else if(secondChineseYear == "Monkey" || secondChineseYear == "Dog" || secondChineseYear == "Pig"){
                return 4 // complementary
            }else if(secondChineseYear == "Rat" || secondChineseYear == "Tiger"){
                return 3 // average
            }else if(secondChineseYear == "Sheep"){
                return 2 // good or worst
            }else{
                return 1 // worst
            }
        }else if(firstChineseYear == "Ox"){
            if(secondChineseYear == "Rat" || secondChineseYear == "Snake" || secondChineseYear == "Rooster"){
                return 6
            }else if(secondChineseYear == "Rabbit" || secondChineseYear == "Dog"){
                return 4
            }else if(secondChineseYear == "Ox" || secondChineseYear == "Monkey"){
                return 3
            }else if(secondChineseYear == "Pig"){
                return 2
            }else{
                return 1
            }
        }else if (firstChineseYear == "Tiger"){
            if(secondChineseYear == "Horse" || secondChineseYear == "Rooster"){
                return 6 // perfect match
            }else if(secondChineseYear == "Sheep"){
                return 5 // good friend
            }else if(secondChineseYear == "Dragon" || secondChineseYear == "Rooster" || secondChineseYear == "Dog"){
                return 4 // complementary
            }else if(secondChineseYear == "Ox" || secondChineseYear == "Rabbit"){
                return 3 // average
            }else{
                return 1 // worst
            }
        }else if (firstChineseYear == "Rabbit"){
            if(secondChineseYear == "Sheep" || secondChineseYear == "Monkey" || secondChineseYear == "Dog" || secondChineseYear == "Pig"){
                return 6 // perfect match
            }else if(secondChineseYear == "Rat" || secondChineseYear == "Ox"){
                return 4 // complementary
            }else if(secondChineseYear == "Tiger" || secondChineseYear == "Rabbit" || secondChineseYear == "Dragon" || secondChineseYear == "Horse"){
                return 3 // average
            }else{
                return 1 // worst
            }
        }else if (firstChineseYear == "Dragon"){
            if(secondChineseYear == "Rat" || secondChineseYear == "Tiger" || secondChineseYear == "Snake"){
                return 6 // perfect match
            }else if(secondChineseYear == "Pig" || secondChineseYear == "Dragon"){
                return 5 // good friend
            }else if(secondChineseYear == "Monkey" || secondChineseYear == "Pig"){
                return 4 // complementary
            }else if(secondChineseYear == "Rabbit" || secondChineseYear == "Horse"){
                return 3 // average
            }else{
                return 1 // worst
            }
        }else if (firstChineseYear == "Snake"){
            if(secondChineseYear == "Rooster"){
                return 6 // perfect match
            }else if(secondChineseYear == "Rat" || secondChineseYear == "Horse" || secondChineseYear == "Monkey"){
                return 5 // good friend
            }else if(secondChineseYear == "Ox" || secondChineseYear == "Dragon"){
                return 4 // complementary
            }else if(secondChineseYear == "Dog"){
                return 3 // average
            }else{
                return 1 // worst
            }
        }else if (firstChineseYear == "Horse"){
            if(secondChineseYear == "Tiger" || secondChineseYear == "Sheep"){
                return 6 // perfect match
            }else if(secondChineseYear == "Snake"){
                return 5 // good friend
            }else if( secondChineseYear == "Pig"){
                return 4 // complementary
            }else if(secondChineseYear == "Rabbit" || secondChineseYear == "Dragon" || secondChineseYear == "Monkey" || secondChineseYear == "Dog"){
                return 3 // average
            }else{
                return 1 // worst
            }
        }else if (firstChineseYear == "Sheep"){
            if(secondChineseYear == "Rabbit" || secondChineseYear == "Horse" || secondChineseYear == "Pig"){
                return 6 // perfect match
            }else if(secondChineseYear == "Tiger"){
                return 5 // good friend
            }else if(secondChineseYear == "Sheep" || secondChineseYear == "Monkey"){
                return 4 // complementary
            }else if(secondChineseYear == "Rooster"){
                return 3 // average
            }else if(secondChineseYear == "Rat"){
                return 2 // good or worst
            }else{
                return 1 // worst
            }
        }else if (firstChineseYear == "Monkey"){
            if(secondChineseYear == "Rat" || secondChineseYear == "Ox" || secondChineseYear == "Rabbit" || secondChineseYear == "Snake"){
                return 6 // perfect match
            }else if(secondChineseYear == "Snake" || secondChineseYear == "Monkey"){
                return 5 // good friend
            }else if(secondChineseYear == "Sheep" || secondChineseYear == "Dog"){
                return 4 // complementary
            }else if(secondChineseYear == "Horse" || secondChineseYear == "Rooster"){
                return 3 // average
            }else{
                return 1 // worst
            }
        }else if (firstChineseYear == "Rooster"){
            if(secondChineseYear == "Ox" || secondChineseYear == "Dragon" || secondChineseYear == "Snake"){
                return 6 // perfect match
            }else if(secondChineseYear == "Tiger"){
                return 4 // complementary
            }else if(secondChineseYear == "Rat" || secondChineseYear == "Sheep" || secondChineseYear == "Monkey" || secondChineseYear == "Pig"){
                return 3 // average
            }else{
                return 1 // worst
            }
        }else if (firstChineseYear == "Dog"){
            if(secondChineseYear == "Rabbit"){
                return 6 // perfect match
            }else if(secondChineseYear == "Rat" || secondChineseYear == "Tiger" || secondChineseYear == "Monkey" || secondChineseYear == "Pig"){
                return 4 // complementary
            }else if(secondChineseYear == "Ox" || secondChineseYear == "Snake" || secondChineseYear == "Horse" || secondChineseYear == "Dog"){
                return 3 // average
            }else{
                return 1 // worst
            }
        }else{
            if(secondChineseYear == "Tiger" || secondChineseYear == "Rabbit" || secondChineseYear == "Sheep"){
                return 6 // perfect match
            }else if(secondChineseYear == "Dragon" || secondChineseYear == "Pig"){
                return 5 // good friend
            }else if(secondChineseYear == "Rat" || secondChineseYear == "Horse" || secondChineseYear == "Dog"){
                return 4 // complementary
            }else if(secondChineseYear == "Rooster"){
                return 3 // average
            }else if(secondChineseYear == "Ox"){
                return 2 // good or worst
            }else{
                return 1 // worst
            }
        }
    }
    
    func compare(firstPerson:String, secondPerson:String) -> Int{ // ex // compare("AR1234", "GE1234")
        let signStart = firstPerson.index(firstPerson.startIndex, offsetBy:0)
        let signEnd = firstPerson.index(firstPerson.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let firstPersonSign = String(firstPerson[signRange])
        let secondPersonSign = String(secondPerson[signRange])
        if(firstPersonSign == secondPersonSign){
            return 5
        }else if (getElement(sign: firstPersonSign) == getElement(sign: secondPersonSign)){
            return 4
        }else if (ifOpposites(firstPerson: firstPersonSign, secondPerson: secondPersonSign)){
            return 0
        }else if (getGender(sign: firstPersonSign) == getGender(sign: secondPersonSign)){
            return 3
        }else if (getQuality(firstPerson: firstPersonSign, secondPerson: secondPersonSign)){
            return 2
        }else{
            return 1
        }
    }
    
    func comparisonResults(Hash: [String : [String]]) -> String {
        let planets = [sunIcon, moonIcon, mercuryIcon, venusIcon, marsIcon, jupiterIcon, saturnIcon, uranusIcon, neptuneIcon, plutoIcon]
        let firstPersonChart = [info["Chinese"]![0], info["Sun"]![0], info["Moon"]![0],
                                info["Mercury"]![0], info["Venus"]![0], info["Mars"]![0],
                                info["Jupiter"]![0], info["Saturn"]![0], info["Uranus"]![0],
                                info["Neptune"]![0], info["Pluto"]![0]]
        let secondPersonChart = [info["Chinese"]![1], info["Sun"]![1], info["Moon"]![1],
                                 info["Mercury"]![1], info["Venus"]![1], info["Mars"]![1],
                                 info["Jupiter"]![1], info["Saturn"]![1], info["Uranus"]![1],
                                 info["Neptune"]![1], info["Pluto"]![1]]
        var results = 0
        var result = 0
        for x in 1...10{
            if(getGender(sign: getSign(sign: firstPersonChart[x])) == 1){
                firstPersonMasculineCount = firstPersonMasculineCount + 1
            }else{
                firstPersonFeminineCount = firstPersonFeminineCount + 1
            }
            if(getGender(sign: getSign(sign: secondPersonChart[x])) == 1){
                secondPersonMasculineCount = secondPersonMasculineCount + 1
            }else{
                secondPersonFeminineCount = secondPersonFeminineCount + 1
            }
            result = compare(firstPerson: firstPersonChart[x], secondPerson: secondPersonChart[x])
            switch result{
            case 5: planets[x-1]?.image = getSignIcon(sign: getSign(sign: firstPersonChart[x]))
            case 4: planets[x-1]?.image = getElementIcon(sign: getSign(sign: firstPersonChart[x]))
            case 3: planets[x-1]?.image = getGenderIcon(sign: getSign(sign: firstPersonChart[x]))
            case 2: planets[x-1]?.image = getQualityIcon(sign: getSign(sign: firstPersonChart[x]))
            case 1: planets[x-1]?.image = #imageLiteral(resourceName: "blank")
            case 0: planets[x-1]?.image = #imageLiteral(resourceName: "opposite")
            default: planets[x-1]?.image = #imageLiteral(resourceName: "blank")
                
            }
            if(x == 1 && result == 5){
                result = 7
            }else if (x == 1 || x == 2 || x == 3 || x == 4 || x == 5 || x == 6){
                if (result == 5){
                result = 6
                }else if (result == 4){
                result = 5
                }else if (result == 3){
                    result = 4
                }
            }
            results = result + results
        }
        firstPersonMasculine.text = String(firstPersonMasculineCount)
        firstPersonFeminine.text = String(firstPersonFeminineCount)
        secondPersonMasculine.text = String(secondPersonMasculineCount)
        secondPersonFeminine.text = String(secondPersonFeminineCount)
        results = results + chineseMatch(firstChineseYear: firstPersonChart[0], secondChineseYear: secondPersonChart[0]) + chineseMatch(firstChineseYear: secondPersonChart[0], secondChineseYear: firstPersonChart[0])
        if (results >= 42){
            return "100%"
        }
        return String(format: "%.2f", ((Float(results)/42)*100)) + "%"
    }
    
    func getElement(sign: String) -> Int {
        if(sign == "AR" || sign == "LE" || sign == "SG"){
            return 1 //Fire
        }else if(sign == "TA" || sign == "VI" || sign == "CP"){
            return 2 //Earth
        }else if(sign == "GE" || sign == "LI" || sign == "AQ"){
            return 3 //Air
        }else{
            return 4 //Water
        }
    }
    
    func getElementIcon(sign: String) -> UIImage{
       
        let images: Array<UIImage> = [#imageLiteral(resourceName: "fire"),#imageLiteral(resourceName: "air"),#imageLiteral(resourceName: "water"),#imageLiteral(resourceName: "earth")]
        if(sign == "AR" || sign == "LE" || sign == "SG"){
            return images[0] //Fire
        }else if(sign == "TA" || sign == "VI" || sign == "CP"){
            return images[3] //Earth
        }else if(sign == "GE" || sign == "LI" || sign == "AQ"){
            return images[1] //Air
        }else{
            return images[2] //Water
        }
    }
    
    func getGender(sign: String) -> Int {
        if(sign == "AR" || sign == "GE" || sign == "LE" || sign == "LI" || sign == "SG" || sign == "AQ"){
            return 1
        }else {
            return 0
        }
    }
    
    func getGenderIcon(sign: String) -> UIImage{
        let images: Array<UIImage> = [#imageLiteral(resourceName: "masculine"),#imageLiteral(resourceName: "feminine")]
        if(sign == "AR" || sign == "GE" || sign == "LE" || sign == "LI" || sign == "SG" || sign == "AQ"){
            return images[0]
        }else{
            return images[1]
        }
    }
    
    func getQuality(firstPerson: String, secondPerson: String) -> Bool {
        if(firstPerson == "AR"){
            if(secondPerson == "CN" || secondPerson == "LI" || secondPerson == "CP"){
                return true
            }
        }else if(firstPerson == "TA"){
            if(secondPerson == "LE" || secondPerson == "SC" || secondPerson == "AQ"){
            return true
            }
        } else if(firstPerson == "GE") {
            if(secondPerson == "VI" || secondPerson == "SG" || secondPerson == "PI"){
                return true
            }
        }else if(firstPerson == "CN"){
            if(secondPerson == "AR" || secondPerson == "LI" || secondPerson == "CP"){
                return true
            }
        }else if(firstPerson == "LE"){
            if(secondPerson == "TA" || secondPerson == "SC" || secondPerson == "AQ"){
                return true
            }
        } else if(firstPerson == "VI") {
            if(secondPerson == "GE" || secondPerson == "SG" || secondPerson == "PI"){
                return true
            }
        }else if(firstPerson == "LI"){
            if(secondPerson == "CN" || secondPerson == "AR" || secondPerson == "CP"){
                return true
            }
        }else if(firstPerson == "SC"){
            if(secondPerson == "LE" || secondPerson == "TA" || secondPerson == "AQ"){
                return true
            }
        }else if(firstPerson == "SG") {
            if(secondPerson == "VI" || secondPerson == "GE" || secondPerson == "PI"){
                return true
            }
        }else if(firstPerson == "CP"){
            if(secondPerson == "CN" || secondPerson == "LI" || secondPerson == "AR"){
                return true
            }
        }else if(firstPerson == "AQ"){
            if(secondPerson == "LE" || secondPerson == "SC" || secondPerson == "TA"){
                return true
            }
        } else if(firstPerson == "PI") {
            if(secondPerson == "VI" || secondPerson == "SG" || secondPerson == "GE"){
                return true
            }
        }
        return false
    }
    
    func getQualityIcon(sign: String) -> UIImage{
        let images: Array<UIImage> = [#imageLiteral(resourceName: "cardinal.png"),#imageLiteral(resourceName: "fixed"),#imageLiteral(resourceName: "mutable")]
        if(sign == "AR" || sign == "CN" || sign == "LI" || sign == "CP"){
            return images[0]
        }else if(sign == "TA" || sign == "LE" || sign == "SC" || sign == "AQ"){
            return images[1]
        } else {
            return images[2]
        }
    }
    
    func getSign(sign: String) -> String{
        let signStart = sign.index(sign.startIndex, offsetBy:0)
        let signEnd = sign.index(sign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let Sign = String(sign[signRange])
        return Sign
    }
    func getSignIcon(sign: String) -> UIImage{
        let images: Array<UIImage> = [#imageLiteral(resourceName: "ariesIcon"),#imageLiteral(resourceName: "taurusIcon"),#imageLiteral(resourceName: "geminiIcon"),#imageLiteral(resourceName: "cancerIcon"),#imageLiteral(resourceName: "leoIcon"),#imageLiteral(resourceName: "virgoIcon"),#imageLiteral(resourceName: "libraIcon"),#imageLiteral(resourceName: "scorpioIcon"),#imageLiteral(resourceName: "sagittariusIcon"),#imageLiteral(resourceName: "capicornIcon"),#imageLiteral(resourceName: "aquariusIcon"),#imageLiteral(resourceName: "piscesIcon")]
        switch sign {
        case "AR":
            return images[0]
        case "TA":
            return images[1]
        case "GE":
            return images[2]
        case "CN":
            return images[3]
        case "LE":
            return images[4]
        case "VI":
            return images[5]
        case "LI":
            return images[6]
        case "SC":
            return images[7]
        case "SG":
            return images[8]
        case "CP":
            return images[9]
        case "AQ":
            return images[10]
        case "PI":
            return images[11]
        default:
            return images[0]
        }
    }
    
    func getSignLogo(sign: String) -> String {
        switch sign {
        case "AR":
            return "aries"
        case "TA":
            return "taurus"
        case "GE":
            return "gemini"
        case "CN":
            return "cancer"
        case "LE":
            return "leo"
        case "VI":
            return "virgo"
        case "LI":
            return "libra"
        case "SC":
            return "scorpio"
        case "SG":
            return "sagittarius"
        case "CP":
            return "capricorn"
        case "AQ":
            return "aquarius"
        case "PI":
            return "pisces"
        default:
            return ""
        }
    }
    
    func ifOpposites(firstPerson: String, secondPerson: String) -> Bool{
        let signStart = firstPerson.index(firstPerson.startIndex, offsetBy:0)
        let signEnd = firstPerson.index(firstPerson.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let firstPersonSign = String(firstPerson[signRange])
        let secondPersonSign = String(secondPerson[signRange])
        if(firstPersonSign == "AR" || secondPersonSign == "AR"){
            if(firstPersonSign == "LI" || secondPersonSign == "LI"){
                return true
            }
        }else if(firstPersonSign == "TA" || secondPersonSign == "TA"){
            if(firstPersonSign == "SC" || secondPersonSign == "SC"){
                return true
            }
        }else if(firstPersonSign == "GE" || secondPersonSign == "GE"){
            if(firstPersonSign == "SG" || secondPersonSign == "SG"){
                return true
            }
        }else if(firstPersonSign == "CN" || secondPersonSign == "CN"){
            if(firstPersonSign == "CP" || secondPersonSign == "CP"){
                return true
            }
        }else if(firstPersonSign == "LE" || secondPersonSign == "LE"){
            if(firstPersonSign == "AQ" || secondPersonSign == "AQ"){
                return true
            }
        }else if(firstPersonSign == "VI" || secondPersonSign == "VI"){
            if(firstPersonSign == "PI" || secondPersonSign == "PI"){
                return true
            }
        }
        return false
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.frame.size.height
        let scrollContentSizeHeight = scrollView.contentSize.height
        let scrollOffset = scrollView.contentOffset.y
        if (scrollOffset + scrollViewHeight == scrollContentSizeHeight) { // then we are at the top
            if (didOnce == 0){
                didOnce = 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    let alertController = UIAlertController(title: "", message: "Swipe Right to try another match", preferredStyle: .alert)
                
                    // Create OK button
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                        print()
                    }
                    alertController.addAction(OKAction)
                
                    // Present Dialog message
                    self.present(alertController, animated: true, completion:nil)
                }
            }
        }
    }
    
    func getChineseDescription(sign: String) -> String {
        switch sign {
        case "Rat":
            return "Rats are quick-witted, resourceful, versatile, kind, smart, and lovely. With strong intuition and quick responses, Rats always easily adapt themselves to a new environment. With rich imaginations and sharp observations, they can take advantage of various opportunities well."
        case "Ox":
            return "Oxes are known for diligence, dependability, strength and determination. Having an honest nature, Oxes are strongly patriotic, have ideals and ambitions for life, and attach importance to family and work."
        case "Tiger":
            return "People born in a year of the Tiger are brave, competitive, unpredictable, and confident. They are very charming and well-liked by others. But sometimes they are likely to be impetuous, irritable, and overindulged."
        case "Rabbit":
            return "Rabbits tend to be gentle, quiet, elegant, and alert as well as quick, skillful, kind, patient, and very responsible. However, they might be superficial, stubborn, melancholy, and overly-discreet."
        case "Dragon":
            return "Gifted with innate courage, tenacity, and intelligence, Dragons are enthusiastic and confident. They are not afraid of challenges, and willing to take risks."
        case "Snake":
            return "Snakes tend to act according to their own judgments while remaining private and reticent. They are determined to accomplish their goals and hate to fail."
        case "Horse":
            return "People born in a year of the Horse are extremely animated, active and energetic. Horses love to be in a crowd, and they can usually be seen on such occasions as concerts, theater performances, meetings, sporting events, and parties."
        case "Goat":
            return "People born in a year of the Goat are generally believed to be gentle, mild-mannered, shy, stable, sympathetic, amicable, and brimming with a strong sense of kindheartedness and justice."
        case "Monkey":
            return "People born in a year of the Monkey have magnetic personalities and are witty and intelligent. Personality traits like mischievousness, curiosity, and cleverness make them very naughty."
        case "Rooster":
            return "People born in a year of the Rooster are very observant. Hardworking, resourceful, courageous, and talented, Roosters are very confident in themselves."
        case "Dog":
            return "Dogs are loyal and honest, amiable and kind, cautious and prudent. Due to having a strong sense of loyalty and sincerity, Dogs will do everything for the person who they think is most important."
        case "Pig":
            return "Pigs are diligent, compassionate, and generous. They have great concentration: once they set a goal, they will devote all their energy to achieving it. Though Pigs rarely seek help from others, they will not refuse to give others a hand. Pigs never suspect trickery, so they are easily fooled."
        default:
            return ""
        }
    }
    
    func getSunDescription(sign:String) -> String {
        let signStart = sign.index(sign.startIndex, offsetBy:0)
        let signEnd = sign.index(sign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let planetSign = String(sign[signRange])
        switch planetSign {
        case "AR":
            return "Aries is active, energetic, excitable and impulsive, optimistic, open to change and new experiences"
        case "TA":
            return "Taurus is quiet, affectionate, patient, stable, determined and practical, stubborn, and resistant to change"
        case "GE":
            return "Gemini is lively, energetic, versatile, and intellectual, lives primarily in the mind rather than the emotions, and is extremely adaptable to new situations"
        case "CN":
            return "Cancer is receptive, sensitive, and imaginative, sympathetic, kind, and emotional, and possesses an active, shrewd, and intuitive mind"
        case "LE":
            return "Leo is enthusiastic, powerful, expansive and creative, generous and extravagant, dogmatic and fixed in opinion"
        case "VI":
            return "Virgo is reserved, modest, practical, discriminating and industrious, analytical and painstaking, seeking to know and understand"
        case "LI":
            return "Libra is active, artistic, easygoing, peaceable, prizes beauty and harmony, is diplomatic, polished, and very socially inclined"
        case "SC":
            return "Scorpio is imaginative, passionate and emotional, subtle, persistent, intense, obstinate, and unyielding."
        case "SG":
            return "Sagittarius is energetic, ambitious, generous, freedom-loving, and a seeker of challenge, open to new ideas and exploration"
        case "CP":
            return "Capricorn is reserved, prudent, patient, uses strategy instead of force, seeks security, is acquisitive, disciplined, determined, and quick to seize opportunity"
        case "AQ":
            return "Aquarius is assertive, independent, progressive, analytical, original, and inventive, has strong dislikes and firm opinions"
        case "PI":
            return "Pisces is receptive, intuitive, and emotional, imaginative, romantic, impressionable and mystical, adaptable, and very changeable"
        default:
            return ""
        }
    }
    
    func getMoonDescription(sign:String) -> String {
        let signStart = sign.index(sign.startIndex, offsetBy:0)
        let signEnd = sign.index(sign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let planetSign = String(sign[signRange])
        switch planetSign {
        case "AR":
            return "You are more energetic, enterprising, optimistic, open to change, idealistic. You are more impulsive, opinionated, domineering, impatient, vain."
        case "TA":
            return "You are more trustworthy, determined, warm, affectionate, artistic. You are more obstinate, possessive, rigid, overcautious, a slave to routine."
        case "GE":
            return "You are more versatile, witty, charming, lively, amusing. You are more disorganized, inconsistent, superficial, cunning, manipulative."
        case "CN":
            return "You are more imaginative, sympathetic, protective, tenacious, loyal. You are more possessive, moody, critical, self-pitying, a nag."
        case "LE":
            return "You are more exuberant, creative, broad-minded, colorful, fun-loving. You are more self-indulgent, self-centered, conceited, overbearing, bullying."
        case "VI":
            return "You are more intellectual, meticulous, industrious, steadfast, responsible. You are more critical, high-strung, standoffish, argumentative, hypochrondriac."
        case "LI":
            return "You are more adaptable, creative, charming, good-natured, diplomatic. You are more indecisive, self-indulgent, dependent, frivolous, changeable."
        case "SC":
            return "You are more imaginative, determined, ambitious, emotional, idealistic. You are more obstinate, secretive, jealous, resentful, domineering."
        case "SG":
            return "You are more adventurous, optimistic, exuberant, open-minded, sincere. You are restless, extravagant, irresponsible, careless, uncommitted."
        case "CP":
            return "You are more determined, Responsible, disciplined, patient, committed. You are rigid, pessimistic, opinionated, materialistic, overexacting."
        case "AQ":
            return "You are more idealistic, creative, tolerant, a humanitarian, with a progressive outlook. Unpredictable, contrary aloof, fixed in opinion, tactless. "
        case "PI":
            return "You are more compassionate, sensitive, loving, creative, loyal. Indecisive, discontented, vague, secretive, easily confused. Gifted with psychic vision and imagination. You find it hard to be strict and disciplined with yourself."
        default:
            return ""
        }
    }
    
    func getMercuryDescription(sign:String) -> String {
        let signStart = sign.index(sign.startIndex, offsetBy:0)
        let signEnd = sign.index(sign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let planetSign = String(sign[signRange])
        switch planetSign {
        case "AR":
            return "Aries in Mercury, you tend to be witty, outspoken and original. ironic or sarcastic tone, uses highly expressive language. You exaggerate. Impatient, eager to get things done. Want things done your way. You can be argumentative and tactless. Very impulsive. Suffer from headaches, , especially in a raucous and noisy atmosphere. You would be a good writer."
        case "TA":
            return "You never embark on a project without being completely prepared. You have a practical, stable, and constructive mind. You are quite sure in your opinions are the wisest and you have little use for what others think. Excellent memory, a good observer, but apt to listen inattentively. Repeat yourself. You are sociable and attractive, and have a certain refinement about your manners, you're a bit shy with strangers. Like to read. Possesses an eye for beauty and value. You would be successful in art."
        case "GE":
            return "You have a quicksilver duality to your mind. You tend to change opinions quickly. You often hold down more than one job. Extremely quick, versatile, interested in the world at large. You live mostly in the mental plane. You want to know. You are good at languages and math and love to read, study, travel and talk to new people. Your grasp of knowledge tends to be superficial. You know a bit about everything, but not a lot about anything. You are clever enough to hide that. At times, there is a distinct lack of order in your life. You would be a good debater, public speaker, or actor."
        case "CN":
            return "You are sensitive to what others think about you. You have an almost sixth-sense intuition. You're a bit narrow-minded. Gifted with powerful imagination, sense of poetry, and a fine memory. You are plagued with irrational phobias. You would be a successful as a scholar, historian, teacher or writer."
        case "LE":
            return "Gifted with eloquence and a skill for leading others. You have a magnetic flair for dealing with people. You are a superb organizer. You can be boastful, arrogant and bombastic; and if things don't go your way your fiery temper may ignite. Kind-hearted. You have great enthusiasm and showy expansiveness. You would be great in performing arts."
        case "VI":
            return "Fine anaylical quality to the mind. You like to deal with facts. Once you form a theory, you're quite convinced it is the truth. You expect reality to conform to your ideas. You have an intellectual intolerance for people who are sloppy in their thinking; you don't really understand human failings. You are very quick to learn. Your emotional detachment makes you an excellent scientist, researcher, teacher, or reporter."
        case "LI":
            return "You love to make comparisons by listing all the pros and cons, looking at both sides. What you want is to make the perfect choice. Even after you've have made up your mind, however, it isn't definite. wait and see attitude. You have fine intuitions and often know things in a flash. You tend to intellectualize and go off in the wrong direction. Toward other people, your attitude is gentle, sympathetic, friendly. You are fond of socializing. Avoid disagreement. You are a good teamworker."
        case "SC":
            return "You are questioning and probing. You are drawn to things hidden. You take great pride in your ability not to be fooled. You have a stubborn, obstinate mind and are enamored of your own ideas. One cannot budge you from a point of view unless you want to be budged. You probably have a volatile temper, biting sarcasm when upset. You have an emotional intelligence. You would be successful in medicine, science, religion, or solitary work."
        case "SG":
            return "You are quick and bright. You prize freedom of expression. Your mind is restless, inquiring, always looking for stimulation. Never stop learning. You love to read, explore new ideas, learn about other people. You are fast on your feet and can grasp ideas instantly, but a frequent failingn is your lack of concentration. Some find you too blunt and outspoken. You don't think before you speak. Changing career paths."
        case "CP":
            return "You are ambitious and methodical, careful, calculating, and patient. You are not only superb at handling detail, but you also never lose sight of the whole picture. You are extremely rational when making decisions. Logic is what your faith is. You always have an objective; you always have a secret goal you are pursuing. A problem you have in relating to people can be your dictatorial manner. You tend to have a disapproving air about the foibles and frivolities of others. Life is serious for you and you see its dark side, though a redeeming trait is your dry sense of humor. You are a good leader."
        case "AQ":
            return "Fine and clever mind, inquisitive, accurate, and inventive. You take a great interest in other people and have excellent judgment of human nature. You love to analyze character and motivation. Accurately predict how someone will react in a certain situation. You are a notorious peoplewatcher. Broad and emotionally detached outlook. You enjoy intellectual discussions about philosophy, metaphysics, and the future of mankind. You may seem eccentric, for your ideas are advanced and you also enjoy saying things that shock other people. Successful in progressive professionals."
        case "PI":
            return "Subtle and intuitive mind. There is an intriguing air of mystery about the way you think. You have accurate intuition. You don't logically arrive at conclusions; you seem to get flashes of knowledge or sudden feelings that are not based on previous facts. You are imaginative and creative, but you tend to lack self-confidence. At times you appear timid and confused. Deep sympathy and understanding for failing people. In your opinion everyone, including lairs, has his own truth. Sensitive to your environment. Absentminded Professor."
        default:
            return ""
        }
    }
    
    func getVenusDescription(sign:String) -> String {
        let signStart = sign.index(sign.startIndex, offsetBy:0)
        let signEnd = sign.index(sign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let planetSign = String(sign[signRange])
        switch planetSign {
        case "AR":
            return "Responsive and impulsive love nature.  fall in love at first sight and never thinks once before following the dictates of your heart. You are strongly sensual and feel at your most complete when you are emotionally involved with someone. Physical appearance is what attracts you. You are turned off by a sloppy appearance or loud, vulgar behavior. You attract friends by your demonstrative and enthusiastic attitude. You like to bring unexpected gifts to those you love. Curious mixture of sentimentality and aggressiveness. Your emotions are easily touched, but you are also selfish and demanding. Restless and flirtatious."
        case "TA":
            return "You are affectionate and romantic, but you don’t give your love away too quickly. Take your time choosing. To you, love doesn’t not exist without sex. You are very demonstrative and generous toward your lover, sometimes too much so. Your passion can be smothering, you have an all-consuming need to make your lover belong to you. With friends, you are willing and ready to help, but you are as cautious about forming instant friendships as about love. This position brings money luck, you have a keen artistic eye and interested in music. You love to eat and have to fight over weight."
        case "GE":
            return "You must have an intellectual  rapport with someone before your affections begin to blossom. You have a lighthearted attitude toward love. Intense, heavy emotional commitments are like an anchor around your neck. You have a wide range of interests. Your inconstancy sometimes causes you difficulties in love or marriage, but you bounce back quickly. Not even a frustrated lover can be angry at you very long - you are too charming, witty, and funny. You enjoy being with people and have lots of friends, and often more than one lover. Careless in spending money."
        case "CN":
            return "You are romantic and sensitive. Being loved is more important to you than almost anything else. You are not blindly romantic that you don’t carefully consider future security. You want to be pursue than be doing the pursuing, because you need to reassurance someone really loves you. Once you feel secure you are demonstrative and sensual. You have a wonderful gift of eloquence and you are also intensely sentimental. You will make a big fuss over your lover’s birthday or your anniversary. This position indicates strong family loyalty. You are delightfully content at home and often love to cook."
        case "LE":
            return "You are able to attract warm feelings on the part of others. Magnetic. You are extravagantly affectionate and generous, buying expensive gifts for those you love and praising them to the skies in front of other people. You must always be the dominant partner. No one can make a scene or confrontation as dramatic like you. You are drawn to the world of theater. You also love fine possessions. Through self-indulgent and pleasure-seeking, you are capable of making great self-sacrifice for the happiness of someone else."
        case "VI":
            return "You tend to be cautious about falling in love.  You sometimes avoid involvement by taking small defects in a person and blowing them up out of proportion as character flaws. You hold yourself on a tight rein, because you fear that your feelings will be exploited by someone unworthy. What you want is someone who regard you as special. You often give your heart to the wrong person, who will not appreciate your fine qualities. You are refined and intelligent, loyal, and sympathetic. You are an imaginative writer and teacher. You have an excellent business sense and a quiet but witty sense of humor."
        case "LI":
            return "You are in love with love. You are much romantic than sensual. Anything coarse, crude, or vulgar repels you. To you, true love is of the spirit. However, you fall in the love too easily and have more than one amour going at a time. However, a love affair must have all the right trappings and rituals. Because you put great store by charming social matters. People who don’t match up are summarily dismiss no matter what their deeper qualities may be. You can be cold and aloof toward anyone who presumes. You have artistic talents or a flair for design and decoration. You are successful working in creative projects within a partnership or marriage. You adore creature comforts and luxury and tend to be extravagant with money."
        case "SC":
            return "Being in love is an all-consuming experience for you. There is a profound intensity to your emotions. Your sex life is passionate and demonstrative, and in a love affair it is the sexual side of the relationship that is emphasized. However, you also put love on a spiritual plane. Your deep need is to possess a lover wholly, to make your partner surrender to you body and soul. This, predictably, leads to stormy scenes; it is not easy for anyone to deal with such possessiveness. You are very sensitive to any rebuff; you can bristle like a porcupine. If someone does not respond to your love, you may even become vindictive. (If you have the Sun in Libra or Sagittarius, however, the jealous drive is lightened.) Venus-Scorpios tend to become involved in lucrative marriages or business partnerships. You have a sweeping compelling imagination, and many of you do highly original artistic work."
        case "SG":
            return "Venus-Sagittarians begin love affairs with a spirit of adventure. You like to experience the excitement of love in the same way you search for diversion in the rest of your life. First attractions are always wildly romantic; as a Venus-Sagittarian you never seem to have commonplace or banal love affairs. However, you cannot sustain the emotion, and therefore never completely sacrifice your freedom to another person. What you want is the unobtainable--perfect love-and even if you could find it you would shrink from being possessed by it. With such contradictory attitudes, it's no wonder you leave your lovers terminally puzzled. Basically, Venus-Sagittarians are high-spirited, outgoing, and highly imaginative. You tend to attract powerful and influential friends and find it much easier to deal with friends than with lovers. For one thing, friendship is less demanding. Luck in creative affairs surrounds projects undertaken in foreign countries or far from home."
        case "CP":
            return "Venus-Capricorns are careful and cautious about love as about anything You may sometimes be thought of as cold and calculating because you believe in the dictate \"it's just as easy to fall in love with someone rich as with someone poor.\" In fact, this was probably said originally by a Ve nus-Capricorn. However, it is far from telling the whole story. When in love, you are loyal, faithful, and dependable. If you don't marry rich, you work to give a mate security, and that includes material comforts. You may not be demonstrative and flowery, but what you say you mean. There is a dichotomy between your emotional life and your sexuality: You have earthy passions but keep them separate from your mental attitude. You can be sexually involved and detached at the same time. Venus in this position indicates a personality that is jealous, possessive, and fearful of rejection. Once snubbed, Venus-Capricorn's reaction is complete coldness."
        case "AQ":
            return "kind and loving nature. You are helpful, charitable, and giving, but you are not an emotional person. You have an intellectually detached attitude toward love. To you, personal freedom is most important, and any relationship must leave you free to explore varied interests and hobbies, meet new people, and enjoy a wide range of friends. You cannot tolerate jealousy and will walk away from emotional scenes. You believe in fairness and openness. As a Venus-Aquarian, you are most likely to have platonic friendships because sexual involvements are more emotionally binding than you like. You are immensely popular, and can attract a great many lovers, often, however, you choose to direct your personal magnetism toward larger concerns and more enduring verities than mere romance, Aquarius is the sign of hopes and wishes, and Venus in this sign usually grants you what you dream of (though not until midlife or later)."
        case "PI":
            return "As a Venus-Piscean you are inclined have tender emotions and a deep capacity for devotion. In love, you are gentle, kindhearted, extremely sensitive and fickle. It is not that you mean to be in constant. It's simply that being in love is such a wonderful feeling, and being loved makes you feel complete. You have an unfortunate penchant for choosing the wrong kind of lover, the kind who will take emotionally but not give back. Venus-Pisceans often have a secret love affair that causes them grief. You are completely intuitive about love, never logical. No other position of Venus can be as self-sacrificing or places more importance on the happiness of loved ones. You have true empathy for the problems of another person. Venus also indicates an imaginative and creative artistic flair, which helps you to put your feelings into writing, acting, or music. Venus-Pisceans are so generous that money slips through their fingers."
        default:
            return ""
        }
    }
    
    func getMarsDescription(sign:String) -> String {
        let signStart = sign.index(sign.startIndex, offsetBy:0)
        let signEnd = sign.index(sign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let planetSign = String(sign[signRange])
        switch planetSign {
        case "AR":
            return "Mars is in its natural home in Aries (the sign that it rules), and emphasizes qualities of brilliance, force, and energy. As a Mars-Arien you are given self-confidence and force of character. Others always know how you feel about a subject because you tell them in no uncertain terms. You are courageous and honest, but the opposite side of the coin is that you can be tactless, blunt, and combative. Your passions are fiery and are quickly ignited. Active and assertive in your sex life, you aggressively go after what you want (whether it's a long-term lover or just a bedmate for the night). The professions of big business and politics are populated with Mars-Ariens, for natives of this position have a domineering will to win. You are able to make others respond to your ideas. Your youthful springy appearance lasts a lifetime."
        case "TA":
            return "You tend to triumph through your own determined and persistent efforts. Your vitality is a slow and steady force that drives you on to success. Success to you means money, material possessions, and true love. A great deal of your energy is spent in sexual pursuits your passions are earthy and voluptuous. In love affairs you try to dominate and to possess, and the firmness to your nature can become downright obstinate. Difficulties tend to arise because you are unwilling to see anyone else's point of view. Because of your tenacity, you have the power to create almost anything you can envision. Sometimes a bent toward depression or temper tantrums mars your happiness. During your life time you often accumulate money and are known as a big spender."
        case "GE":
            return "Mars in Gemini favors energetic activity of the mind. You are brilliantly intellectual, with a steel-trap brain that quickly grasps concepts and spins new ideas. You are incisive and practical and rive at conclusions in a flash. The problem is that you Jack force of will. You hesitate, vacillate, and think of yet another delay. In matters of sex, you experience desire in the mind before it becomes a reality. You enjoy the adventure leading up to lovemaking and have passions that are easily aroused. However, as soon as an affair loses zest and becomes ordinary you look for the escape hatch. You tend to have a number of affairs and marriages. Mars-Geminis are able to inspire and to lead others through the power of the spoken and written word. Often you have a magnetic voice and a compelling talent to convince others of what you say."
        case "CN":
            return "Mars's power turns subtle in Cancer. You have great strength of will, but it is never thrust into the open. Like the tides, you wear down opposition by repeated assault. Each wave may accomplish little, but the accumulated effect is overpowering In sex, Mars-in-Cancer's approach is emotional. You are sensuous but refined, and your lovemaking is a highly intuitive art. Your passion, however, is dependent on what is forthcoming from a lover. If a lover is insensitive or unresponsive, he or she may find that your get-up-and-go just got up and went. Yet, as a native of this Mars placement, you will cling to a relationship that does not make you happy. You react only in outbursts of temper and nervous irritability. What w often require is an outlet for your pent-up energies. You are noted for your breadth of vision and highly emotional work."
        case "LE":
            return "In Leo, Mars's fire is accentuated. With this Mars position in your chart you are never ordinary. You make grand plans and possess the force and drive to put them into action. No one else can grab the attention and affection of others the way you can. You also have a dramatic sex drive. Hot-blooded and impulsive, you are successful in sex relationships because of your dynamism. You must dominate in affairs and demand a great deal of attention, but you are also warm, expressive, ardent, and affectionate. You prefer to make love in luxurious, rich surroundings. You are creative at work, but at times can be overbearing, authoritative, and a bit condescending. Mars-Leos see events in terms of themselves it would never occur to you to be an anonymous observer. You are lucky in speculation and gambling, and often attract powerful friends."
        case "VI":
            return "As a Mars-in-Virgo person, you are a prodigious worker who finds your best success in a systematized approach. You are ambitious and proud, though this is not always apparent on the surface. Extremely strong-willed, you can separate yourself from your emotions when it comes to making decisions. In your work you are shrewd, calculating, and quietly determined. You suspect people who only want to deal with big problems because somehow such people never seem to reach any useful conclusions. Mars-in-Virgo may appear sexually cool, but in truth you glamorize sex. You want it to be both physically rapturous and mentally exciting. Your passions are strong but kept under tight rein. Mars-Virgos tend to be successful in professions where control of emotions is advantageous.(such as politicians, psychologists, and investigators). When putting a plan into action you must beware of getting bogged down in detail."
        case "LI":
            return "When Mars is in Libra the power of this planet seems to fluctuate. You are impulsive and sensuous in your sex drive. A great deal of your energy is spent forming emotional relationships. Yet you have a languid attitude toward sex and often must be sought after rather than be the aggressor. You are idealistic and esthetic; crudeness of any kind turns you off. You prefer liaisons with cultivated, sophisticated lovers, but tend to become involved in unhappy sex relationships. This position of Mars is excellent for a unique artistic or literary talent. There is a great beauty and balance in your work. You have an enviable ability to make a pleasing impression on the public. Mars-Librans believe passionately in fair play. Your actions are always preceded by a careful weighing of the pros and cons."
        case "SC":
            return "Mars in Scorpio underscores persistence and intensity. As a Mars-Scorpio you are a hard-driving and resourceful person whose strength is not so much shown in the heat of action as in determination and relentlessness. Your efforts are well disciplined, always directed toward a purpose. There are no wasted movements or needless expenditures of energy You have a strong and deeply felt sexuality. However, it is sometimes an emotionalsexuality, displayed in jealousy, anger, hurt feelings, and resentment. Though it is possible for you to be ruthless in your relationships, you are far more often simply quarrelsome and touchy. This position of Mars enhances imagination and a powerful creative drive. You are always able to move an audience. Often you are attracted to professions or situations that contain an element of danger or death."
        case "SG":
            return "In Sagittarius, the power of Mars exhibits itself in brilliant flashes. It promotes courage, independence, and daring. Dashing and exciting as your actions may be, you are easily distracted. Your attention becomes riveted to a new plan, and your meteoric enthusiasm turns in that direction. This does not mean you do not accomplish anything, for you can produce remarkable results in a short time, Passionate and sensual, you may have numerous affairs because of your open, exploratory nature. You look on emotional commitments as a form of personal restriction. A sex relationship quickly begins, and just as quickly ends. You tend to be impulsive and act ashly Quick-witted in speech and writing, you have the power to amuse and delight. You make a marvelous first impression."
        case "CP":
            return "Mars in Capricorn signifies force and energy kept under control, to be used when necessary. As a person with this Mars position, you are fierce, magnetic, and commanding. Your strength lies in your obstinacy and ability to endure. When obstacles block your path you run over them roughshod. You have vigor and dynamic force, and also quiet selfreliance. Your sexual nature is earthy and passionate, but the element of self-control marks your relationships. At times hot-blooded, sexy, even romantic, at other times you are chilly and disinterested. What you usually do is channel your formidable power into direction that serves you best. In their youth Mars Capricorns often have a secret love affair with an older person. At some point in their lives, strong personal ambition tends to project Mars-Capricorns into the public eye."
        case "AQ":
            return "In Aquarius, the energy of Mars is expressed on a mental plane. You are quick in your actions, but before you act you must be committed intellectually. You tend to be very people-oriented and involved in a variety of projects. There is an element of reform or fighting for freedom in your outlook. High strung and unpredictable, you struggle between wanting to do things alone and getting involved in group activities. There is also ambivalence in your sexual nature. You have strong desires that are not always reachable. You try to deal with sex relationships rationally and swing back and forth between passionate involvement and detachment. You acknowledge sexual desire but don't want to be fettered by it. This sometimes leads to your having a number of affairs (often simultaneously) that way, each affair can't be a total commitment. As a Mars-Aquarian you have acute insights into human nature."
        case "PI":
            return "Pisces is an emotional sign, and your strength with Mars in Pisces is your power to stir the feelings and grab the emotions. If you have this Mars position you may be noted for your compelling imagination. Many artists, writers, and actors have Mars in Pisces. Enormously receptive to your environment, you store impressions in your subconscious and then produce them at the opportune time. You shoulder the responsibilities of others without complaint. Intensity of feeling is evident in your sexuality. You are sensuous, have deep passions, and display a high level of fervor. You seek to involve yourself totally in a sex relationship, for this is a way in which you can draw closer to another human being. You may suffer disappointment in love. During your lifetime you attract influential friends and gain monetarily from these associations."
        default:
            return ""
        }
    }
    func getJupiterDescription(sign:String) -> String {
        let signStart = sign.index(sign.startIndex, offsetBy:0)
        let signEnd = sign.index(sign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let planetSign = String(sign[signRange])
        switch planetSign {
        case "AR":
            return "Luck follows you in professions where you can be your own boss. You are discontent when you have to follow other people's orders and, being independent and brash, you immediately try to change that situation. Confident and enthusiastic, you are a natural leader capable of running organizations, groups, social clubs, and businesses. You have original ideas and make swifter progress by relying on your own opinions and abilities. You can be a bit bullying and are sometimes quite extravagant in your spending. This position of Jupiter fosters an ability to win over influential people and obtain their help in your career. Jupiter-Ariens often achieve high rank in politics, literature, science, and the military. Your luckiest times of the year are when the Sun is in the signs of Aries, Leo, and Sagittarius. Also, people who have those Suns are likely to bring you financial benefit."
        case "TA":
            return "Jupiter and Taurus are very harmonious: Taurus is the money sign of the zodiac and Jupiter brings abundance. You are successful in fields where finances are prominent, such as banking and stocks and bonds, and investments are likely to brine reward. You are conservative about the way you handle money, security is extremely important to you. (If Jupiter is afflicted, however, you will overspend on luxuries for yourself, this is also true if Venus is prominent in your chart.) As a Jupiter-Taurean you have an eye for beauty and art. You tend to collect paintings and sculpture, jewelry, and antiques that often increase in value. In this sign, Jupiter bestows a lovely voice and artistic talent. Natives are also successful in careers they conduct at home, such as writing, interior decorating, and art collecting. Jupiter-Taureans tend to marry well; career opportunity often comes to you through the opposite sex. Your luckiest times of the year are when the Sun is in the signs of Taurus, Virgo, and Capricorn."
        case "GE":
            return "If you are a Jupiter-Gemini, you are blessed with an adventurous attitude and a knack for getting into advantageous situations. Though you don't necessarily look for moneymaking opportunities, these usually come to you through the many friends and contacts that you acquire. You achieve best success in intellectual areas, such as teaching, lecturing, diplomatic careers, and law. You would also do well in the airline industry. Gemini is the sign of communication, and if your Jupiter is in Gemini you profit financially in ventures where communicating is prominent puts lishing, magazine writing, TV reporting or commentaling, and acting. As a Jupiter-in-Gemini person you are versatile and dever, and often you make a name for yourself in more than one profession. A change in vocation at one point in your life is almost certain. Your luckiest times of the year are when the Sun is in the signs of Gemini, Libra, and Aquarius."
        case "CN":
            return "This is one of the luckiest positions Jupiter can be in. As a Jupiter Cancerian you have a wonderful disposition, are good-humored, funny, and optimistic. You are popular wherever you go, and this opens many doors for you. Retentive Cancer is a sign that holds on to money, people with Jupiter in this sign are lucky with investments, real estate, inheritances, and the stock market. You are imaginative and sympathetic, and do well in creative pursuits. Old things have a special appeal to you, you would be successful in the antique business and museum work. Anything involving food and drink also brings luck: many of you make successful chefs, restaurateurs, and cookbook writers. You will probably acquire enough material possessions by the time you reach middle age to ensure that your later years are peaceful and secure. You make excellent parents and your children tend to bring you benefits. Your luckiest times of the year are when the Sun is in the signs of Cancer, Scorpio, and Pisces."
        case "LE":
            return "Jupiter in Leo bestows an extraordinary public appeal. If you are a native of this position you are well suited for the theater, television and movies, politics, advertising, and public relations. Your full potential is achieved through leadership: you are wretchedly unhappy if forced to stay on the lowest rung. You think big, are ambitious, and have a penchant for grandeur and extravagant display. In professions where this is useful, such as the entertainment industry, the world of fashion, and high-powered selling jobs, you are predestined to succeed. The problem is that success may come too easily. In that event, Jupiter Lees can become boastful and power-hungry. Fortunately, this does not happen often, for Jupiter gives you personal charm and warmhearted vitality. Other people want to do things for you, and you often benefit from influential friends. Your luckiest times of the year are when the Sun is in the signs of Leo, Sagittarius, and Aries."
        case "VI":
            return "Jupiter in the practical sign of Virgo gives you a capacity for making a success of a hobby or a pastime. Many famous Jupiter-Virgos start out with a shoestring and build empires. If you have this Jupiter position you are smart, analytical, and persevering. You figure out the surest route to the largest dividends. The power of Jupiter surrounds you in intellectual pursuits, but the difference between JupiterVirgos and other intellectual signs is that Virgos have an uncommon amount of common se You are also superb at handling detail and do your best work a step at a time. You would make a successful teacher, accountant, literary critic, journalist, or news commentator. Your ability to grasp facts and then apply them systematically makes careers in the fields of space technology, science, and medicine accessible to you. Your luckiest times of the year are when the Sun is in the signs of Taurus, Virgo, and Capricorn."
        case "LI":
            return "Jupiter in this sign bestows a magnetic and charming personality. Luck comes to you through your artistic talents and your eye for beauty and harmony. Many of you are talented musicians, painters, interior decorators, fashion designers, and art collectors. You have a knack for getting your talent on display and winning friends in high places. You like to entertain, and many of your allies are won in the relaxed and genial atmosphere you are able to create More than natives of any other Jupiter position, you benefit from marriage. Marriage often brings social position and wealth, and sometimes in entrée into the business world. Jupiter-Librans are most successful in partnerships you should never start a business completely on your own. Your finely balanced reason and impartiality would make you an excellent judge, lawyer, or diplomat. Your luckiest times of the year are when the Sun is in the signs of Gemini, Libra, and Aquarius."
        case "SC":
            return "Jupiter in Scorpio is a very powerful influence on willpower and personal magnetism. If you have this Jupiter position you tend to be successful in artistic work. Many lupiter Scorpios excel at ferreting out hidden information. This would make you an excellent psychiatrist, researcher, politician, or security agent in government. Luck comes to you through your strong attraction for the opposite sex. Often the door is opened to career and financial opportunity because of sexual liaisons. Scorpio is the of death and regeneration, and Jupiter in this sign promotes skill in medicine, surgery, and therapy. You sess shrewdness in money matters, and many of you have a Midas touch for picking lucrative investment Sometimes you benefit from inheritances during lifetime. Your luckiest times of the year are when the Sun is in the signs of Cancer, Scorpio, and Pisces."
        case "SG":
            return "Sagittarius is the sign that Jupiter rules, and the planet's expansive, generous qualities are emphasized. With this Jupiter position, you are a person who likes to live well; you have a free hand when it comes to spending. Fortunately, you use ally attract financial luck. No other Jupiter position at gurs as much success in this area. As a native, you have an instinct for turning ideas into cash; you think big and profit accordingly. You also tend to marry well and many of you inherit money. Jupiter in Sagittarius though, does not make the personality crass or materialistic. You are high-minded and idealistic. You will often give up a well-paying position if it doesn't suit your inner calling. Gifted with great intellectual capacity. you are drawn to professions in law, government, diplomacy, and the world of literature and philosophy Your luckiest times of the year are when the Sun is in the signs of Aries, Leo, and Sagittarius."
        case "CP":
            return "In the strong, materialistic sign of Capricorn. Jupiter's power is expressed through ambition. As a native of this placement, you gain high position in life through hard work and fierce willpower. Capricorn is an earth sign, and Jupiter's influence is propitious for enterprises that involve earth is some way: mining, construction, land development, estate, and the oil industry. Success isn't a flash in the pan with you. It is achieved gradually, but over the term you tend to reach the top because you are disciplined. Jupiter in Capricorn confers an instinct for business you are a canny trader and tend to handle finances conservatively. Others may notice a curious mixture of economy and extravagance in your spending habits. You may pinch nickels but will be lavish with large sums. This can be useful in business: You are able to keep to a budget but are not afraid to spend when you have to. The luckiest times of the year for you are when the Sun is in the signs of Taurus, Virgo, and Capricorn."
        case "AQ":
            return "Jupiter in Aquarius contributes to a magnetic ability to win friends. You usually find good fortune through your friends and unexpected opportunities. Aquarius is also the sign of the future, and as a native of this Jupiter position you tend to be successful in professions of the modern era: television, computers, electronics, aviation, and the space industry. You easily become bored when the sole purpose of an activity is to make money. You usually find your best opportunity in professions where a broader view is necessary. You are also endowed with a special aptitude for music, and many Jupiter-Aquarians become well known in that world. One of the nicest benefits of Jupiter in this sign is that you bring luck to others. You have a sharp intuition about human nature coupled with idealism. The most auspicious times of the year for you are when the Sun is in the signs of Gemini, Libra, and Aquarius."
        case "PI":
            return "Jupiter is strong here because it endows you with the power to appeal to the emotions. Work in which you deal directly with others, especially where there is a high level of feeling, will bring success This is especially true for those of you who enter the healing arts. Jupiter also accentuates imagination, wisdom, and high ideals. In general, you do your best work in fields in which you help humanity. JupiterPisceans are singled out for success in social or religious work, politics, and philanthropic organizations. Work that involves travel over water brings other opportunities into your life. You also have a deft touch with animals, would make a fine veterinarian, and many of you have lucrative businesses breeding horses, owning cattle ranches, and raising cats and dogs for show. Jupiter in Pisces usually grants you your secret ambition. You attract fortune because of your likeableness and popularity. The luckiest times of the year for you are when the Sun is in the signs of Cancer, Scorpio, and Pisces."
        default:
            return ""
        }
    }
    func getSaturnDescription(sign:String) -> String {
        let signStart = sign.index(sign.startIndex, offsetBy:0)
        let signEnd = sign.index(sign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let planetSign = String(sign[signRange])
        switch planetSign {
        case "AR":
            return "Saturn brings delay to Aries. The sign of initiative, and the result is confusion. If you are a Saturn-Arien, you can be strong and powerful one minute and irresolute and wavering the next. This position is not an easy one, for you must continually fight against obstacles placed in your way. Many of you achieve success, but not without disappointment and setback. Saturn in Aries makes you ambitious and determined, and promotes your power to control other people. On the negative side, Saturn-Ariens can be stubborn, dictatorial, and sometimes solitary and grumpy. In general, your hardest times come early in life. It is then that you develop the strength of character that serves you well in later years. As you grow older, each year brings less struggle and more success. Natives of this Saturn position tend to suffer from headaches and dental problems."
        case "TA":
            return "In Taurus, the obstinate and tenacious qualities of Saturn are emphasized. With this Saturn position you are determined and capable, and take responsibility seriously. Your strong willpower borders on stubbornness and rigidity. You usually try to amass possessions and wealth because of your underlying fear that you will be left alone and bereft, without material resources or love. Unfortunately, Saturn in Taurus does not predict an easy time financially Money tends to come in slowly and to be dissipated along the way. You tend to spend a lot of effort trying to put away the savings, stocks, bonds, and real estate you feel you must have. As a result, you are sometimes considered materialistic and selfish. However, once vou achieve material comfort (usually later in life), you are generous to others in need, for you understand what it means not to have enough. Saturn in this position makes you susceptible to colds, sore throats, and thyroid problems."
        case "GE":
            return "Gemini is a good home for Saturn. This versatile sign's intellectual qualities are emphasized by Saturn, With Saturn in Gemini, you have a sharp mind that is deepened with understanding under this planet's steadying influence. You can, however, be cynical and sarcastic, skeptical and coldhearted. Much more likely, you have a happy combination of native wisdom and a youthful wish to learn. Saturn-Geminis sometimes have a difficult childhood during which you suffer loneliness or sorrow. You may have a hard time obtaining an education. Later in life, you are likely to encounter obstacles while traveling. However, Saturn endows you with a good head for finances, and also a musical ability. You prosper when engaged in work that requires both patience and intelligence, Saturn-Geminis are susceptible to ailments of the chest and lungs."
        case "CN":
            return "Saturn encourages too much dependence on others in this emotional and clinging sign. As a Saturn-Cancerian, you love to overindulge in eating, drinking, and other sensual pleasures. In this position, though, Saturn also gives a shrewdness and tenacity to your personality. You are superb at seeing a task through to completion. You are also ambitious and strive to find material wealth to make your life secure. The obstacles that Saturn places in your path are insecurity and lack of confidence. Sometimes your early life is marked by problems with parents, especially a mother. Many of you Saturn-Cancerians had to take on family responsibility at a very young age. Natives of this position tend to marry someone elder in an effort to find an anchor and stability, Saturn endows you with good business sense, although you must be cautious in dealings with relatives. The negative side of Saturn in Cancer is a tendency to melancholy and self pity. You are prone to digestive and stomach problems, if you are not careful, you can become quite overweight."
        case "LE":
            return " Restrictive Saturn and the expansive sign of Leo are not in harmony. Saturn in Leo is likely to bring a chill to the emotions and disappointment in love. There are, however, many good points to this Saturn position: You are proud and strong-willed, self-assured and authoritative. You are good at organizing people and assuming responsibility. As a Saturn-Leo, you have an instinct for knowing how to draw a public to you. You are inclined to be cold and analytical in choosing your associations, though you are subtle enough to keep this from being obvious to the casual observer. You fear appearing mediocre and ordinary, and you hide feelings of envy and jealousy because this is a weakness you will never admit to. You strive to make a dramatic impression, but tend to be suspicious of compliments and dislike excessive displays of affection. In your career you often rise to great heights, but Saturn in Leo has a way of causing a downfall when you are at the peak. Natives of this position are susceptible to high blood pressure and heart ailments."
        case "VI":
            return "The responsible planet Saturn and the conscientious sign of Virgo work well together. This Saturn position heightens Virge's intellectual ability and practical turn of mind. You are methodical and organized, willing to work hard to achieve goals. To you, theory and practice are one and the same you immediately put what you learn into use Saturn does place hardship in your path, usually early in life when you must sometimes cope with sorrow, disappointment, or frail health. You can become bogged down in trivialities because you are a stickler for details. You are also capable of becoming a petty tyrant when others don't see things your way. Saturn gives you wisdom but not necessarily vision. Too often you see the dark side of life and fear the unknown-that is what you cannot categorize and control. On the plus side, Saturn endows you with an ability to make money, especially in real estate. Natives of this Saturn position are vulnerable to intestinal upsets and ulcers."
        case "LI":
            return "Libra is a favorable sign for Saturn. As a Saturn-Libran you are gifted with good judgment and an instinct for making the right impression on others. You know when to be aggressive and when to be diplomatic. Though it is part of Saturn's lessons to bring some sorrow and disappointment in relationships, you usually benefit from the stability of marriage. However, there may be a divorce before you find happiness with a mate. Sometimes an early love aff turns out to be the love of your life but ends in low Saturn in Libra may suppress the desire to share and be close to another person, which often results in loneliness. In general, this is an excellent position for se cess in public life, and also for a strong showing in artistic pursuits. It has been said that if your Saturn is in Libra, you will only get into trouble when you are doing what you ought not to be doing. Saturn-librane are susceptible to back injuries and kidney problems."
        case "SC":
            return "Saturn is powerful in this secretive and passionate sign, lending subtlety and force to the personality. As a native of this position you understand human motivation, which enables you to control others. Your dominating strength is often hidden under a pleasant and genial exterior. Saturn, however, places obstacles in your path in the form of emotional difficulties and sometimes scandal. You tend to be drawn to secret love affairs that bring sorrow or trouble into your life. When you achieve power you sometimes undergo a downfall because of rumor and gossip. When young you often have health problems, but you get through this and tend to live to a ripe old age. This is an excellent planetary position for executive ability and an unswerving commitment to a goal. Your strong will can become inflexible. Once you set on a course, you see it through to the end. You are prone to secret brooding, but there is usually a touch of dry Saturnian humor to relieve it. Saturn-Scorpios are liable to suffer the loss of loved ones early in life."
        case "SG":
            return " In Sagittarius, Saturn has the effect of delaying success until the lessons of patience and perseverance are learned. You may en unter adversity and setbacks early in life, and often my work hard and long to receive what is due you However, as you get older you acquire wisdom, vision, and a depth of understanding that fashions you into a leader. Saturn gives your mind a philosophical bent: you can usually face up to what life offers because you put your faith in the long-term outcome. This is an excellent position for success in law, politics, writing, and foreign affairs. Saturn, however, emphasizes Sagittarjus's tactlessness and cynical point of view. It is possible you may suffer a blow to your reputation because of something heedless you have said. As a Saturn Sagittarian you experience inner conflict between your need for order and security and your desire to seek adventure and challenge. Natives of this Saturn position are susceptible to accidents involving the hips and thighs."
        case "CP":
            return "Saturn rules the sign of Capricorn, and thus its power is strong here. Both the positive and negative qualities of Saturn are powerfully emphasized in you. You are ambitious and independent, dedicated and unswerving, but your methods can be dictatorial and overbearing and you may sometimes be thought of as selfish and mean. Saturn puts many obstacles in your path, and you learn early in life to be self-sufficient. You want to do everything yourself. It would be easier to take a cub away from a mother bear than a task away from a Saturn-Capricorn. You also have an instinct for doing things the hard ways you don't listen to advice. However, you do learn from experience. As a child you may have been insecure and timid, but as you grow older you gain in authority Loneliness and an inability to share is a running thread throughout your life. Many of you are prone to melancholy, but you usually have a witty, dry sense of humor. Generally, you attract faithful friends, but Saturn in Capricorn tends to bring disappointment in love. Natives of this Saturn position are prone to aches in the joints and knees."
        case "AQ":
            return "In the humanitarian sign of Aquarius, Saturn's qualities of trustworthiness and self discipline are well placed. As a Saturn-Aquarian, you have a talent for dealing with people and appealing to the masses. Many of you achieve fame in both the entertainment world and politics because of this ability Saturn in Aquarius enhances a rational and original mind, capable of learning and study. Like those with Saturn in the other fixed signs of Taurus, Leo, and Scorpio, you are likely to encounter obstacles and difficulties early in life, but you tend to gain the wisdom and maturity that serve you well as you get older. You like to run the show and get your own way, and you are dever about manipulating people so you can. You can be obstinate and cunning at the same time. Saturn gives you the aggressiveness to take leadership, but you know how to avoid rubbing others the wrong way. You have humor and wit, though your need for independence sometimes leads to a lonely life. Natives of this Saturn position are prone to injuries to the lower legs and ankles."
        case "PI":
            return "Saturn in the mystical sign of Pisces does not favor material success. What you gain in life are sagacity and discernment. Your vivid imagination can be translated into creative work, your sympathy and intuition enable you to draw others to yourself. However, more than people of any other Saturn position, you are sensitive to the woes and harshness of the world. Saturn often brings disappointment and loss; the way it does so for you is to force you to make personal sacrifices for others or dictate that you take an inferior position even though your talents are superior. In time you can change this, but you must first develop the courage and determination to do so. Pisces is the sign of self-undoing, and your greatest power comes when you learn not to be the cause of your own unhappiness. You are drawn to philosophy, writing and teaching of a spiritual or occult nature. Natives of this Saturn placement are vulnerable to ailments and problems involving the feet."
        default:
            return ""
        }
    }
    func getUranusDescription(sign:String) -> String {
        let signStart = sign.index(sign.startIndex, offsetBy:0)
        let signEnd = sign.index(sign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let planetSign = String(sign[signRange])
        switch planetSign {
        case "AR":
            return "Uranus in the active sign of Aries favors an original and inventive mind. You need to be in charge and, given the chance, you will run other people's lives. You can be brusque and blunt because you feel that you know better than others. What you want is to see things clearly and not be a victim of confused or disorganized thinking. You immediately try to put your own ideas into action and have little patience with tried-and-true methods. You believe that people who play it safe are usually sorry. Often you have an inimitable style of dressing, a look all your own. You tend to change jobs or residences often and are fond of traveling."
        case "TA":
            return "Uranus is very strong in Taurus and its influence promotes willpower and determination. Uranus in Taurus helps you to produce results through patient and concerted effort. You have a need to build, to be constructive, and to achieve. You tend to be blessed with financial luck, particularly with possessions that gain in value. Often you have a mania for owning new and different objects, and Uranus sometimes brings a sudden find into your life. A taste for bright colors and vivid patterns is evident in the way you dress and decorate. Uranus in Taurus usually indicates a happy and prosperous marriage."
        case "GE":
            return "In Gemini, Uranus shows its power through ideas. You are intellectual and imaginative. You possess a magnetic mind that draws people to you, and you have the ability to sway others to your point of view. Your energy is forceful in mental pursuits. You are attracted to offbeat ideas and fascinated by psychic phenomena and unexplained events. Uranus in Gemini produces a strong urge to express yourself in writing and speaking and to create something striking and startling. Even in ordinary communication, such as phone calls and letters, you are original and captivating and your amusing way with words is evident. You enjoy traveling, easily pick up foreign languages, and have an aptitude for music."
        case "CN":
            return "In Cancer, the power of Uranus is expressed through heightened sensitivity to other people. You have a highly developed imagination and a subconscious that borders on psychic awareness. Your intuitions can be trusted. Valuable insights come to you through sudden and unexpected feelings that arrive in a flash. You receive opportunities through the intervention of other people, often in chance encounters. Uranus in Cancer also promotes success the home-oriented activities, such as gourmet cooking collecting antiques, and interior decorating. Mamy you have a reputation for being eccentric and unpredictable and for having an artistic temperament."
        case "LE":
            return "Uranus exerts a formidable influence in the expansive sign of Leo. As a native of this position, you have a forceful personality and express yourself through leadership. You have a desire to be a hero or heroine. Your creative mind constantly spins new ideas, but you are not content merely to see your concepts carried out. You must be on display as well you want the credit and the attention. Uranus in this position often brings sudden opportunity through roman tic relationships. Uranus also takes you far afield in your search for new and different pleasures. You tend to have luck in gambling, especially on sporting events. At times you give an impression of being too defiant and independent."
        case "VI":
            return "In Virgo, Uranus shows its power in the ability to analyze and use facts. Uranus in Virgo bestows a marvelous combination of intuition and common sense. You have a great need to improve the world. You seek complete autonomy when carrying out your ideas, and rebel against routine and the restrictions of others. Your independence is sometimes so marked as to be considered eccentric by others. Uranus brings you luck through sudden changes in work situations, often a reshuffling of staff or a complete relocation to a new place. Uranus-Virgos are known for unusual ideas about health and food. You the first one to know all about the latest reducing or rejuvenating diet."
        case "LI":
            return "In the harmonious sign of Libra. Libra, Uranus expresses its power through partnerships. As a native of this position, you are drawn to unusual relationships and are often thought of as unconventional in your choice of friends or lovers. Uranus brings you luck through your relationships and also many opportunities through persons of foreign birth. In this Cramus position, love affairs and marriages tend to begin quickly and to have abrupt endings. Labra is an artistic sign, and Uranus bestows style and imagination. You are known for your unusual or exotic taste in art and decoration. You possess an appealing charm in the way you present yourself or dress. Uranus confers an ability to make a memorable first impression."
        case "SC":
            return "Uranus is strong in the intense sign of Scorpio. You have a dominating quality that wells up from deep within you. You possess a magnetic sexuality that is sometimes known as star quality. You are blessed with a penetrating mind. You are able to bring concentration and willpower to bear, and thus can move mountains through sheer effort. Uranus brings you luck through intuitive flashes of knowledge about people or situations in which you are involved. Unusual financial turns and reverses can be expected during your lifetime. Often you benefit through a partner's money or by an inheritance. At times you may be thought of as stubborn, secretive, and shrewd."
        case "SG":
            return "In the freedom-lowing sign of Sagittarius, Uranus exhibits itself as pioneering and adventurous. You are very independent and rebel against anything overly organized and structured. At times you are restless and quite reckless. You are proud and courageous and often have an unconventional point of view. Though you don't necessarily seek it, Uranus promotes financial luck through investments and speculation. Often while traveling, unexpected events or new people bring opportunity into your life. Uranus in this position also endows you with prophetic vision and insight, and you can often tell when something important is about to happen."
        case "CP":
            return "Uranus's energy is channeled into constructive effort in the disciplined sign of Capricorn. You have a strong inner will to succeed. You need to be in authority and have difficulty accepting the rule of other people. Uranus in this position signals unexpected shifts in career or working conditions. You have an ability to spot future trends and to move in a more lucrative direction. Uranus gives you confidence to break through old established ideas. You are thoughtful, forceful, and able to organize people. You can also be tyrannical and domineering: there is always a fighting spirit to your personality. However, Uranus lightens Capricorn's seriousness and gives you a lively satirical wit."
        case "AQ":
            return "Aquarius is the sign Uranus rules, and the Aquarian qualities of inventiveness and originality are strongly emphasized. You have a touch of genius plus the ability to make your impact on a wide group of people. Others are drawn to your unique mind, for you are an advanced thinker. You are a curious blend: You believe in freedom of thought and expression but are convinced that you alone are right. Uranus causes unexpected turnabouts in your life. You may work for years toward a goal, then success will come through something you did not give a second thought to. Friends and associates bring you luck in career. As a Uranus-Aquarian you are noted for your wry sense of humor."
        case "PI":
            return "Uranus's power becomes subtle and emotional in the sensitive sign of Pisces. You have a unique talent for understanding and expressing human feelings, which often shows up in creative work. Uranus brings you luck through your sharp psychological insights and your ability to uncover what is secret and unknown. You are blessed with psychic awareness many of you are serious students of philosophy, religion, astrology, and the occult. In career and business affairs, your intuitions tell you when to act and alert you to when others are most receptive to your ideas. Uranus in this position, however, does not indicate a strong will. At times you must withdraw from the world and recharge your psychic batteries."
        default:
            return ""
        }
    }
    
    func getNeptuneDescription(sign:String) -> String {
        let signStart = sign.index(sign.startIndex, offsetBy:0)
        let signEnd = sign.index(sign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let planetSign = String(sign[signRange])
        switch planetSign {
        case "AR":
            return "To Aries, the sign of active energy. Neptune brings a reforming spirit and high ideals. Neptune-Ariens favor new methods in politics, medicine, and science that will better the lot of mankind. They are idealists and revolutionaries. When Neptune was last in Aries, it was a time of upheaval. Darwin's theory of evolution shook long-established concepts about man's history. The American Civil War was fought for the ideal of equality among human beings. During this era the Red Cross was established, with its emphasis on caring for the sick and needy; the Theosophical Society was founded, which renewed popular interest in philosophy and spiritualism. Neptune-in-Aries bestows a vivid imagination, and natives get true hunches about the future."
        case "TA":
            return "Neptune in the materialistic sign of Taurus brings a deeper awareness of what is truly valuable in life. Neptune-Taureans are attracted to artistic and spiritual quests many possess psychic ability. These people are able to make practical use of (and sometimes profit from their interest in mysticism. When Neptune was last in Taurus we had the great expansion of American industrialism, and along with it a revival of interest in mysticism and the occult. During this era the writings of Karl Marx gave rise to a new idealism about the distribution of wealth. On a personal level. Neptune in this position favors an unusual source of income. Love and marriage bring happiness and inner wisdom. However, there is danger of financial loss through deception or fraud."
        case "GE":
            return "In Gemini, Neptune bestows mental genius, imagination, and creativity. Neptune Geminis have a magnetic ability to express themselves, a hypnotic way of communicating Many create a lasting impression on the public. Neptune in this position gives inspiration for new inventions in science and mechanics. When Neptune was last in Gemini, Henry Ford perfected the automobile and the Wright brothers built a prototype of the first airplane (Gemini rules both transportation and the air). In science the first experiments in relativity laid the groundwork for Albert Einstein's epochal theory. On a personal level. Neptune-Geminis are resourceful, versatile, and perceptive. They have a tendency to attract unusual friends and to have impractical ideas."
        case "CN":
            return "In the emotional sign of Cancer, Neptune's influence gives a psychic, spiritual, and idealistic quality. Neptune-Cancerians are sensitive and compassionate. They tend to hold home and family in high regard and believe in old-fashioned values. However, Neptune also bring a striving for change and innovation to make the world a better place. When Neptune was last in Cancer, the American movement of social protest was part of a change affecting Western civilization. Also, while Neptune transited this sign of imaginative depths, Sigmund Freud explored the unconscious and Carl Jung formulated his theory of a collective unconscious. On a personal level, Neptune in this position promotes a love of luxury. At some point in their lives, Neptune Cancerians are likely to experience an unusual or strange occurrence in their home or with relatives."
        case "LE":
            return "In the noble sign of Leo, Neptune confers great courage and ability for Leadership. Neptune-Leos are generous, dignified, and ambitious. They have high aspirations and the force to make their dreams a reality. Many of the world's heads of states and political leaders dedicated to a cause were horn with Neptune in Leo (e.g., John and Robert Kennedy). Leo is also the sign of drama, and during Neptune's transit of Leo we saw the rise of the motion picture industry to dominance in the field of entertainment. The decade of the Twenties saw the radio become an everyday source of entertainment. This was also the flamboyant era of the Roaring Twenties (Leo is the sign of showy ostentation). On a personal level, with Neptune in this position there is a tendency for its natives to be egotistical and quite sensual."
        case "VI":
            return "The spiritual planet Neptune in the practical sign of Virgo gives a strong instinct for service to mankind. Neptune-Virgos are discontent with the status quo, critical of accepted conventions. Many of those born when Neptune was in Virgo the tumultuous years of the Great Depression and the onset of World War Two-have in our day become active in civil rights, the women's movement, and environmental concerns. When Neptune transited Virgo, the sign of health, treatment of disease with penicillin became widespread and chemotherapy was introduced. On a personal level, Neptune-Virgos possess clairvoyance and psychic ability in which they should put more faith. Neptune in this position sometimes shows a tendency to be hypercritical and confused in thinking. Neptune brings an extraordinary psychic awareness and interest in the occult."
        case "LI":
            return " Neptune in the romantic sign of Libra emphasizes idealism and love. Those born while Neptune transited Libra have been called the love generation. Neptune-Librans seek harmony and balance, and are deeply bothered by injustice in the world. Many of the people who were born during the early years of Neptune's journey through Libra became active in the antiwar movement of the 1960s. Neptune-Libras strongly believe in the concepts of brotherly love and resistance to inequity. While Neptune transited this sign of peace the United Nations was founded. Libra is also the sign of partnership and marriages this era brought a new questioning of the values of marriage, with a resultant rise in divorce and search for happiness in love. On a personal level, Neptune in this position produces a magnetic attraction to the opposite sex, and at times a lack of willpower and determination."
        case "SC":
            return "in the powerful sign of Scorpio, Neptune's influence is shown in depth and intensity of feeling. Neptune-Scorpios are drawn to what is hidden from public view and want to uncover the truth. In years to come, this generation will continue to fight for more open government and to rectify the probable secret damage done to our environment by ruthless profitseekers. Neptune-Scorpios have a true capacity for innovation and invention and are attracted to science, medicine, and genetics. While Neptune traveled through this sign of sex and mysticism, there was a breakdown of sexual taboos in society and a revival of interest in the supernatural. On a personal level, in this sign of spiritual regeneration. Neptune brings an extraordinary psychic awareness and interest in the occult."
        case "SG":
            return " In the altruistic sign of Sagittarius, Neptune has an uplifting influence. Astrologers put great store in the generation horn when Neptune was in this sign, for Sagittarius is the sign of higher learning, philosophy, and freedom. Neptune-Sagittarians have fine intellects, high purpose, and humane natures, and as these young people reach their adult years we look forward to new philosophers, sages, and humanistic leaders. Neptune in this position brings a desire for liberty and truth and a visionary outlook. Neptune-Sagittarians will play an important role in improving living conditions in the Third World countries and in discovering new advances in medicine and science. While Neptune transited this sign of travel and expansion, more people had access to foreign cultures through travel, research, and the World Wide Web"
        case "CP":
            return "In the disciplined sign of Capricorn, Neptune's power is practical and concrete. Neptune-Capricorns are destined to be thorough and painstaking and to possess great courage once they are committed to a purpose. The generation born during Neptune's transit through Capricorn will make use of the inspirational ideas of the previous generation, particularly in science, chemistry, and medicine. Neptune in this position gives creative insight into the things of the earth-water, timber, natural resources, oil, and minerals and these people will find a way not only to use them efficiently but also to conserve and replenish the gifts of earth."
        case "AQ":
            return "In the humanitarian sign of Aquarius, Neptune's power brings ideals and social justice. Neptune-Aquarians are concerned about the welfare of others less fortunate. This generation will have visionary concepts that they into practice. As revolutionaries, they will not tear down and destroy; rather, they will build for a grand future. Neptune in this position has been called hva trologers \"the flame of conscience.\" The generation born during Neptune's transit of Aquarius will be the authors of unusual and undreamed of discoveries to aid mankind."
        case "PI":
            return "In Pisces, Neptune will be the sign it rules, and therefore its qualities of spirituality and creative genius will be enhanced for those born in this era. Neptune Pisceans will be deep thinkers with profound understanding about the meaning of life. Their compassion will be complemented by intense psychic powers. Astrologers believe that this generation, born when Neptune next transits Pisces, may usher in the ultimate period of self-realidad tion. Their ascendancy will help to bring peace and tranquility to the world. Neptune in this position de not value materialism, so Neptune-Pisceans no dou will explore the inner man and woman, and develop new philosophy based on what they find."
        default:
            return ""
        }
    }
    
    func getPlutoDescription(sign:String) -> String {
        let signStart = sign.index(sign.startIndex, offsetBy:0)
        let signEnd = sign.index(sign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let planetSign = String(sign[signRange])
        switch planetSign {
        case "AR":
            return ""
        case "TA":
            return ""
        case "GE":
            return "When Pluto was last in Gemini, the sign of communication, it te olutionized the way information reached the masse This was the era when newspapers came into prominence. The phonograph and photography reproduced sounds and visual information for wide use by the public. The first motion pictures were invented and gave rise to a new industry (which flowered when Neptune transited the theatrical sign of Leo). Gemini rules the airwaves, so it is not surprising that during Pluto's transit the telegraph, the radio, and the telephone came into being. This era also introduced two new forms of travel that would revolutionize the world: the airplane and automobile. When Pluto is in Gemini the planet's personal influence gives its natives an inventive and restless mind that seeks change and freedom from old restrictions."
        case "CN":
            return "Pluto's stormy transit through Cancer, the sign of home, brought upheaval to family life in America. By the millions people left the country to settle in towns and cities. The negative side of Pluto-in-Cancer was shown in the hideous loss of life in World War One, and the preparations for World War Two under the leadership of militaristic Nazi Germany, a nation that espoused glorification of the homeland. Our country and our way of life (Cancerian values) were imperiled. Cancer is the sign of agriculture, during Pluto's transit in the 1930s, we saw the great drought and the misery of the migrant farmworkers forced from their land. We also saw the rise of industrial unions formed in violent struggles against the power of the great corporation. When Pluto is in Cancer, the planet's personal influence gives intense tions and creative imagination. Negatively, it does a deep resentment of other people's good fortune."
        case "LE":
            return "During Pluto's journey through the masterful sign of Leo, the United States entered World War Two and helped the Allied power win a victory over Germany and Japan. Leo is ako magnanimous sign (after the war the United States give money and assistance to the defeated countries in order to help rebuild them). On October 24, 1945, the United Nations was formed, where each country would express its point of view and attempt to work out its differences with other nations. The Korean War was fought to save a nation from aggression. Pluto in the power sign of Leo also points to abuse of power, and during this cra people's lives and careers were crippled and destroyed by the rise of McCarthyism. When Pluto is in Leo, the personal influence is to emphasize love of power, a domineering ejo, and self-aggrandizement, but it also confers on its natives strong pride and a will to prevail despite obstacles. There is a tendency toward arrogance, selfishness, and sensual pleasures. The generation that was born when Pluto transited Leo introduced the era of the pleasure principle; there is also strong emphasis on mass hero-worship of personalities in the media."
        case "VI":
            return "During Pluto's transit of Virgo, the sign of service to others, the Kennedy and Johnson administrations were committed social programs. This was the era of the Great Society, of achievement in the fight for civil rights and, in the mid 1960s, a growing feminist movement. In this sign of health, some of Pluto's influences on its generation are a new awareness of toxic food additives, an emphasis on holistic medicine, and concern over pollution of the environment. Virgo is also the sign of practicality, of putting facts to useful work. During Pluto's transit of this sign, the two world superpowers were actively involved in space exploration. In 1969 a human being first walked on the Moon. The dark side of Pluto's power was shown as the United States was plunged into turmoil by the assassinations of John Kennedy, Robert Kennedy, and Martin Luther King Jr. Southeast Asia was torn by an unending war in Vietnam, which not only took its toll in lives and misery but also divided the nation emotionally. When Pluto is in Virgo, the planet's personal influence bestows a profound analytical quality to the personality. People under this influence seek perfection but are also suspicious and ready to find fault with the world around them."
        case "LI":
            return " Libra is the sign of peace and harmony and early in Pluto's journey through Libra the agonizing war in Vietnam finally came to an end. On a larger scale, two enormous hostile world powers, the United States and the People's Republic of China, moved toward peace and a new rapprochement in their relationship. Pluto-in-Libra also indicates deep concern for law and balancing in justice. The era of Watergate, with its shocking revelations of corruption, ended by bringing new order to government and restoring the balance of powers between the executive branch and Congress. A consequence was the adoption of the Freedom of Information Act. Libra emphasizes egalitarianism and equality, and Pluto's transit saw the passage of equal opportunity laws, support for the Equal Rights Amendment. and greater quality for homosexual Libra also signi fies a love for luxury, and the early 1980s ushered in a period of opulence and ostentation. When Pluto is in Libra, the planet's personal influence promotes a deep need to seek harmony and cooperation. Its negative side brings unforeseen problems and disruption in close relationships."
        case "SC":
            return "The entry of Pluto into the sign of Scorpio coincided with George Orwell's predictions of a totalitarian government and loss of individual rights in his famous book 1984. Pluto is extremely powerful in Scorpio, the sign that it rules, and this period was one of turmoil and revolution. During this era the Berlin Wall fell, the Soviet Union disbanded and became a commonwealth. Iran turned militantly conservative, Yugoslavia was torn apart by warring Serbs and Croats. Scorpio is the sign of destruction, and Pluto's transit was rife with worldwide terrorism. Pluto's link to the underworld was seen in the rise of an international drug trade. The sign of Scorpio rules sexuality, birth, death, and rebirth, and Pluto's journey gave rise to test-tube babies, surrogate parenting, cloned animals, and all manner of genetic engineering. The AIDS virus became rampant, underlining the themes of sex and death. Pluto's personal influence in Scorpio produces individuals with penetrating minds and strong wills. These people are imaginative and pussionate, possess psychic ability can be ruthless about getting their own way."
        case "SG":
            return "Pluto through Sagittarius in a relatively short time, the years, and its influence promises to be less heavy tarius is the sign of truth and open knowledge, and is years just prior to the turn of the millennium are de acterized as the Information Age. Television reported events in full detail almost before they took place, the Web links us to information within seconds endless streams of memoirs have left no one's secrets untold. In keeping with full disclosure, we witnessed a U.S. president's impeachment (and acquittal) that bean with the exposure of his extramarital sexual affair Sagittarius also represents foreign lands and far-flung places and through the computer and the Internet, Pluto has transformed the concept of distance. International trade and business takes place in seconds, retailers sell to the public directly through the computer, and e-mail instantly connects people on opposite sides of the Earth. We are hopeful that the first decade of the twenty-first century is an era of new values in philosophy, religion, education, and foreign affairs, areas all under Sagittarius's influence. Sagittarius is the sign of freedom, adventure, and exploration. There should be a new spirit of friendliness and spiritual sharing among nations. Europe has already joined in a Common Market. Pluto-in-Sagittarius brings deep hope and profound understanding. Its negative influences toward impractical extremes, but the optimism and enthusiasm that characterizes this transit should make this an uplifting time for human beings everywhere."
        case "CP":
            return "Because Capricorn is the sign of discipline and ambition pluto's influence here should stress responsibility and the ethic of work. Capricorn is the sign of government and long-term security, and Pluto may have the effect of bringing a new world order into being. Individual nations may join in a system of world government that leads to greater stability. Star-watchers are focused on the year 2012, which the Mayan calendar marks as the \"end of the world.\" Many spiritual movements believe this is a metaphor for a change in \"consciousness\" when the human race will adopt a more spiritual value hope there will be an end to war. system. Astrologically, Pluto in Capricorn holds out the hope there will be an end to war. By the time Pluto enters the following sign of Aquarius, the world will be in the Age of Aquarius. Pluto will bring even greater emphasis to the humanitarian and freedom-loving qualities of Aquarius. This should be a time of unimaginable scientific discovery, for Aquarius is the sign of science and future knowledge.When Pluto is in Pisces, human beings may at last comprehend the fullness of Pluto's power and add to their knowledge of the meaning of life. Pisces represents the completion of the circle, the last step before moving on to the first rung of a higher ladder. By this time the human race may have evolved to a higher and more noble plane."
        case "AQ":
            return ""
        case "PI":
            return ""
        default:
            return ""
        }
    }
    
    @IBAction func rightGesture(sender: UISwipeGestureRecognizer) {
    }
    
}
