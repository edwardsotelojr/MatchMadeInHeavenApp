//
//  ViewController.swift
//  MatchMadeInHeavenApp
//
//  Created by Edward Sotelo Jr on 6/18/19.
//  Copyright © 2019 Edward Sotelo Jr. All rights reserved.
//

import Foundation
import UIKit
import GooglePlaces

var BirthChart = ["Name" : ["",""],
                  "Time" : ["",""],
                  "DOB" : ["", ""],
                  "Sun": ["", ""],
                  "Moon" : ["",""],
                  "Mercury" : ["",""],
                  "Venus" : ["",""],
                  "Mars" : ["",""],
                  "Jupiter" : ["",""],
                  "Saturn" : ["",""],
                  "Uranus" : ["",""],
                  "Neptune" : ["",""],
                  "Pluto": ["",""],
                  "ChineseYear": ["",""]]

class ViewController: UIViewController, UITextFieldDelegate{
    
    
    var filePath = ""
    let signs = ["AR", "TA", "GE", "CN", "LE", "VI", "LI", "SC", "SG", "CP", "AQ", "PI"]
    var personMonth = ["", ""]
    var personDay = ["", ""]
    var personYear = ["", ""]
    var personTime = ["first": ["12", "00"], "second": ["12", "00"]]
    var personOffset = [1, 1]
    let daysArray:[Int] = [28, 29, 30 ,31]
    let minutesArray = [String](arrayLiteral: "00am", "15am", "30am", "45am", "00pm", "15pm", "30pm", "45pm")
    var checkList:[Bool] = [true, false, false, false, false, false, true, true, false, false, false, false, false , true]
    
    private var datePicker: UIDatePicker?
    private var firstTimePicker: UIDatePicker?
    private var secondTimePicker: UIDatePicker?
    @IBOutlet weak var firstPersonName: UITextField!
    @IBOutlet weak var firstPersonDOB: UITextField!
    @IBOutlet weak var firstPersonLocation: UITextField!
    @IBOutlet weak var firstPersonTime: UITextField!

    @IBOutlet weak var secondPersonName: UITextField!
    @IBOutlet weak var secondPersonDOB: UITextField!
    @IBOutlet weak var secondPersonLocation: UITextField!
    @IBOutlet weak var secondPersonTime: UITextField!

    
    @IBOutlet var DayYearHourTextFields: [UITextField]!
    @IBOutlet weak var CalculateButton: UIButton!
    
    var personLocation:Int = 0
    var activeTextFieldTag:Int = 0
    var monthIndex:Int = 0
    var minuteIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        let calendar = Calendar.current
        for x in 0...1{
            personMonth[x] = String(calendar.component(.month, from: date))
            personDay[x] = String(calendar.component(.day, from: date))
            personYear[x] = String(calendar.component(.year, from: date) - 21)
        }
        firstPersonName.delegate = self
        firstPersonDOB.delegate = self
        firstPersonLocation.delegate = self
        firstPersonTime.delegate = self
        secondPersonName.delegate = self
        secondPersonDOB.delegate = self
        secondPersonLocation.delegate = self
        secondPersonTime.delegate = self
        self.hideKeyboardWhenTappedAround()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        datePicker!.date = Calendar.current.date(byAdding: .year, value: -21, to: Date())!
        firstPersonDOB.text = dateFormatter.string(from: datePicker!.date)
        secondPersonDOB.text = dateFormatter.string(from: datePicker!.date)
        firstPersonDOB.inputView = datePicker
        secondPersonDOB.inputView = datePicker
        var component = DateComponents()
        component.hour = 12
        component.minute = 00
        
