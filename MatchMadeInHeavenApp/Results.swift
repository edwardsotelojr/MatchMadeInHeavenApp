//
//  Results.swift
//  MatchMadeInHeavenApp
//
//  Created by Edward Sotelo Jr on 7/1/19.
//  Copyright © 2019 Edward Sotelo Jr. All rights reserved.
//
// COMPARE TEXT COUNT TO ADD CONSTRAINT TO THE LARGER LABEL

import UIKit

class Results: UIViewController {
    
    var info: [String : [String]] = [:]
    var firstPersonMasculineCount = 0
    var firstPersonFeminineCount = 0
    var secondPersonMasculineCount = 0
    var secondPersonFeminineCount = 0
    
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
    
    @IBOutlet weak var chineseSunConstraint1: NSLayoutConstraint!
    @IBOutlet weak var chineseSunConstraint2: NSLayoutConstraint!
    @IBOutlet weak var compareChineseYear: UILabel!
    @IBOutlet weak var compareSun: UILabel!
    @IBOutlet weak var sunMoonConstraint1: NSLayoutConstraint!
    @IBOutlet weak var sunMoonConstraint2: NSLayoutConstraint!
    @IBOutlet weak var Moon: UILabel!
    @IBOutlet weak var compareMoon: UILabel!
    @IBOutlet weak var moonMercuryConstraint1: NSLayoutConstraint!
    @IBOutlet weak var moonMercuryConstraint2: NSLayoutConstraint!
    @IBOutlet weak var Mercury: UILabel!
    @IBOutlet weak var compareMercury: UILabel!
    @IBOutlet weak var mercuryVenusConstraint1: NSLayoutConstraint!
    @IBOutlet weak var mercuryVenusConstraint2: NSLayoutConstraint!
    @IBOutlet weak var Venus: UILabel!
    @IBOutlet weak var compareVenus: UILabel!
    @IBOutlet weak var venusMarsConstraint1: NSLayoutConstraint!
    @IBOutlet weak var venusMarsConstraint2: NSLayoutConstraint!
    @IBOutlet weak var Mars: UILabel!
    @IBOutlet weak var compareMars: UILabel!
    @IBOutlet weak var marsJupiterConstraint1: NSLayoutConstraint!
    @IBOutlet weak var marsJupiterConstraint2: NSLayoutConstraint!
    @IBOutlet weak var Jupiter: UILabel!
    @IBOutlet weak var compareJupiter: UILabel!
    @IBOutlet weak var jupiterSaturnConstraint1: NSLayoutConstraint!
    @IBOutlet weak var jupiterSaturnConstraint2: NSLayoutConstraint!
    @IBOutlet weak var Saturn: UILabel!
    @IBOutlet weak var compareSaturn: UILabel!
    @IBOutlet weak var saturnUranusConstraint1: NSLayoutConstraint!
    @IBOutlet weak var saturnUranusConstraint2: NSLayoutConstraint!
    @IBOutlet weak var Uranus: UILabel!
    @IBOutlet weak var compareUranus: UILabel!
    @IBOutlet weak var uranusNeptuneConstraint1: NSLayoutConstraint!
    @IBOutlet weak var uranusNeptuneConstraint2: NSLayoutConstraint!
    @IBOutlet weak var Neptune: UILabel!
    @IBOutlet weak var compareNeptune: UILabel!
    @IBOutlet weak var neptunePlutoConstraint1: NSLayoutConstraint!
    @IBOutlet weak var neptunePlutoConstraint2: NSLayoutConstraint!
    @IBOutlet weak var Pluto: UILabel!
    @IBOutlet weak var comparePluto: UILabel!
    
    @IBOutlet weak var comparison: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        for (key, value) in firstPersonChart{
            if(getGender(sign: value) == 1){
                firstPersonMasculineCount = firstPersonMasculineCount + 1
            }else{
                firstPersonFeminineCount = firstPersonFeminineCount + 1
            }
        }
        for (key, value) in secondPersonChart{
            if(getGender(sign: value) == 1){
                secondPersonMasculineCount = secondPersonMasculineCount + 1
            }else{
                secondPersonFeminineCount = secondPersonFeminineCount + 1
            }
        }
        firstPersonMasculine.text = String(firstPersonMasculineCount)
        firstPersonFeminine.text = String(firstPersonFeminineCount)
        secondPersonMasculine.text = String(secondPersonMasculineCount)
        secondPersonFeminine.text = String(secondPersonFeminineCount)
        
