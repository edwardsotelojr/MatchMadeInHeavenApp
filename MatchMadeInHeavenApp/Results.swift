//
//  Results.swift
//  MatchMadeInHeavenApp
//
//  Created by Edward Sotelo Jr on 7/1/19.
//  Copyright © 2019 Edward Sotelo Jr. All rights reserved.
//

import UIKit

class Results: UIViewController {
    
    var info: [String : [String]] = [:]
    
    @IBOutlet weak var firstPersonName: UILabel!
    @IBOutlet weak var firstPersonDOB: UILabel!
    @IBOutlet weak var firstPersonChineseSign: UILabel!
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
    
    @IBOutlet weak var secondPersonName: UILabel!
    @IBOutlet weak var secondPersonDOB: UILabel!
    @IBOutlet weak var secondPersonTime: UILabel!
    @IBOutlet weak var secondPersonChineseSign: UILabel!
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
    
    @IBOutlet weak var compareChineseYear: UILabel!
    @IBOutlet weak var compareSun: UILabel!
    @IBOutlet weak var compareMoon: UILabel!
    @IBOutlet weak var compareMercury: UILabel!
    @IBOutlet weak var compareVenus: UILabel!
    @IBOutlet weak var compareMars: UILabel!
    @IBOutlet weak var compareJupiter: UILabel!
    @IBOutlet weak var compareSaturn: UILabel!
    @IBOutlet weak var compareUranus: UILabel!
    @IBOutlet weak var compareNeptune: UILabel!
    @IBOutlet weak var comparePluto: UILabel!
    
    @IBAction func rightGesture(sender: UISwipeGestureRecognizer) {
        print ("Right")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        firstPersonName.text = info["Name"]![0]
        secondPersonName.text = info["Name"]![1]
        firstPersonSun.text = info["Sun"]![0] + getSunDescription(sign: info["Sun"]![0])
        firstPersonSun.sizeToFit()
       
        
        firstPersonSun.numberOfLines = 0
        firstSunSign.image = UIImage(named: getSignLogo(planet: info["Sun"]![0]))
        secondPersonSun.text = info["Sun"]![1] + getSunDescription(sign: info["Sun"]![1])
        secondPersonSun.sizeToFit()
        secondSunSign.image = UIImage(named: getSignLogo(planet: info["Sun"]![1]))
        firstPersonMoon.text = info["Moon"]![0]
        firstMoonSign.image = UIImage(named: getSignLogo(planet: info["Moon"]![0]))
        secondPersonMoon.text = info["Moon"]![1]
        secondMoonSign.image = UIImage(named: getSignLogo(planet: info["Moon"]![1]))
        firstPersonMercury.text = info["Mercury"]![0]
        firstMercurySign.image = UIImage(named: getSignLogo(planet: info["Mercury"]![0]))
        secondPersonMercury.text = info["Mercury"]![1]
        secondMercurySign.image = UIImage(named: getSignLogo(planet: info["Mercury"]![1]))
        firstPersonVenus.text = info["Venus"]![0]
        firstVenusSign.image = UIImage(named: getSignLogo(planet: info["Venus"]![0]))
        secondPersonVenus.text = info["Venus"]![1]
        secondVenusSign.image = UIImage(named: getSignLogo(planet: info["Venus"]![1]))
        firstPersonMars.text = info["Mars"]![0]
        firstMarsSign.image = UIImage(named: getSignLogo(planet: info["Mars"]![0]))
        secondPersonMars.text = info["Mars"]![1]
        secondMarsSign.image = UIImage(named: getSignLogo(planet: info["Mars"]![1]))
        firstPersonJupiter.text = info["Jupiter"]![0]
        firstJupiterSign.image = UIImage(named: getSignLogo(planet: info["Jupiter"]![0]))
        secondPersonJupiter.text = info["Jupiter"]![1]
        secondJupiterSign.image = UIImage(named: getSignLogo(planet: info["Jupiter"]![1]))
        firstPersonSaturn.text = info["Saturn"]![0]
        firstSaturnSign.image = UIImage(named: getSignLogo(planet: info["Saturn"]![0]))
        secondPersonSaturn.text = info["Saturn"]![1]
        secondSaturnSign.image = UIImage(named: getSignLogo(planet: info["Saturn"]![1]))
        firstPersonUranus.text = info["Uranus"]![0]
        firstUranusSign.image = UIImage(named: getSignLogo(planet: info["Uranus"]![0]))
        secondPersonUranus.text = info["Uranus"]![1]
        secondUranusSign.image = UIImage(named: getSignLogo(planet: info["Uranus"]![1]))
        firstPersonNeptune.text = info["Neptune"]![0]
        firstNeptuneSign.image = UIImage(named: getSignLogo(planet: info["Neptune"]![0]))
        secondPersonNeptune.text = info["Neptune"]![1]
        secondNeptuneSign.image = UIImage(named: getSignLogo(planet: info["Neptune"]![1]))
        firstPersonPluto.text = info["Pluto"]![0]
        firstPlutoSign.image = UIImage(named: getSignLogo(planet: info["Pluto"]![0]))
        secondPersonPluto.text = info["Pluto"]![1]
        secondPlutoSign.image = UIImage(named: getSignLogo(planet: info["Pluto"]![1]))
        firstPersonChineseSign.text = info["ChineseYear"]![0]
        secondPersonChineseSign.text = info["ChineseYear"]![1]
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
        let addChinesePoint = chineseMatch(firstChineseYear: info["ChineseYear"]![0], secondChineseYear: info["ChineseYear"]![1]) + chineseMatch(firstChineseYear: info["ChineseYear"]![1], secondChineseYear: info["ChineseYear"]![0])
        compareChineseYear.text = String(addChinesePoint)
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
    
    func Compare(firstSign: String, secondSign: String) -> Int {
        let signStart = firstSign.index(firstSign.startIndex, offsetBy: 0)
        let signEnd = firstSign.index(firstSign.startIndex, offsetBy: 2)
        let signRange = signStart..<signEnd
        let firstS = getElement(sign: String(firstSign[signRange]))
        let secondS = getElement(sign: String(secondSign[signRange]))
        return compare(firstPerson: firstS, secondPerson: secondS)
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
    
   
    
}