        firstTimePicker = UIDatePicker()
        firstTimePicker?.datePickerMode = .time
        firstTimePicker?.addTarget(self, action: #selector(timeChanged(datePicker:)), for: .valueChanged)
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm a"
        firstTimePicker!.setDate(calendar.date(from: component)!, animated: true)
        firstPersonTime.text = timeFormatter.string(from: firstTimePicker!.date)
        secondTimePicker = UIDatePicker()
        secondTimePicker?.datePickerMode = .time
        secondTimePicker?.addTarget(self, action: #selector(timeChanged(datePicker:)), for: .valueChanged)
        secondTimePicker!.setDate(calendar.date(from: component)!, animated: true)
        secondPersonTime.text = timeFormatter.string(from: secondTimePicker!.date)
        firstPersonTime.inputView = firstTimePicker
        secondPersonTime.inputView = secondTimePicker
        
        addInputAccessoryForTextFields(textFields: [firstPersonName, firstPersonDOB, firstPersonLocation, firstPersonTime, secondPersonName, secondPersonDOB, secondPersonLocation, secondPersonTime], dismissable: true, previousNextable: true)
        firstPersonName.becomeFirstResponder()
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        let month = DateFormatter()
        month.dateFormat = "MM"
        let day = DateFormatter()
        day.dateFormat = "d"
        let year = DateFormatter()
        year.dateFormat = "yyyy"
        
        if(firstPersonDOB.isEditing){
            firstPersonDOB.text = formatter.string(from: datePicker.date)
            print(month.string(from: datePicker.date))
            personMonth[0] = month.string(from: datePicker.date)
            personDay[0] = day.string(from: datePicker.date)
            personYear[0] = year.string(from: datePicker.date)
            
        }else if(secondPersonDOB.isEditing){
            secondPersonDOB.text = formatter.string(from: datePicker.date)
            personMonth[1] = month.string(from: datePicker.date)
            personDay[1] = day.string(from: datePicker.date)
            personYear[1] = year.string(from: datePicker.date)
        }
    }
    
    
    @objc func timeChanged(datePicker: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let hour = DateFormatter()
        let minute = DateFormatter()
        hour.dateFormat = "HH"
        minute.dateFormat = "mm"
        
        if(firstPersonTime.isEditing){
            firstPersonTime.text = formatter.string(from: datePicker.date)
            personTime["first"]![0] = hour.string(from: datePicker.date)
            personTime["first"]![1] = minute.string(from: datePicker.date)
        }else if(secondPersonTime.isEditing){
            secondPersonTime.text = formatter.string(from: datePicker.date)
            personTime["second"]![0] = hour.string(from: datePicker.date)
            personTime["second"]![1] = minute.string(from: datePicker.date)
        }
    }
    
  
    @IBAction func firstPersonLocation(_ sender: Any) {
        firstPersonLocation.resignFirstResponder()
        let GMSController = GMSAutocompleteViewController()
        GMSController.delegate = self
        present(GMSController, animated: true, completion: nil)
    }
    

    @IBAction func secondPersonLocation(_ sender: Any) {
        secondPersonLocation.resignFirstResponder()
        let GMSController = GMSAutocompleteViewController()
        GMSController.delegate = self
        present(GMSController, animated: true, completion: nil)
    }
    
 
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        var tag:Int
        tag = textField.tag
        if(tag == 7){
            textField.resignFirstResponder()
            
        }else{
            let nextTextField = self.view.viewWithTag(tag+1) as? UITextField
            nextTextField?.becomeFirstResponder()
        }
        return true
    }
    /*
    @objc func doneButtonAction() {
        self.view.endEditing(true)
        if(activeTextFieldTag == 1){
            firstPersonMonthTextField.text = monthsArray[monthIndex]
            checkList[1] = true
            checkCheckList(array: checkList)
            firstPersonDayTextField.becomeFirstResponder()
        }else if(activeTextFieldTag == 5){
            firstPersonMinuteTextField.text = minutesArray[minuteIndex]
            checkList[5] = true
            checkCheckList(array: checkList)
            secondPersonNameTextField.becomeFirstResponder()
        }else if(activeTextFieldTag == 7){
            secondPersonMonthTextField.text = monthsArray[monthIndex]
            checkList[8] = true
            checkCheckList(array: checkList)
            secondPersonDayTextField.becomeFirstResponder()
        }else{
            secondPersonMinuteTextField.text = minutesArray[minuteIndex]
            checkList[12] = true
            checkCheckList(array: checkList)
        }
        monthIndex = 0
    }
    */
    