        firstPersonChineseSign.image! = UIImage(named: info["Chinese"]![0])!
        secondPersonChineseSign.image! = UIImage(named: info["Chinese"]![1])!
        firstPersonChinese.text = getChineseDescription(sign: info["Chinese"]![0])
        secondPersonChinese.text = getChineseDescription(sign: info["Chinese"]![1])
        if(firstPersonChinese.text!.count > secondPersonChinese.text!.count){
            chineseSunConstraint1.isActive = true
            chineseSunConstraint2.isActive = false
        }else{
            chineseSunConstraint1.isActive = false
            chineseSunConstraint2.isActive = true
        }
       
        firstPersonSun.text = getSunDescription(sign: info["Sun"]![0])
        firstSunSign.image = UIImage(named: getSignLogo(planet: info["Sun"]![0]))
        secondPersonSun.text = getSunDescription(sign: info["Sun"]![1])
        secondSunSign.image = UIImage(named: getSignLogo(planet: info["Sun"]![1]))
        if(firstPersonSun.text!.count > secondPersonSun.text!.count){
            sunMoonConstraint1.isActive = true
            sunMoonConstraint2.isActive = false
        }else{
            sunMoonConstraint1.isActive = false
            sunMoonConstraint2.isActive = true
        }
        
        firstPersonMoon.text = getMoonDescription(sign: info["Moon"]![0])
        firstMoonSign.image = UIImage(named: getSignLogo(planet: info["Moon"]![0]))
        secondPersonMoon.text = getMoonDescription(sign: info["Moon"]![1])
        secondMoonSign.image = UIImage(named: getSignLogo(planet: info["Moon"]![1]))
        if(firstPersonMoon.text!.count > secondPersonMoon.text!.count){
            moonMercuryConstraint1.isActive = true
            moonMercuryConstraint2.isActive = false
        }else{
            moonMercuryConstraint1.isActive = false
            moonMercuryConstraint2.isActive = true
        }
 
        firstPersonMercury.text = getMercuryDescription(sign: info["Mercury"]![0])
        firstMercurySign.image = UIImage(named: getSignLogo(planet: info["Mercury"]![0]))
        secondPersonMercury.text = getMercuryDescription(sign: info["Mercury"]![1])
        secondMercurySign.image = UIImage(named: getSignLogo(planet: info["Mercury"]![1]))
        if(firstPersonMercury.text!.count > secondPersonMercury.text!.count){
            mercuryVenusConstraint1.isActive = true
            mercuryVenusConstraint2.isActive = false
        }else{
            mercuryVenusConstraint1.isActive = false
            mercuryVenusConstraint2.isActive = true
        }
        
        firstPersonVenus.text = info["Venus"]![0]
        firstVenusSign.image = UIImage(named: getSignLogo(planet: info["Venus"]![0]))
        secondPersonVenus.text = info["Venus"]![1]
        secondVenusSign.image = UIImage(named: getSignLogo(planet: info["Venus"]![1]))
        if(firstPersonVenus.text!.count > secondPersonVenus.text!.count){
            venusMarsConstraint1.isActive = true
            venusMarsConstraint2.isActive = false
        }else{
            venusMarsConstraint1.isActive = false
            venusMarsConstraint2.isActive = true
        }
       
        firstPersonMars.text = info["Mars"]![0]
        firstMarsSign.image = UIImage(named: getSignLogo(planet: info["Mars"]![0]))
        secondPersonMars.text = info["Mars"]![1]
        secondMarsSign.image = UIImage(named: getSignLogo(planet: info["Mars"]![1]))
        if(firstPersonMars.text!.count > secondPersonMars.text!.count){
            marsJupiterConstraint1.isActive = true
            marsJupiterConstraint2.isActive = false
        }else{
            marsJupiterConstraint1.isActive = false
            marsJupiterConstraint2.isActive = true
        }
        
        firstPersonJupiter.text = info["Jupiter"]![0]
        firstJupiterSign.image = UIImage(named: getSignLogo(planet: info["Jupiter"]![0]))
        secondPersonJupiter.text = info["Jupiter"]![1]
        secondJupiterSign.image = UIImage(named: getSignLogo(planet: info["Jupiter"]![1]))
        if(firstPersonJupiter.text!.count > secondPersonJupiter.text!.count){
            jupiterSaturnConstraint1.isActive = true
            jupiterSaturnConstraint2.isActive = false
        }else{
            jupiterSaturnConstraint1.isActive = false
            jupiterSaturnConstraint2.isActive = true
        }
        