    func getBirthChart(monthNumber:Int, day:Int, year:Int) -> String {
        var lines:[String] = []
        if let filepath = Bundle.main.path(forResource: "Ephemerides/" + String(year), ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                lines = contents.components(separatedBy: .newlines)
                var index = 0
                for x in lines{
                    if(x == ""){
                        lines.remove(at: index)
                    }else{
                        index = index + 1
                    }
                }
            } catch {
                print("cannot loade")
                // contents could not be loaded
            }
        } else {
            print("not founded")
            // example.txt not found!
        }
        var inMonth = false
        let month = getMonth(Month: String(monthNumber))
        var birthChart:String = ""
        var dayString:String = ""
        if(day < 10){
            dayString.append("0")
            dayString.append(String(day))
        }else{
            dayString.append(String(day))
        }
        for line in lines{
            if(line.contains(month)){
                inMonth = true
            }
            if(inMonth && line.contains(" " + dayString + " ")){
                birthChart = line
                break
            }
        }
        return birthChart
    }
    
    func getFirstLine(year:Int) -> String{
        var line:String = ""
        if let filepath = Bundle.main.path(forResource: "Ephemerides/" + String(year), ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                let chineseStart = contents.index(contents.startIndex, offsetBy: 13)
                let chineseEnd = contents.index(contents.startIndex, offsetBy: 18)
                let chineseRange = chineseStart..<chineseEnd
                line = String(contents[chineseRange])
            } catch {
                print("cannot loade")
                // contents could not be loaded
            }
        } else {
            print("not founded")
            // example.txt not found!
        }
        return line
    }
    
    func getPreviousDayChart(month: Int, day: Int, year:Int) -> String {
        var previousDay: String?
        if(month == 1){
            if(day == 1){
                previousDay = getBirthChart(monthNumber: 12, day: 31, year: year-1)
            }else{
                previousDay = getBirthChart(monthNumber: month, day: day-1, year: year)
            }
        } else if(month == 2 || month == 4 || month == 6 || month == 8 || month == 9 ||  month == 11){
            if(day == 1) {
                previousDay = getBirthChart(monthNumber: month-1, day: 31, year: year)
            }else{
                previousDay = getBirthChart(monthNumber: month, day: day-1, year: year)
            }
        } else if(month == 5 || month == 7 || month == 10 || month == 12){
            if(day == 1) {
                previousDay = getBirthChart(monthNumber: month-1, day: 30, year: year)
            }else{
                previousDay = getBirthChart(monthNumber: month, day: day-1, year: year)
            }
        } else if(month == 3){
            if(year % 4 == 0){
                if(day == 1){
                    previousDay = getBirthChart(monthNumber: month-1, day: 29, year: year)
                }else{
                    previousDay = getBirthChart(monthNumber: month, day: day-1, year: year)
                }
            } else {
                if(day == 1){
                    previousDay = getBirthChart(monthNumber: month-1, day: 28, year: year)
                }else{
                    previousDay = getBirthChart(monthNumber: month, day: day-1, year: year)
                }
            }
        }
        return previousDay!
    }
    
    func getNextDay(month: Int, day: Int, year: Int) -> Array<Int> {
        var nextDay:Array<Int>?
        if(month == 12){
            if(day == 31){
                nextDay = [1, 1, year+1]
            }else{
                nextDay = [12, day+1, year]
            }
        } else if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 ||  month == 10){
            if(day == 31) {
                nextDay = [month+1, 1, year]
            }else{
                nextDay = [month, day+1, year]
            }
        } else if(month == 4 || month == 6 || month == 9 || month == 11){
            if(day == 30) {
                nextDay = [month+1, 1, year]
            }else{
                nextDay = [month, day+1, year]
            }
        } else if(month == 2){
            if(year % 4 == 0){
                if(day == 29){
                    nextDay = [2, 1, year]
                }else{
                    nextDay = [1, day+1, year]
                }
            } else {
                if(day == 28){
                    nextDay = [2, 1, year]
                }else{
                    nextDay = [1, day+1, year]
                }
            }
        }
        return nextDay!
    }
    
    func getNextDayChart(month: Int, day: Int, year: Int) -> String {
        var nextDay: String?
        if(month == 12){
            if(day == 31){
                nextDay = getBirthChart(monthNumber: 1, day: 1, year: year+1)
            }else{
                nextDay = getBirthChart(monthNumber: month, day: day+1, year: year)
            }
        } else if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 ||  month == 10){
            if(day == 31) {
                nextDay = getBirthChart(monthNumber: month + 1, day: 1, year: year)
            }else{
                nextDay = getBirthChart(monthNumber: month, day: day+1, year: year)
            }
        } else if(month == 4 || month == 6 || month == 9 || month == 11){
            if(day == 30) {
                nextDay = getBirthChart(monthNumber: month+1, day: 1, year: year)
            }else{
                nextDay = getBirthChart(monthNumber: month, day: day+1, year: year)
            }
        } else if(month == 2){
            if(year % 4 == 0){
                if(day == 29){
                    nextDay = getBirthChart(monthNumber: month+1, day: 1, year: year)
                }else{
                    nextDay = getBirthChart(monthNumber: month, day: day+1, year: year)
                }
            } else {
                if(day == 28){
                    nextDay = getBirthChart(monthNumber: month+1, day: 1, year: year)
                }else{
                    nextDay = getBirthChart(monthNumber: month, day: day+1, year: year)
                }
            }
        }
        return nextDay!
    }
    
    func planetAtBirth(rate: Float, time:Int, planet: String) -> String {
        var realPlanet:String = ""
        let signStart = planet.index(planet.startIndex, offsetBy: 2)
        let signEnd = planet.index(planet.endIndex, offsetBy: -2)
        let signRange = signStart..<signEnd
        let sign = String(planet[signRange])
        
        let degreeStart = planet.index(planet.startIndex, offsetBy: 0)
        let degreeEnd = planet.index(planet.endIndex, offsetBy: -4)
        let degreeRange = degreeStart..<degreeEnd
        var degree = Float(planet[degreeRange])
        
        let minuteStart = planet.index(planet.startIndex, offsetBy: 4)
        let minuteEnd = planet.index(planet.endIndex, offsetBy: 0)
        let minuteRange = minuteStart..<minuteEnd
        var minute = Float(planet[minuteRange])
        
        minute = minute! + (degree! * 60) // total minutes
        
        let move = rate * Float(time) // maybe more than 60
        
        var planetInMinute = move + minute! //official position of planet
        
        var nextSign:Bool = false
        if(planetInMinute > 1800) { //next sign
            planetInMinute = planetInMinute - 1800
            for s in signs{
                if (nextSign){
                    realPlanet.append(s)
                    break
                }
                if (s == "PI"){
                    realPlanet.append("AR")
                    break
                }else if (s == sign){
                    nextSign = true
                }
            }
        }else if (planetInMinute < 0){ // previous sign
            planetInMinute = 1800 + planetInMinute
            var index:Int = -1
            for s in signs{
                index += 1
                if(s == sign){ // once found, go to previous sign
                    break
                }
            }
            if(index != 0){
                realPlanet.append(signs[index-1])
            }else{
                realPlanet.append(signs[11])
            }
        }else{
            realPlanet.append(sign)
        }
        degree! = (planetInMinute/60)
        if(degree! < 10){
            realPlanet.append("0")
            realPlanet.append(String(Int(degree!)))
        } else {
            realPlanet.append(String(Int(degree!)))
        }
        let minutee = Int(planetInMinute) % 60
        if(minutee < 10){
            realPlanet.append("0")
            realPlanet.append(String(Int(minutee)))
        } else {
            realPlanet.append(String(minutee))
        }
        return realPlanet
    }
    
    func degreeDifference(planet1: String, planet2: String) -> String {
        var Dif: String = ""
        var degreeDif: Int
        var minuteDif: Int
        let degreeStart = planet1.index(planet1.startIndex, offsetBy: 0)
        let degreeEnd = planet1.index(planet1.startIndex, offsetBy: 2)
        let degreeRange = degreeStart..<degreeEnd
        let minuteStart = planet1.index(planet1.startIndex, offsetBy: 4)
        let minuteEnd = planet1.index(planet1.endIndex, offsetBy: 0)
        let minuteRange = minuteStart..<minuteEnd
        let signStart = planet1.index(planet1.startIndex, offsetBy: 2)
        let signEnd = planet1.index(planet1.startIndex, offsetBy: 4)
        let signRange = signStart..<signEnd
        let planet1Degree = Int(planet1[degreeRange])
        let planet2Degree = Int(planet2[degreeRange])
        let planet1Minute = Int(planet1[minuteRange])
        let planet2Minute = Int(planet2[minuteRange])
        let planet1Sign = String(planet1[signRange])
        let planet2Sign = String(planet2[signRange])
        let totalMinutePlanet1 = (planet1Degree! * 60) + planet1Minute!
        let totalMinutePlanet2 = (planet2Degree! * 60) + planet2Minute!
        var difference = totalMinutePlanet2 - totalMinutePlanet1 // negative if planet 1 is at the end of sign
        if(planet1Sign != planet2Sign){
            if(difference > 0){  //retrograde back to previous sign
                Dif.append("-")
                difference = (totalMinutePlanet1 + 1800) - totalMinutePlanet2
            }else{  //not retrograde
                Dif.append("+")
                difference = (totalMinutePlanet2 + 1800) - totalMinutePlanet1
            }
        }else{ // in same sign
            if(difference > 0){ //not retrograde
                Dif.append("+")
            }else{ // retrograde
                Dif.append("-")
                difference = -difference
            }
        }
        if(difference < 60){
            Dif.append("00")
            Dif.append(String(difference))
        }else{
            degreeDif = difference / 60
            minuteDif = difference % 60
            if(degreeDif < 10){
                Dif.append("0")
                Dif.append(String(degreeDif))
            }else{
                Dif.append(String(degreeDif))
            }
            if(minuteDif < 10){
                Dif.append("0")
                Dif.append(String(minuteDif))
            }else{
                Dif.append(String(minuteDif))
            }
        }
        return Dif // +1234
    }
    
    func getRate(Dif:String) -> Float {
        let degreeStart = Dif.index(Dif.startIndex, offsetBy: 1)
        let degreeEnd = Dif.index(Dif.endIndex, offsetBy: -2)
        let degreeRange = degreeStart..<degreeEnd
        let minuteStart = Dif.index(Dif.startIndex, offsetBy: 3)
        let minuteEnd = Dif.index(Dif.endIndex, offsetBy: 0)
        let minuteRange = minuteStart..<minuteEnd
        let difDegree = Float(Dif[degreeRange])!
        let difMinute = Float(Dif[minuteRange])!
        var minutes:Float
        minutes = (difDegree * 60) + difMinute
        var rate = minutes / 1440
        if(Dif.first == "-"){
            rate = -rate
        }
        return rate // in minutes per minutes
    }
    
    func addto(position:String, add:Int) -> String{
        // add two minutes
        var planet:String = ""
        let degreeStart = position.index(position.startIndex, offsetBy: 2)
        let degreeEnd = position.index(position.endIndex, offsetBy: -2)
        let degreeRange = degreeStart..<degreeEnd
        let minuteStart = position.index(position.startIndex, offsetBy: 4)
        let minuteEnd = position.index(position.endIndex, offsetBy: 0)
        let minuteRange = minuteStart..<minuteEnd
        let signStart = position.index(position.startIndex, offsetBy: 0)
        let signEnd = position.index(position.endIndex, offsetBy: -4)
        let signRange = signStart..<signEnd
        var positionDegree = Int(position[degreeRange])!
        var positionMinute = Int(position[minuteRange])!
        var positionSign = String(position[signRange])
        positionMinute = positionMinute + add
        
        if(positionDegree == 29){
            if(positionMinute >= 60){ // go to next sign
                positionDegree = 0
                positionMinute = positionMinute % 60
                var index:Int = -1
                for s in signs{
                    index += 1
                    if(s == positionSign && index != 11){
                        positionSign = signs[index+1]
                        planet.append(positionSign)
                        break
                    }
                }
                if(positionSign == "PI"){
                    positionSign = signs[0]
                    planet.append(positionSign)
                }
            }else{
                planet.append(positionSign)
                positionMinute = positionMinute % 60
            }
        }else{
            planet.append(positionSign)
            if(positionMinute > 59){
                positionDegree = positionDegree + 1
                positionMinute = positionMinute % 60
            }
        }
        if(positionDegree < 10){
            planet.append("0")
            planet.append(String(positionDegree))
        }else{
            planet.append(String(positionDegree))
        }
        if(positionMinute < 10){
            planet.append("0")
            planet.append(String(positionMinute))
        }else{
            planet.append(String(positionMinute))
        }
        return planet
    }
    
    func getUTC(timeZoneDifference: Int, hour:Int, minute: Int ) -> Int {
        // Ex: houston time 2 am => UTCTime = 7 UTC
        return ((hour + timeZoneDifference) * 60) + minute
    }
    
    func getMonth(Month: String) -> String {
        if(Month == "1"){
            return "JANUARY"
        }else if(Month == "2"){
            return "FEBRUARY"
        }else if(Month == "3"){
            return "MARCH"
        }else if(Month == "4"){
            return "APRIL"
        }else if(Month == "5"){
            return "MAY"
        }else if(Month == "6"){
            return "JUNE"
        }else if(Month == "7"){
            return "JULY"
        }else if(Month == "8"){
            return "AUGUST"
        }else if(Month == "9"){
            return "SEPTEMBER"
        }else if(Month == "10"){
            return "OCTOBER"
        }else if(Month == "11"){
            return "NOVEMBER"
        }else{
            return "DECEMBER"
        }
    }
    
    func getChineseYearSign(firstLine: String, monthNumber: Int, day:Int, year:Int) -> String {
        let addOrNot = determineChineseYearForAquarius(ChineseDate: firstLine, month: monthNumber, day: day)
        let chineseIndex = (year - 1900 + addOrNot) % 12
        switch chineseIndex{
        case 0:
            return "Rat"
        case 1:
            return "Ox"
        case 2:
            return "Tiger"
        case 3:
            return "Rabbit"
        case 4:
            return "Dragon"
        case 5:
            return "Snake"
        case 6:
            return "Horse"
        case 7:
            return "Goat"
        case 8:
            return "Monkey"
        case 9:
            return "Rooster"
        case 10:
            return "Dog"
        case 11:
            return "Pig"
        default:
            return ""
        }
    }
    
    func getPlanet(birthChart:String, startIndex:Int, endIndex:Int) -> String {
        let signStart = birthChart.index(birthChart.startIndex, offsetBy: startIndex)
        let signEnd = birthChart.index(birthChart.startIndex, offsetBy: endIndex)
        let signRange = signStart..<signEnd
        return String(birthChart[signRange])
    }
    
    @IBAction func calculateChart(_ sender: Any) {
        var Name: Array<String> = [firstPersonName.text!, secondPersonName.text!]
        var DOB: Array<String> = [firstPersonDOB.text!, secondPersonDOB.text!]
        var monthNumber: Array<Int> = [Int(personMonth[0])!, Int(personMonth[1])!]
        var Day: Array<Int> = [Int(personDay[0])!, Int(personDay[1])!]
        var Year: Array<Int> = [Int(personYear[0])!, Int(personYear[1])!]
        var UTCTime: Array<Int> = [getUTC(timeZoneDifference: personOffset[0], hour: Int(personTime["first"]![0])!, minute: Int(personTime["first"]![1])!),getUTC(timeZoneDifference: personOffset[1], hour: Int(personTime["second"]![0])!, minute: Int(personTime["second"]![1])!)]
        var minutes: Array<String> = [personTime["first"]![1], personTime["second"]![1]]
        print(monthNumber)
        print(Day)
        print(Year)
        print(UTCTime)
        for x in 0...1{
            BirthChart["ChineseYear"]![x] = getChineseYearSign(firstLine: getFirstLine(year: Year[x]), monthNumber: monthNumber[x], day: Day[x], year: Year[x])
            var birthChartInUTC: String
            var compareChart: String
            BirthChart["Name"]![x] = Name[x]
            BirthChart["DOB"]![x] = DOB[x]
            BirthChart["Time"]![x] = "\(UTCTime[x]/60):\(minutes[x]) UTC"
            
            if(UTCTime[x] >= 1440){
                birthChartInUTC = getNextDayChart(month: monthNumber[x], day: Day[x], year: Year[x])
                var nextDay:Array<Int> = getNextDay(month: monthNumber[x], day: Day[x], year: Year[x])
                compareChart = getBirthChart(monthNumber: nextDay[0], day: nextDay[1], year: nextDay[2])
                UTCTime[x] = 1440 - UTCTime[x]
            } else if (UTCTime[x] >= 0){
                birthChartInUTC = getBirthChart(monthNumber: monthNumber[x], day: Day[x], year: Year[x])
                compareChart = getNextDayChart(month: monthNumber[x], day: Day[x], year: Year[x])
            } else{
                birthChartInUTC = getPreviousDayChart(month: monthNumber[x], day: Day[x], year: Year[x])
                compareChart = getBirthChart(monthNumber: monthNumber[x], day: Day[x], year: Year[x])
                UTCTime[x] = 1440 + UTCTime[x]
            }
            print(birthChartInUTC)
            print(compareChart)
            
            let sunSign = getPlanet(birthChart: birthChartInUTC, startIndex: 15, endIndex: 21)
            let compareDaySunSign = getPlanet(birthChart: compareChart, startIndex: 15, endIndex: 21)
            let sunRate = getRate(Dif: degreeDifference(planet1: sunSign, planet2: compareDaySunSign))
            let sunAtBirth = planetAtBirth(rate: sunRate, time: UTCTime[x], planet: sunSign)
            BirthChart["Sun"]![x] = sunAtBirth
            
            let moonSign = getPlanet(birthChart: birthChartInUTC, startIndex: 22, endIndex: 28)
            let compareDayMoonSign = getPlanet(birthChart: compareChart, startIndex: 22, endIndex: 28)
            let moonRate = getRate(Dif: degreeDifference(planet1: moonSign, planet2: compareDayMoonSign))
            let moonAtBirth = planetAtBirth(rate: moonRate, time: UTCTime[x], planet: moonSign)
            BirthChart["Moon"]![x] = moonAtBirth
           
            let mercurySign = getPlanet(birthChart: birthChartInUTC, startIndex: 29, endIndex: 35)
            let compareDayMercurySign = getPlanet(birthChart: compareChart, startIndex: 29, endIndex: 35)
            let mercuryRate = getRate(Dif: degreeDifference(planet1: mercurySign, planet2: compareDayMercurySign))
            let mercuryAtBirth = planetAtBirth(rate: mercuryRate, time: UTCTime[x], planet: mercurySign)
            BirthChart["Mercury"]![x] = mercuryAtBirth
            
            let venusSign = getPlanet(birthChart: birthChartInUTC, startIndex: 36, endIndex: 42)
            let compareDayVenusSign = getPlanet(birthChart: compareChart, startIndex: 36, endIndex: 42)
            let venusRate = getRate(Dif: degreeDifference(planet1: venusSign, planet2: compareDayVenusSign))
            let venusAtBirth = planetAtBirth(rate: venusRate, time: UTCTime[x], planet: venusSign)
            let correctVenus = addto(position: venusAtBirth, add: 1)
            BirthChart["Venus"]![x] = correctVenus
            
            let marsSign = getPlanet(birthChart: birthChartInUTC, startIndex: 43, endIndex: 49)
            let compareDayMarsSign = getPlanet(birthChart: compareChart, startIndex: 43, endIndex: 49)
            let marsRate = getRate(Dif: degreeDifference(planet1: marsSign, planet2: compareDayMarsSign))
            let marsAtBirth = planetAtBirth(rate: marsRate, time: UTCTime[x], planet: marsSign)
            BirthChart["Mars"]![x] = marsAtBirth
            
            let jupiterSign = getPlanet(birthChart: birthChartInUTC, startIndex: 50, endIndex: 56)
            let compareDayJupiterSign = getPlanet(birthChart: compareChart, startIndex: 50, endIndex: 56)
            let jupiterRate = getRate(Dif: degreeDifference(planet1: jupiterSign, planet2: compareDayJupiterSign))
            let jupiterAtBirth = planetAtBirth(rate: jupiterRate, time: UTCTime[x], planet: jupiterSign)
            BirthChart["Jupiter"]![x] = jupiterAtBirth
            
            let saturnSign = getPlanet(birthChart: birthChartInUTC, startIndex: 57, endIndex: 63)
            let compareDaySaturnSign = getPlanet(birthChart: compareChart, startIndex: 57, endIndex: 63)
            let saturnRate = getRate(Dif: degreeDifference(planet1: saturnSign, planet2: compareDaySaturnSign))
            let saturnAtBirth = planetAtBirth(rate: saturnRate, time: UTCTime[x], planet: saturnSign)
            let correctSaturn = addto(position: saturnAtBirth, add: 1)
            BirthChart["Saturn"]![x] = correctSaturn
            
            let uranusSign = getPlanet(birthChart: birthChartInUTC, startIndex: 64, endIndex: 70)
            let compareDayUranusSign = getPlanet(birthChart: compareChart, startIndex: 64, endIndex: 70)
            let uranusRate = getRate(Dif: degreeDifference(planet1: uranusSign, planet2: compareDayUranusSign))
            let uranusAtBirth = planetAtBirth(rate: uranusRate, time: UTCTime[x], planet: uranusSign)
            BirthChart["Uranus"]![x] = uranusAtBirth
            
            let neptuneSign = getPlanet(birthChart: birthChartInUTC, startIndex: 71, endIndex: 77)
            let compareDayNeptuneSign = getPlanet(birthChart: compareChart, startIndex: 71, endIndex: 77)
            let neptuneRate = getRate(Dif: degreeDifference(planet1: neptuneSign, planet2: compareDayNeptuneSign))
            let neptuneAtBirth = planetAtBirth(rate: neptuneRate, time: UTCTime[x], planet: neptuneSign)
            BirthChart["Neptune"]![x] = neptuneAtBirth
            
            let plutoSign = getPlanet(birthChart: birthChartInUTC, startIndex: 78, endIndex: 84)
            let compareDayPlutoSign = getPlanet(birthChart: compareChart, startIndex: 78, endIndex: 84)
            let plutoRate = getRate(Dif: degreeDifference(planet1: plutoSign, planet2: compareDayPlutoSign))
            let plutoAtBirth = planetAtBirth(rate: plutoRate, time: UTCTime[x], planet: plutoSign)
            BirthChart["Pluto"]![x] = plutoAtBirth
           
        }
        performSegue(withIdentifier: "Results", sender: self)
        // Update Save Button
        //  saveButton.isEnabled = formIsValid
    }
    
    func determineChineseYearForAquarius(ChineseDate:String, month:Int, day:Int) -> Int {
        let monthStart = ChineseDate.index(ChineseDate.startIndex, offsetBy: 0)
        let monthEnd = ChineseDate.index(ChineseDate.endIndex, offsetBy: -3)
        let monthRange = monthStart..<monthEnd
        let dayStart = ChineseDate.index(ChineseDate.startIndex, offsetBy: 3)
        let dayEnd = ChineseDate.index(ChineseDate.endIndex, offsetBy: 0)
        let dayRange = dayStart..<dayEnd
        let chineseMonth = Int32(ChineseDate[monthRange])! - 1
        let chineseDay = Int32(ChineseDate[dayRange])!
        print("chineseMonth", chineseMonth)
        print("month",month)
        if(chineseMonth < month && month <= 1){ // chinese sign hasnt changed
            return -1
        }else if (chineseMonth == month){
            if(chineseDay > day){ // chinese sign hasnt changed
                return -1
            }else{
                return 0
            }
        }else if(chineseMonth > month){
                return -1
        }else{
            return 0
        }
    }
    
    @IBAction func unwindToVC(segue:UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: Results = segue.destination as! Results
        vc.info = BirthChart
    }
    
    func addInputAccessoryForTextFields(textFields: [UITextField], dismissable: Bool = true, previousNextable: Bool = false) {
        for (index, textField) in textFields.enumerated() {
            let toolbar: UIToolbar = UIToolbar()
            toolbar.sizeToFit()
            var items = [UIBarButtonItem]()
            if previousNextable {
                let previousButton = UIBarButtonItem.init(title: "Prev", style: .plain, target: self, action: nil)
                previousButton.width = 30
                if textField == textFields.first {
                    previousButton.isEnabled = false
                } else {
                    previousButton.target = textFields[index - 1]
                    previousButton.action = #selector(UITextField.becomeFirstResponder)
                }
                
                
                let nextButton = UIBarButtonItem.init(title: "Next", style: .plain, target: self, action: nil)
                nextButton.width = 30
                if textField == textFields.last {
                    nextButton.isEnabled = false
                    
                } else {
                    nextButton.target = textFields[index + 1]
                    nextButton.action = #selector(UITextField.becomeFirstResponder)
                }
                items.append(contentsOf: [previousButton, nextButton])
            }
            
            let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: view, action: #selector(UIView.endEditing))
            items.append(contentsOf: [spacer, doneButton])
            
            
            toolbar.setItems(items, animated: false)
            textField.inputAccessoryView = toolbar
        }
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == firstPersonLocation){
            activeTextFieldTag = 2
        }
        else if(textField == secondPersonLocation){
            activeTextFieldTag = 6
        }
        if(firstPersonName.text!.count > 1 && firstPersonLocation.text != "" && secondPersonName.text!.count > 1 && secondPersonLocation.text != ""){
            CalculateButton.isHidden = false
        }else{
            CalculateButton.isHidden = true
        }
    }
}



extension ViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        // Get the place name from 'GMSAutocompleteViewController'
        // Then display the name in textField
        let APIKey = "AIzaSyABBVE90zE3SB_kb52KWFSS2Fqumy303do"
        let url = "https://maps.googleapis.com/maps/api/timezone/json?location=\(place.coordinate.latitude),\(place.coordinate.longitude)&timestamp=1458000000&key=\(APIKey)"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                if(self.activeTextFieldTag == 2){
                    self.personOffset[0] = (json["rawOffset"] as! Int / -3600)
                    DispatchQueue.main.async {
                        self.firstPersonLocation.text = place.name
                        self.firstPersonTime.becomeFirstResponder()
                    }
                }else if(self.activeTextFieldTag == 6) {
                    self.personOffset[1] = (json["rawOffset"] as! Int / -3600)
                    DispatchQueue.main.async {
                        self.secondPersonLocation.text = place.name
                        self.secondPersonTime.becomeFirstResponder()
                    }
                }
            } catch {
                print("error")
            }
        })
        
        task.resume()
        // Dismiss the GMSAutocompleteViewController when something is selected
        dismiss(animated: true, completion: nil)
    }
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // Handle the error
        print("Error: ", error.localizedDescription)
    }
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        // Dismiss when the user canceled the action
        dismiss(animated: true, completion: nil)
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