        firstPersonSaturn.text = info["Saturn"]![0]
        firstSaturnSign.image = UIImage(named: getSignLogo(planet: info["Saturn"]![0]))
        secondPersonSaturn.text = info["Saturn"]![1]
        secondSaturnSign.image = UIImage(named: getSignLogo(planet: info["Saturn"]![1]))
        if(firstPersonSaturn.text!.count > secondPersonSaturn.text!.count){
            saturnUranusConstraint1.isActive = true
            saturnUranusConstraint2.isActive = false
        }else{
            saturnUranusConstraint1.isActive = false
            saturnUranusConstraint2.isActive = true
        }
        
        firstPersonUranus.text = info["Uranus"]![0]
        firstUranusSign.image = UIImage(named: getSignLogo(planet: info["Uranus"]![0]))
        secondPersonUranus.text = info["Uranus"]![1]
        secondUranusSign.image = UIImage(named: getSignLogo(planet: info["Uranus"]![1]))
        if(firstPersonUranus.text!.count > secondPersonUranus.text!.count){
            uranusNeptuneConstraint1.isActive = true
            uranusNeptuneConstraint2.isActive = false
        }else{
            uranusNeptuneConstraint1.isActive = false
            uranusNeptuneConstraint2.isActive = true
        }
        
        firstPersonNeptune.text = info["Neptune"]![0]
        firstNeptuneSign.image = UIImage(named: getSignLogo(planet: info["Neptune"]![0]))
        secondPersonNeptune.text = info["Neptune"]![1]
        secondNeptuneSign.image = UIImage(named: getSignLogo(planet: info["Neptune"]![1]))
        if(firstPersonNeptune.text!.count > secondPersonNeptune.text!.count){
            neptunePlutoConstraint1.isActive = true
            neptunePlutoConstraint2.isActive = false
        }else{
            neptunePlutoConstraint1.isActive = false
            neptunePlutoConstraint2.isActive = true
        }
        firstPersonPluto.text = info["Pluto"]![0]
        firstPlutoSign.image = UIImage(named: getSignLogo(planet: info["Pluto"]![0]))
        secondPersonPluto.text = info["Pluto"]![1]
        secondPlutoSign.image = UIImage(named: getSignLogo(planet: info["Pluto"]![1]))
        compareSun.text = String(Compare(firstSign: firstPersonSun.text!, secondSign: secondPersonSun.text!))
        compareMoon.text = String(Compare(firstSign: firstPersonMoon.text!, secondSign: secondPersonMoon.text!))
        compareMercury.text = String(Compare(firstSign: firstPersonMercury.text!, secondSign: secondPersonMercury.text!))
        compareVenus.text = String(Compare(firstSign: firstPersonVenus.text!, secondSign: secondPersonVenus.text!))
        compareMars.text = String(Compare(firstSign: firstPersonMars.text!, secondSign: secondPersonMars.text!))
        compareJupiter.text = String(Compare(firstSign: firstPersonJupiter.text!, secondSign: secondPersonJupiter.text!))
        compareSaturn.text = String(Compare(firstSign: firstPersonSaturn.text!, secondSign: secondPersonSaturn.text!))
        compareUranus.text = String(Compare(firstSign: firstPersonUranus.text!, secondSign: secondPersonUranus.text!))
        compareNeptune.text = String(Compare(firstSign: firstPersonNeptune.text!, secondSign: secondPersonNeptune.text!))
        comparePluto.text = String(Compare(firstSign: firstPersonPluto.text!, secondSign: secondPersonPluto.text!))
        let addChinesePoint = chineseMatch(firstChineseYear: info["Chinese"]![0], secondChineseYear: info["Chinese"]![1]) + chineseMatch(firstChineseYear: info["Chinese"]![1], secondChineseYear: info["Chinese"]![0])
        compareChineseYear.text = String(addChinesePoint)
        comparison.text = comparisonResults(Hash: info)
    }
    
    func getSignLogo(planet:String) -> String {
        let signStart = planet.index(planet.startIndex, offsetBy:0)
        let signEnd = planet.index(planet.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let planetSign = String(planet[signRange])
        switch planetSign {
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
    
    func getGender(sign: String) -> Int {
        let signStart = sign.index(sign.startIndex, offsetBy:0)
        let signEnd = sign.index(sign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let planetSign = String(sign[signRange])

        if(planetSign == "AR" || planetSign == "GE" || planetSign == "LE" || planetSign == "LI" || planetSign == "SG" || planetSign == "AQ"){
            return 1
        }else {
            return 0
        }
    }
    
    func getElement(sign: String) -> Int {
        if(sign == "AR" || sign == "LE" || sign == "SG"){
            return 1
        }else if(sign == "TA" || sign == "VI" || sign == "CP"){
            return 2
        }else if(sign == "GE" || sign == "LI" || sign == "AQ"){
            return 3
        }else{
            return 4
        }
    }
    
    func compare(firstPerson:Int, secondPerson:Int) -> Int{
        if(firstPerson == secondPerson){
            return 3
        }else if (firstPerson - 2 == secondPerson || firstPerson + 2 == secondPerson){
            return 2
        }else{
            return 1
        }
    }
    //
    func Compare(firstSign: String, secondSign: String) -> Int {
        let signStart = firstSign.index(firstSign.startIndex, offsetBy: 0)
        let signEnd = firstSign.index(firstSign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let firstS = getElement(sign: String(firstSign[signRange]))
        let secondS = getElement(sign: String(secondSign[signRange]))
        return compare(firstPerson: firstS, secondPerson: secondS) // return 3, 2, or 1
    }
    
    func comparisonResults(Hash: [String : [String]]) -> String {
        let firstPersonChart = [info["Chinese"]![0], info["Sun"]![0], info["Moon"]![0],
                                info["Mercury"]![0], info["Venus"]![0], info["Mars"]![0],
                                info["Jupiter"]![0], info["Saturn"]![0], info["Uranus"]![0],
                                info["Neptune"]![0], info["Pluto"]![0]]
        let secondPersonChart = [info["Chinese"]![1], info["Sun"]![1], info["Moon"]![1],
                                 info["Mercury"]![1], info["Venus"]![1], info["Mars"]![1],
                                 info["Jupiter"]![1], info["Saturn"]![1], info["Uranus"]![1],
                                 info["Neptune"]![1], info["Pluto"]![1]]
        var results = 0
        for x in 1...10{
            results = Compare(firstSign: firstPersonChart[x], secondSign: secondPersonChart[x]) + results
        }
        results = chineseMatch(firstChineseYear: firstPersonChart[0], secondChineseYear: secondPersonChart[0]) + results
        print(String((Float(results)/42)*100) + "%")
        return String((Float(results)/42)*100) + "%"
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
            return ""
        case "TA":
            return ""
        case "GE":
            return ""
        case "CN":
            return ""
        case "LE":
            return ""
        case "VI":
            return ""
        case "LI":
            return ""
        case "SC":
            return ""
        case "SG":
            return ""
        case "CP":
            return ""
        case "AQ":
            return ""
        case "PI":
            return ""
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
            return ""
        case "TA":
            return ""
        case "GE":
            return ""
        case "CN":
            return ""
        case "LE":
            return ""
        case "VI":
            return ""
        case "LI":
            return ""
        case "SC":
            return ""
        case "SG":
            return ""
        case "CP":
            return ""
        case "AQ":
            return ""
        case "PI":
            return ""
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
            return ""
        case "TA":
            return ""
        case "GE":
            return ""
        case "CN":
            return ""
        case "LE":
            return ""
        case "VI":
            return ""
        case "LI":
            return ""
        case "SC":
            return ""
        case "SG":
            return ""
        case "CP":
            return ""
        case "AQ":
            return ""
        case "PI":
            return ""
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
            return ""
        case "TA":
            return ""
        case "GE":
            return ""
        case "CN":
            return ""
        case "LE":
            return ""
        case "VI":
            return ""
        case "LI":
            return ""
        case "SC":
            return ""
        case "SG":
            return ""
        case "CP":
            return ""
        case "AQ":
            return ""
        case "PI":
            return ""
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
            return ""
        case "TA":
            return ""
        case "GE":
            return ""
        case "CN":
            return ""
        case "LE":
            return ""
        case "VI":
            return ""
        case "LI":
            return ""
        case "SC":
            return ""
        case "SG":
            return ""
        case "CP":
            return ""
        case "AQ":
            return ""
        case "PI":
            return ""
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
            return ""
        case "TA":
            return ""
        case "GE":
            return ""
        case "CN":
            return ""
        case "LE":
            return ""
        case "VI":
            return ""
        case "LI":
            return ""
        case "SC":
            return ""
        case "SG":
            return ""
        case "CP":
            return ""
        case "AQ":
            return ""
        case "PI":
            return ""
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
            return ""
        case "CN":
            return ""
        case "LE":
            return ""
        case "VI":
            return ""
        case "LI":
            return ""
        case "SC":
            return ""
        case "SG":
            return ""
        case "CP":
            return ""
        case "AQ":
            return ""
        case "PI":
            return ""
        default:
            return ""
        }
    }
    
    
    
    
    
    
    @IBAction func rightGesture(sender: UISwipeGestureRecognizer) {
        print ("Right")
    }
    
}
