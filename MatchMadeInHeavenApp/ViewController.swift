//
//  ViewController.swift
//  MatchMadeInHeavenApp
//
//  Created by Edward Sotelo Jr on 6/18/19.
//  Copyright © 2019 Edward Sotelo Jr. All rights reserved.
//
import Foundation
import UIKit
import TimeZonePicker
var BirthChart = ["Name" : ["",""],
                  "DOB" : ["",""],
                  "Time" : ["",""],
                  "Month" : ["",""],
                  "Day" : ["",""],
                  "Year" : ["", ""],
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

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, TimeZonePickerDelegate, UITextFieldDelegate{
    
    var filePath = ""
    let signs = ["AR", "TA", "GE", "CN", "LE", "VI", "LI", "SC", "SG", "CP", "AQ", "PI"]
    let monthsArray:[String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let daysArray:[Int] = [28, 29, 30 ,31]
    let minutesArray = [String](arrayLiteral: "00am", "15am", "30am", "45am", "00pm", "15pm", "30pm", "45pm")
    var checkList:[Bool] = [true, false, false, false, false, false, true, true, false, false, false, false, false , true]
    
    @IBOutlet weak var CalculateButton: UIButton!
    @IBOutlet weak var firstPersonNameTextField: UITextField!
    @IBOutlet weak var firstPersonMonthTextField: UITextField!
    let firstPersonMonthPickerView = UIPickerView()
    @IBOutlet weak var firstPersonDayTextField: UITextField!
    @IBOutlet weak var firstPersonYearTextField: UITextField!
    @IBOutlet weak var firstPersonHourTextField: UITextField!
    @IBOutlet weak var firstPersonMinuteTextField: UITextField!
    let firstPersonMinutePickerView = UIPickerView()
    @IBOutlet weak var firstPersonLocationButton: UIButton!
    
    @IBOutlet weak var secondPersonNameTextField: UITextField!
    @IBOutlet weak var secondPersonMonthTextField: UITextField!
    let secondPersonMonthPickerView = UIPickerView()
    @IBOutlet weak var secondPersonDayTextField: UITextField!
    @IBOutlet weak var secondPersonYearTextField: UITextField!
    @IBOutlet weak var secondPersonHourTextField: UITextField!
    @IBOutlet weak var secondPersonMinuteTextField: UITextField!
    let secondPersonMinutePickerView = UIPickerView()
    @IBOutlet weak var secondPersonLocation: UIButton!
    
    var names: Array<String> = ["", ""]
    var months: Array<String> = ["", ""]
    var days: Array<Int> = [32, 32]
    var years: Array<Int> = [2101, 2101]
    var hours: Array<Int> = [25, 25]
    var minutes: Array<String> = ["", ""]
    var locations: Array<Int> = [25,25]
    @IBOutlet var DayYearHourTextFields: [UITextField]!
    
    var personLocation:Int = 0
    var activeTextFieldTag:Int = 0
    var monthIndex:Int = 0
    var minuteIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CalculateButton.isEnabled = false
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        for textField in DayYearHourTextFields{
             textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        }
        
        self.firstPersonMonthPickerView.dataSource = self
        self.firstPersonMonthPickerView.delegate = self
        firstPersonNameTextField.delegate = self
        firstPersonMonthTextField.delegate = self
        firstPersonDayTextField.delegate = self
        firstPersonYearTextField.delegate = self
        firstPersonHourTextField.delegate = self
        firstPersonMinuteTextField.delegate = self
        self.firstPersonMinutePickerView.dataSource = self
        self.firstPersonMinutePickerView.delegate = self
        
        self.secondPersonMonthPickerView.dataSource = self
        self.secondPersonMonthPickerView.delegate = self
        secondPersonNameTextField.delegate = self
        secondPersonMonthTextField.delegate = self
        secondPersonDayTextField.delegate = self
        secondPersonYearTextField.delegate = self
        secondPersonHourTextField.delegate = self
        secondPersonMinuteTextField.delegate = self
        self.secondPersonMinutePickerView.dataSource = self
        self.secondPersonMinutePickerView.delegate = self
        
        firstPersonMonthTextField.inputView = firstPersonMonthPickerView
        firstPersonMinuteTextField.inputView = firstPersonMinutePickerView
        secondPersonMonthTextField.inputView = secondPersonMonthPickerView
        secondPersonMinuteTextField.inputView = secondPersonMinutePickerView
        self.firstPersonMonthTextField.inputAccessoryView = toolbar
        self.firstPersonMinuteTextField.inputAccessoryView = toolbar
        self.secondPersonMonthTextField.inputAccessoryView = toolbar
        self.secondPersonMinuteTextField.inputAccessoryView = toolbar
    }
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
   
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == firstPersonMonthPickerView || pickerView == secondPersonMonthPickerView){
            return 12
        }else{
            return 8
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == firstPersonMonthPickerView || pickerView == secondPersonMonthPickerView){
            return monthsArray[row]
        }else{
            return minutesArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(pickerView == firstPersonMonthPickerView){
            firstPersonMonthTextField.text = monthsArray[row]
            monthIndex = row
            checkList[1] = true
            checkCheckList(array: checkList)
        }else if(pickerView == secondPersonMonthPickerView){
            secondPersonMonthTextField.text = monthsArray[row]
            monthIndex = row
            checkList[8] = true
            checkCheckList(array: checkList)
        }else if(pickerView == firstPersonMinutePickerView){
            firstPersonMinuteTextField.text = minutesArray[row]
            minuteIndex = row
            checkList[5] = true
            checkCheckList(array: checkList)
        }else{
            secondPersonMinuteTextField.text = minutesArray[row]
            minuteIndex = row
            checkList[12] = true
            checkCheckList(array: checkList)
        }
    }
    
    func timeZonePicker(_ timeZonePicker: TimeZonePickerViewController, didSelectTimeZone timeZone: TimeZone) {
        let timeZoneValue: Int = timeZone.secondsFromGMT()/3600
        if(personLocation == 0){
            locations[0] = timeZoneValue
        }else{
            locations[1] = timeZoneValue
        }
        timeZonePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func firstPersonLocation(_ sender: Any) {
        let timeZonePicker = TimeZonePickerViewController.getVC(withDelegate: self)
        present(timeZonePicker, animated: true, completion: { () in self.personLocation = 0 })
    }
    
    @IBAction func secondPersonLocation(_ sender: Any) {
        let timeZonePicker = TimeZonePickerViewController.getVC(withDelegate: self)
        present(timeZonePicker, animated: true, completion: { () in self.personLocation = 1 })
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextFieldTag = textField.tag
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        var tag:Int
        tag = textField.tag
        textField.resignFirstResponder()
        if(activeTextFieldTag == 5 || activeTextFieldTag == 11){
            print("go to location picker")
        }else{
            let nextTextField = self.view.viewWithTag(tag+1) as? UITextField
            nextTextField?.becomeFirstResponder()
        }
        return true
    }
    
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
    @objc func textDidChange() {
        if(activeTextFieldTag == 2){
        }
    }
    
    
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
        let month = getMonth(Month: monthNumber)
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
        if(month == 0){
            if(day == 1){
                previousDay = getBirthChart(monthNumber: 11, day: 31, year: year-1)
            }else{
                previousDay = getBirthChart(monthNumber: month, day: day-1, year: year)
            }
        } else if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 ||  month == 10){
            if(day == 1) {
                previousDay = getBirthChart(monthNumber: month-1, day: 31, year: year)
            }else{
                previousDay = getBirthChart(monthNumber: month, day: day-1, year: year)
            }
        } else if(month == 4 || month == 6 || month == 9 || month == 11){
            if(day == 1) {
                previousDay = getBirthChart(monthNumber: month-1, day: 30, year: year)
            }else{
                previousDay = getBirthChart(monthNumber: month, day: day-1, year: year)
            }
        } else if(month == 2){
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
        if(month == 11){
            if(day == 31){
                nextDay = [1, 1, year+1]
            }else{
                nextDay = [11, day+1, year]
            }
        } else if(month == 0 || month == 2 || month == 4 || month == 6 || month == 7 ||  month == 9){
            if(day == 31) {
                nextDay = [month+1, 1, year]
            }else{
                nextDay = [month, day+1, year]
            }
        } else if(month == 3 || month == 5 || month == 8 || month == 10){
            if(day == 30) {
                nextDay = [month+1, 1, year]
            }else{
                nextDay = [month, day+1, year]
            }
        } else if(month == 1){
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
        if(month == 11){
            if(day == 31){
                nextDay = getBirthChart(monthNumber: 0, day: 1, year: year+1)
            }else{
                nextDay = getBirthChart(monthNumber: month, day: day+1, year: year)
            }
        } else if(month == 0 || month == 2 || month == 4 || month == 6 || month == 7 ||  month == 9){
            if(day == 31) {
                nextDay = getBirthChart(monthNumber: month + 1, day: 1, year: year)
            }else{
                nextDay = getBirthChart(monthNumber: month, day: day+1, year: year)
            }
        } else if(month == 3 || month == 5 || month == 8 || month == 10){
            if(day == 30) {
                nextDay = getBirthChart(monthNumber: month+1, day: 1, year: year)
            }else{
                nextDay = getBirthChart(monthNumber: month, day: day+1, year: year)
            }
        } else if(month == 1){
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
        var sign = String(planet[signRange])
        
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
        var rate = minutes / 96
        if(Dif.first == "-"){
            rate = -rate
        }
        return rate // in minutes per 15 minutes
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
    
    func getUTC(timeZoneDifference: Int, minute: String, hour:Int ) -> Int32 {
        var UTCTime:Int = 0                     // Ex: Australia time 2am => UTCTime = -5 UTC
        var UTCHour:Int
        var UTCMinute:Int
        let dayNightStart = minute.index(minute.startIndex, offsetBy: 2)
        let dayNightEnd = minute.index(minute.endIndex, offsetBy: 0)
        let Range = dayNightStart..<dayNightEnd
        let minuteStart = minute.index(minute.startIndex, offsetBy: 0)
        let minuteEnd = minute.index(minute.endIndex, offsetBy: -2)
        let minuteRange = minuteStart..<minuteEnd
        if(minute[Range] == "pm" ){
            if(hour == 12){
                UTCHour = hour
            }else{
                UTCHour = hour + 12
            }
        }else{
            if(hour == 12){
                UTCHour = 0
            }else{
                UTCHour = hour
            }
        }
        if(minute[minuteRange] == "00"){
            UTCMinute = 0
        } else if (minute[minuteRange] == "15"){
            UTCMinute = 1
        } else if (minute[minuteRange] == "30"){
            UTCMinute = 2
        } else {
            UTCMinute = 3
        }
        UTCTime = ((UTCHour - timeZoneDifference) * 4) + UTCMinute  // Ex: houston time 2 am => UTCTime = 7 UTC
        return Int32(UTCTime)      // 0 through 96 interval                // Ex: houston time 10pm => UTCTime = 27 UTC
    }
    
    func getMonthNumber(Month: String) -> Int {
        if(Month == "January"){
            return 0
        }else if(Month == "February"){
            return 1
        }else if(Month == "March"){
            return 2
        }else if(Month == "April"){
            return 3
        }else if(Month == "May"){
            return 4
        }else if(Month == "June"){
            return 5
        }else if(Month == "July"){
            return 6
        }else if(Month == "August"){
            return 7
        }else if(Month == "September"){
            return 8
        }else if(Month == "October"){
            return 9
        }else if(Month == "November"){
            return 10
        }else{
            return 11
        }
    }
    func getMonth(Month: Int) -> String {
        if(Month == 0){
            return "JANUARY"
        }else if(Month == 1){
            return "FEBRUARY"
        }else if(Month == 2){
            return "MARCH"
        }else if(Month == 3){
            return "APRIL"
        }else if(Month == 4){
            return "MAY"
        }else if(Month == 5){
            return "JUNE"
        }else if(Month == 6){
            return "JULY"
        }else if(Month == 7){
            return "AUGUST"
        }else if(Month == 8){
            return "SEPTEMBER"
        }else if(Month == 9){
            return "OCTOBER"
        }else if(Month == 10){
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
        var Name: Array<String> = [firstPersonNameTextField.text!, secondPersonNameTextField.text!]
        var Month: Array<String> = [firstPersonMonthTextField.text!, secondPersonMonthTextField.text!]
        var MonthNumber: Array<Int> = [getMonthNumber(Month: Month[0]), getMonthNumber(Month: Month[1])]
        var Day: Array<Int> = [Int(firstPersonDayTextField.text!)!, Int(secondPersonDayTextField.text!)!]
        var Year: Array<Int> = [Int(firstPersonYearTextField.text!)!, Int(secondPersonYearTextField.text!)!]
        var Hour: Array<Int> = [Int(firstPersonHourTextField.text!)!, Int(secondPersonHourTextField.text!)!]
        var Minute: Array<String> = [firstPersonMinuteTextField.text!, secondPersonMinuteTextField.text!]
        var UTCTime: Array<Int> = [0,0]
        
        for x in 0...1{
            BirthChart["ChineseYear"]![x] = getChineseYearSign(firstLine: getFirstLine(year: Year[x]), monthNumber: MonthNumber[x], day: Day[x], year: Year[x])
            
            UTCTime[x] = Int(getUTC(timeZoneDifference: locations[x], minute: Minute[x], hour: Int(Hour[x])))
            var birthChartInUTC: String
            var compareChart: String
            BirthChart["Name"]![x] = Name[x]
            BirthChart["Month"]![x] = Month[x]
            BirthChart["Day"]![x] = String(Day[x])
            BirthChart["Year"]![x] = String(Year[x])
            
            if(UTCTime[x] >= (24*4)){
                birthChartInUTC = getNextDayChart(month: MonthNumber[x], day: Day[x], year: Year[x])
                var nextDay:Array<Int> = getNextDay(month: MonthNumber[x], day: Day[x], year: Year[x])
                compareChart = getBirthChart(monthNumber: nextDay[0], day: nextDay[1], year: nextDay[2])
                UTCTime[x] = 96 - UTCTime[x]
            } else if (UTCTime[x] >= 0){
                birthChartInUTC = getBirthChart(monthNumber: MonthNumber[x], day: Day[x], year: Year[x])
                compareChart = getNextDayChart(month: MonthNumber[x], day: Day[x], year: Year[x])
            } else{
                birthChartInUTC = getPreviousDayChart(month: MonthNumber[x], day: Day[x], year: Year[x])
                compareChart = getBirthChart(monthNumber: MonthNumber[x], day: Day[x], year: Year[x])
                UTCTime[x] = 96 + UTCTime[x]
            }
            print(x)
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
            
            /*
        
            
        
           
            // chart.text = birthChartInUTC
            
            
        */
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
        if(chineseMonth < month && month <= 2){ // chinese sign hasnt changed
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField == firstPersonDayTextField){
            let currentText = firstPersonDayTextField.text ?? ""
            guard let stringRange = Range(range, in:currentText) else {
                return false
            }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            return updatedText.count <= 2
        }else if(textField == firstPersonYearTextField){
            let currentText = firstPersonYearTextField.text ?? ""
            guard let stringRange = Range(range, in:currentText) else {
                return false
            }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            return updatedText.count <= 4
            
        }else if(textField == firstPersonHourTextField){
            let currentText = firstPersonHourTextField.text ?? ""
            guard let stringRange = Range(range, in:currentText) else {
                return false
            }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            return updatedText.count <= 2
            
        }else if(textField == secondPersonDayTextField){
            let currentText = secondPersonDayTextField.text ?? ""
            guard let stringRange = Range(range, in:currentText) else {
                return false
            }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            return updatedText.count <= 2
        }else if(textField == secondPersonYearTextField){
            let currentText = secondPersonYearTextField.text ?? ""
            guard let stringRange = Range(range, in:currentText) else {
                return false
            }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            return updatedText.count <= 4
            
        }else if(textField == secondPersonHourTextField){
            let currentText = secondPersonHourTextField.text ?? ""
            guard let stringRange = Range(range, in:currentText) else {
                return false
            }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            return updatedText.count <= 2
            
        }else{
            return true
        }
       
    }
    
    @IBAction func firstPersonDay(_ sender: Any) {
        print((sender as AnyObject).text!)
        var day: Int
        if(firstPersonMonthTextField.text! == "January" || firstPersonMonthTextField.text! == "March" || firstPersonMonthTextField.text! == "May" || firstPersonMonthTextField.text! == "July" || firstPersonMonthTextField.text! == "August" || firstPersonMonthTextField.text! == "October" || firstPersonMonthTextField.text! == "December"){
            day = 31
        }else if(firstPersonMonthTextField.text! == "April" || firstPersonMonthTextField.text! == "June" || firstPersonMonthTextField.text! == "September" || firstPersonMonthTextField.text! == "November"){
            day = 30
        }else{
            if((Int(firstPersonYearTextField.text!) ?? 1) % 4 == 0){
                if(Int(firstPersonYearTextField.text!)! % 400 != 0 && Int(firstPersonYearTextField.text!)! % 100 == 0){
                    day = 28
                }
                else{
                    day = 29
                }
            }else{
                day = 28
            }
        }
        if((Int(firstPersonDayTextField.text!) ?? 1) > day || (Int(firstPersonDayTextField.text!) ?? -1) < 0){
            print("eroor")
        }else{
            checkList[2] = true
            checkCheckList(array: checkList)
        }
    }
    @IBAction func firstPersonYear(_ sender: Any) {
        if((Int(firstPersonYearTextField.text!) ?? 1) > 2020 || (Int(firstPersonYearTextField.text!) ?? -1) <= 1900){
            print("eroor")
        }else{
            checkList[3] = true
            checkCheckList(array: checkList)
        }
    }
    
    @IBAction func firstPersonHour(_ sender: Any) {
        if((Int(firstPersonHourTextField.text!) ?? 1) > 12 || (Int(firstPersonHourTextField.text!) ?? -1) < 1){
            print("eroor")
        }else{
            checkList[4] = true
            checkCheckList(array: checkList)
        }
    }
    
    @IBAction func secondPersonDay(_ sender: Any) {
        print((sender as AnyObject).text!)
        var day: Int
        if(secondPersonMonthTextField.text! == "January" || secondPersonMonthTextField.text! == "March" || secondPersonMonthTextField.text! == "May" || secondPersonMonthTextField.text! == "July" || secondPersonMonthTextField.text! == "August" || secondPersonMonthTextField.text! == "October" || secondPersonMonthTextField.text! == "December"){
            day = 31
        }else if(secondPersonMonthTextField.text! == "April" || secondPersonMonthTextField.text! == "June" || secondPersonMonthTextField.text! == "September" || secondPersonMonthTextField.text! == "November"){
            day = 30
        }else{
            if((Int(secondPersonYearTextField.text!) ?? 1) % 4 == 0){
                if(Int(secondPersonYearTextField.text!)! % 400 != 0 && Int(secondPersonYearTextField.text!)! % 100 == 0){
                    day = 28
                }
                else{
                    day = 29
                }
            }else{
                day = 28
            }
        }
        if((Int(secondPersonDayTextField.text!) ?? 1) > day || (Int(secondPersonDayTextField.text!) ?? -1) < 0){
            print("eroor")
        }else{
            checkList[9] = true
            checkCheckList(array: checkList)
        }
    }
    
    @IBAction func secondPersonYear(_ sender: Any) {
        if((Int(secondPersonYearTextField.text!) ?? 1) > 2020 || (Int(secondPersonYearTextField.text!) ?? -1) <= 1900){
            print("eroor")
        }else{
            checkList[10] = true
            checkCheckList(array: checkList)
        }
    }
    
    @IBAction func secondPersonHour(_ sender: Any) {
        if((Int(secondPersonHourTextField.text!) ?? -1) > 12 || (Int(secondPersonHourTextField.text!) ?? -1) < 1){
            print("eroor")
        }else{
            checkList[11] = true
            checkCheckList(array: checkList)
        }
    }
    
    //Enable Calculate button when all inputs are valid
    func checkCheckList(array:[Bool]) -> Int{
        for x in array{
            if(x == false){
                return 0
            }
        }
        CalculateButton.isEnabled = true
        return 0
    }
}
    
    
    
    /*
    @IBOutlet weak var firstPerson: UIPickerView!
    @IBOutlet weak var firsthourTextField: UITextField!
    @IBOutlet weak var firstminuteTextField: UITextField!
    @IBOutlet weak var secondPerson: UIPickerView!
    @IBOutlet weak var secondhourTextField: UITextField!
    @IBOutlet weak var secondminuteTextField: UITextField!
    
    let firsthourPicker = UIPickerView()
    let firstminutePicker = UIPickerView()
    let secondhourPicker = UIPickerView()
    let secondminutePicker = UIPickerView()
    var firstlocalHour = 0
    var firstlocalMinute = 0
    var firsttimeZoneDifference = 0
    var secondlocalHour = 0
    var secondlocalMinute = 0
    var secondtimeZoneDifference = 0
    let hour = [Int](arrayLiteral: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
    let minutes = [String](arrayLiteral: "00am", "15am", "30am", "45am", "00pm", "15pm", "30pm", "45pm")
    let get24TimeZonelocation: Dictionary = ["UTC": 0, "": 4]
    let signs = ["AR", "TA", "GE", "CN", "LE", "VI", "LI", "SC", "SG", "CP", "AQ", "PI"]
    var month:[String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var day:[String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    var year:[String] = ["1900", "1901", "1902", "1903", "1904", "1905", "1906", "1907", "1908", "1909",
                         "1910", "1911", "1912", "1913", "1914", "1915", "1916", "1917", "1918", "1919",
                         "1920", "1921", "1922", "1923", "1924", "1925", "1926", "1927", "1928", "1929",
                         "1930", "1931", "1932", "1933", "1934", "1935", "1936", "1937", "1938", "1939",
                         "1940", "1941", "1942", "1943", "1944", "1945", "1946", "1947", "1948", "1949",
                         "1950", "1951", "1952", "1953", "1954", "1955", "1956", "1957", "1958", "1959",
                         "1960", "1961", "1962", "1963", "1964", "1965", "1966", "1967", "1968", "1969",
                         "1970", "1971", "1972", "1973", "1974", "1975", "1976", "1977", "1978", "1979",
                         "1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988", "1989",
                         "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999",
                         "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009",
                         "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019",
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firsthourTextField.inputView = firsthourPicker
        firstminuteTextField.inputView = firstminutePicker
        secondhourTextField.inputView = secondhourPicker
        secondminuteTextField.inputView = secondminutePicker
        //print(TimeZone.abbreviationDictionary.count)
       // print(TimeZone.knownTimeZoneIdentifiers)
        self.firstPerson.delegate = self
        self.firstPerson.dataSource = self
        firsthourPicker.delegate = self
        firstminutePicker.delegate = self
        secondhourPicker.delegate = self
        secondminutePicker.delegate = self
        firsthourTextField.text = String(12)
        firstminuteTextField.text = "00am"
        secondhourTextField.text = String(12)
        secondminuteTextField.text = "00am"
        //init toolbar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        //create left side empty space so that done button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        //setting toolbar as inputAccessoryView
        self.firsthourTextField.inputAccessoryView = toolbar
        self.firstminuteTextField.inputAccessoryView = toolbar
        self.secondhourTextField.inputAccessoryView = toolbar
        self.secondminuteTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    func timeZonePicker(_ timeZonePicker: TimeZonePickerViewController, didSelectTimeZone timeZone: TimeZone) {
        let timeZoneValue: Int = timeZone.secondsFromGMT()/3600
        firsttimeZoneDifference = timeZoneValue
        timeZonePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func getLocation(_ sender: Any) {
        let timeZonePicker = TimeZonePickerViewController.getVC(withDelegate: self)
        present(timeZonePicker, animated: true, completion: nil)
    }
    
    @IBAction func getSecondLocation(_ sender: Any) {
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if(pickerView == firstPerson){
          return 3
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == firstPerson){
            if(component == 0){
                    firstPerson.reloadComponent(1)
            }
            if(component == 2){
                firstPerson.reloadComponent(1)
            }
        }
        if (pickerView == firsthourPicker){
            firsthourTextField.text = String(hour[row])
            firstlocalHour = row + 1
        }
        if (pickerView == firstminutePicker) {
            firstminuteTextField.text = String(minutes[row])
        }
        if (pickerView == secondhourPicker){
            secondhourTextField.text = String(hour[row])
            secondlocalHour = row + 1
        }
        if (pickerView == secondminutePicker) {
            secondminuteTextField.text = String(minutes[row])
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == firstPerson){
            if (component == 0){
                return 12
            } else if (component == 1){ // 31 days month
                if(firstPerson.selectedRow(inComponent: 0) == 0 || firstPerson.selectedRow(inComponent: 0) == 2 || firstPerson.selectedRow(inComponent: 0) == 4 || firstPerson.selectedRow(inComponent: 0) == 6 || firstPerson.selectedRow(inComponent: 0) == 7 || firstPerson.selectedRow(inComponent: 0) == 9 || firstPerson.selectedRow(inComponent: 0) == 11){
                    return 31
                }else if(firstPerson.selectedRow(inComponent: 0) == 3 || firstPerson.selectedRow(inComponent: 0) == 5 || firstPerson.selectedRow(inComponent: 0) == 8 || firstPerson.selectedRow(inComponent: 0) == 10) {
                    return 30
                }else if (firstPerson.selectedRow(inComponent: 0) == 1){
                    if((firstPerson.selectedRow(inComponent: 2)+1900) % 4 == 0){
                        if((firstPerson.selectedRow(inComponent: 2)+1900) % 400 != 0 && (firstPerson.selectedRow(inComponent: 2)+1900) % 100 == 0){
                            return 28
                        }
                        else{
                            return 29
                        }
                    }else{
                        return 28
                    }
                }
            }else if (component == 2){
                return year.count
            }
        }
        else if (pickerView == firsthourPicker){
            return hour.count
        } else if (pickerView == firstminutePicker){
            return minutes.count
        }
        if(pickerView == secondPerson){
            if (component == 0){
                return 12
            } else if (component == 1){ // 31 days month
                if(secondPerson.selectedRow(inComponent: 0) == 0 || secondPerson.selectedRow(inComponent: 0) == 2 || secondPerson.selectedRow(inComponent: 0) == 4 || secondPerson.selectedRow(inComponent: 0) == 6 || secondPerson.selectedRow(inComponent: 0) == 7 || secondPerson.selectedRow(inComponent: 0) == 9 || secondPerson.selectedRow(inComponent: 0) == 11){
                    return 31
                }else if(secondPerson.selectedRow(inComponent: 0) == 3 || secondPerson.selectedRow(inComponent: 0) == 5 || secondPerson.selectedRow(inComponent: 0) == 8 || secondPerson.selectedRow(inComponent: 0) == 10) {
                    return 30
                }else if (secondPerson.selectedRow(inComponent: 0) == 1){
                    if((secondPerson.selectedRow(inComponent: 2)+1900) % 4 == 0){
                        if((secondPerson.selectedRow(inComponent: 2)+1900) % 400 != 0 && (secondPerson.selectedRow(inComponent: 2)+1900) % 100 == 0){
                            return 28
                        }
                        else{
                            return 29
                        }
                    }else{
                        return 28
                    }
                }
            }else if (component == 2){
                return year.count
            }
        }
        else if (pickerView == secondhourPicker){
            return hour.count
        } else if (pickerView == secondminutePicker){
            return minutes.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == firstPerson){
            if(component == 0){
                return month[row]
            } else if(component == 1){
                if(firstPerson.selectedRow(inComponent: 0) == 0 || firstPerson.selectedRow(inComponent: 0) == 2 || firstPerson.selectedRow(inComponent: 0) == 4 || firstPerson.selectedRow(inComponent: 0) == 6 || firstPerson.selectedRow(inComponent: 0) == 7 ||
                    firstPerson.selectedRow(inComponent: 0) == 9 || firstPerson.selectedRow(inComponent: 0) == 11){
                    return day[row]
                }else if (firstPerson.selectedRow(inComponent: 0) == 3 || firstPerson.selectedRow(inComponent: 0) == 5 || firstPerson.selectedRow(inComponent: 0) == 8 || firstPerson.selectedRow(inComponent: 0) == 10) {
                    return day[row]
                } else if(firstPerson.selectedRow(inComponent: 0) == 1){
                    return day[row]
                }
            } else if(component == 2){
                return year[row]
            }
        } else if(pickerView == firsthourPicker) {
            return String(hour[row])
        } else if (pickerView == firstminutePicker) {
            return String(minutes[row])
        }else if(pickerView == secondPerson){
            if(component == 0){
                return month[row]
            } else if(component == 1){
                if(secondPerson.selectedRow(inComponent: 0) == 0 || secondPerson.selectedRow(inComponent: 0) == 2 || secondPerson.selectedRow(inComponent: 0) == 4 || secondPerson.selectedRow(inComponent: 0) == 6 || secondPerson.selectedRow(inComponent: 0) == 7 ||
                    secondPerson.selectedRow(inComponent: 0) == 9 || secondPerson.selectedRow(inComponent: 0) == 11){
                    return day[row]
                }else if (secondPerson.selectedRow(inComponent: 0) == 3 || secondPerson.selectedRow(inComponent: 0) == 5 || secondPerson.selectedRow(inComponent: 0) == 8 || secondPerson.selectedRow(inComponent: 0) == 10) {
                    return day[row]
                } else if(secondPerson.selectedRow(inComponent: 0) == 1){
                    return day[row]
                }
            } else if(component == 2){
                return year[row]
            }
        } else if(pickerView == secondhourPicker) {
            return String(hour[row])
        } else if (pickerView == secondminutePicker) {
            return String(minutes[row])
        }
        return ""
    }
    func getNextDay(month: Int32, day: Int32, year: Int32) -> Array<Int32> {
        var nextDay:Array<Int32>?
        if(month == 11){
            if(day == 31){
                nextDay = [1, 1, year+1]
            }else{
                nextDay = [11, day+1, year]
            }
        } else if(month == 0 || month == 2 || month == 4 || month == 6 || month == 7 ||  month == 9){
            if(day == 31) {
                nextDay = [month+1, 1, year]
            }else{
                nextDay = [month, day+1, year]
            }
        } else if(month == 3 || month == 5 || month == 8 || month == 10){
            if(day == 30) {
                nextDay = [month+1, 1, year]
            }else{
                nextDay = [month, day+1, year]
            }
        } else if(month == 1){
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
   
    func getUTC(timeZoneDifference: Int, textField:UITextField, localHour:Int ) -> Int {
        var UTCTime:Int = 0                     // Ex: Australia time 2am => UTCTime = -5 UTC
        var UTCHour:Int
        var UTCMinute:Int
        let dayNight:String = textField.text!
        let dayNightStart = dayNight.index(dayNight.startIndex, offsetBy: 2)
        let dayNightEnd = dayNight.index(dayNight.endIndex, offsetBy: 0)
        let Range = dayNightStart..<dayNightEnd
        let minuteStart = dayNight.index(dayNight.startIndex, offsetBy: 0)
        let minuteEnd = dayNight.index(dayNight.endIndex, offsetBy: -2)
        let minuteRange = minuteStart..<minuteEnd
        if(dayNight[Range] == "pm" ){
            if(localHour == 12){
                UTCHour = localHour
            }else{
                UTCHour = localHour + 12
            }
        }else{
            if(localHour == 12){
                UTCHour = 0
            }else{
                UTCHour = localHour
            }
        }
        if(dayNight[minuteRange] == "00"){
            UTCMinute = 0
        } else if (dayNight[minuteRange] == "15"){
            UTCMinute = 1
        } else if (dayNight[minuteRange] == "30"){
            UTCMinute = 2
        } else {
            UTCMinute = 3
        }
        UTCTime = ((UTCHour - timeZoneDifference) * 4) + UTCMinute  // Ex: houston time 2 am => UTCTime = 7 UTC
        return UTCTime      // 0 through 96 interval                // Ex: houston time 10pm => UTCTime = 27 UTC
    }
    
    @IBAction func calculateChart(_ sender: Any) {
        var UTCTime = getUTC(timeZoneDifference: firsttimeZoneDifference, textField: firstminuteTextField, localHour: firstlocalHour)
        print("utc time", (UTCTime/4))
        let month = Int32(firstPerson.selectedRow(inComponent: 0))
        let day = Int32(firstPerson.selectedRow(inComponent: 1))+1
        let year = Int32(firstPerson.selectedRow(inComponent: 2))+1900
        var compareChart: String
        var birthChartInUTC: String
        if(UTCTime >= (24*4)){
            birthChartInUTC = getNextDayChart(month: month, day: day, year: year)
            var nextDay:Array<Int32> = getNextDay(month: month, day: day, year: year)
            compareChart = String(cString: getBirthChart(nextDay[0], nextDay[1], nextDay[2]))
            UTCTime = 96 - UTCTime
        } else if (UTCTime >= 0){
            birthChartInUTC = String(cString: getBirthChart(month, day, year))
            compareChart = getNextDayChart(month: month, day: day, year: year)
      
        } else{
            birthChartInUTC = getPreviousDayChart(month: month, day: day, year: year)
            compareChart = String(cString: getBirthChart(month, day, year))
            UTCTime = 96 + UTCTime
        }
        
        let sunSign = String(cString: getSun(strdup(birthChartInUTC)))
        let compareDaySunSign = String(cString: getSun(strdup(compareChart)))
        let sunRate = getRate(Dif: degreeDifference(planet1: sunSign, planet2: compareDaySunSign))
        let sunAtBirth = planetAtBirth(rate: sunRate, time: UTCTime, planet: sunSign)
        let correctSun = addto(position: sunAtBirth, add: 3)
        print("sunAtBirth", correctSun)
        
        let moonSign = String(cString: getMoon(strdup(birthChartInUTC)))
        let compareDayMoonSign = String(cString: getMoon(strdup(compareChart)))
        let moonRate = getRate(Dif: degreeDifference(planet1: moonSign, planet2: compareDayMoonSign))
        let moonAtBirth = planetAtBirth(rate: moonRate, time: UTCTime, planet: moonSign)
        let correctMoon = addto(position: moonAtBirth, add: 38)
        print("moonAtBirth", correctMoon)
        
        let mercurySign = String(cString: getMercury(strdup(birthChartInUTC)))
        let compareDayMercurySign = String(cString: getMercury(strdup(compareChart)))
        let mercuryRate = getRate(Dif: degreeDifference(planet1: mercurySign, planet2: compareDayMercurySign))
        let mercuryAtBirth = planetAtBirth(rate: mercuryRate, time: UTCTime, planet: mercurySign)
        let correctMercury = addto(position: mercuryAtBirth, add: 4)
        print("mercuryAtBirth", correctMercury)
        
        let venusSign = String(cString: getVenus(strdup(birthChartInUTC)))
        let compareDayVenusSign = String(cString: getVenus(strdup(compareChart)))
        let venusRate = getRate(Dif: degreeDifference(planet1: venusSign, planet2: compareDayVenusSign))
        let venusAtBirth = planetAtBirth(rate: venusRate, time: UTCTime, planet: venusSign)
        let correctVenus = addto(position: venusAtBirth, add: 3)
        print("venusAtBirth", correctVenus)
        
        let marsSign = String(cString: getMars(strdup(birthChartInUTC)))
        let compareDayMarsSign = String(cString: getMars(strdup(compareChart)))
        let marsRate = getRate(Dif: degreeDifference(planet1: marsSign, planet2: compareDayMarsSign))
        let marsAtBirth = planetAtBirth(rate: marsRate, time: UTCTime, planet: marsSign)
        let correctMars = addto(position: marsAtBirth, add: 1)
        print("marsAtBirth", correctMars)
        
        let jupiterSign = String(cString: getJupiter(strdup(birthChartInUTC)))
        let compareDayJupiterSign = String(cString: getJupiter(strdup(compareChart)))
        let jupiterRate = getRate(Dif: degreeDifference(planet1: jupiterSign, planet2: compareDayJupiterSign))
        let jupiterAtBirth = planetAtBirth(rate: jupiterRate, time: UTCTime, planet: jupiterSign)
        let correctJupiter = addto(position: jupiterAtBirth, add: 1)
        print("jupiterAtBirth", correctJupiter)
        
        let saturnSign = String(cString: getSaturn(strdup(birthChartInUTC)))
        let compareDaySaturnSign = String(cString: getSaturn(strdup(compareChart)))
        let saturnRate = getRate(Dif: degreeDifference(planet1: saturnSign, planet2: compareDaySaturnSign))
        let saturnAtBirth = planetAtBirth(rate: saturnRate, time: UTCTime, planet: saturnSign)
        let correctSaturn = addto(position: saturnAtBirth, add: 1)
        print("saturnAtBirth", correctSaturn)
        
        let uranusSign = String(cString: getUranus(strdup(birthChartInUTC)))
        let compareDayUranusSign = String(cString: getUranus(strdup(compareChart)))
        let uranusRate = getRate(Dif: degreeDifference(planet1: uranusSign, planet2: compareDayUranusSign))
        let uranusAtBirth = planetAtBirth(rate: uranusRate, time: UTCTime, planet: uranusSign)
        let correctUranus = addto(position: uranusAtBirth, add: 1)
        print("uranusAtBirth", correctUranus)
        
        let neptuneSign = String(cString: getNeptune(strdup(birthChartInUTC)))
        let compareDayNeptuneSign = String(cString: getNeptune(strdup(compareChart)))
        let neptuneRate = getRate(Dif: degreeDifference(planet1: neptuneSign, planet2: compareDayNeptuneSign))
        let neptuneAtBirth = planetAtBirth(rate: neptuneRate, time: UTCTime, planet: neptuneSign)
        let correctNeptune = addto(position: neptuneAtBirth, add: 1)
        print("neptuneAtBirth", correctNeptune)
        
        let plutoSign = String(cString: getPluto(strdup(birthChartInUTC)))
        let compareDayPlutoSign = String(cString: getPluto(strdup(compareChart)))
        let plutoRate = getRate(Dif: degreeDifference(planet1: plutoSign, planet2: compareDayPlutoSign))
        let plutoAtBirth = planetAtBirth(rate: plutoRate, time: UTCTime, planet: plutoSign)
        let correctPluto = addto(position: plutoAtBirth, add: 1)
        print("plutoAtBirth", correctPluto)
       // chart.text = birthChartInUTC
  
    }
    
    func getPreviousDayChart(month: Int32, day: Int32, year:Int32) -> String {
        var previousDay: String?
        if(month == 0){
            if(day == 1){
                previousDay = String(cString: getBirthChart(11, 31, year-1))
            }else{
                previousDay = String(cString: getBirthChart(month, day-1, year))
            }
        } else if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 ||  month == 10){
            if(day == 1) {
                previousDay = String(cString: getBirthChart(month-1, 31, year))
            }else{
                previousDay = String(cString: getBirthChart(month, day-1, year))
            }
        } else if(month == 4 || month == 6 || month == 9 || month == 11){
            if(day == 1) {
                previousDay = String(cString: getBirthChart(month-1, 30, year))
            }else{
                previousDay = String(cString: getBirthChart(month, day-1, year))
            }
        } else if(month == 2){
            if(year % 4 == 0){
                if(day == 1){
                    previousDay = String(cString: getBirthChart(month-1, 29, year))
                }else{
                    previousDay = String(cString: getBirthChart(month, day-1, year))
                }
            } else {
                if(day == 1){
                    previousDay = String(cString: getBirthChart(month-1, 28, year))
                }else{
                    previousDay = String(cString: getBirthChart(month, day-1, year))
                }
            }
        }
        return previousDay!
    }
    
    func getNextDayChart(month: Int32, day: Int32, year: Int32) -> String {
        var nextDay: String?
        if(month == 11){
            if(day == 31){
                nextDay = String(cString: getBirthChart(0, 1, year+1))
            }else{
                nextDay = String(cString: getBirthChart(month, day+1, year))
            }
        } else if(month == 0 || month == 2 || month == 4 || month == 6 || month == 7 ||  month == 9){
            if(day == 31) {
                nextDay = String(cString: getBirthChart(month+1, 1, year))
            }else{
                nextDay = String(cString: getBirthChart(month, day+1, year))
            }
        } else if(month == 3 || month == 5 || month == 8 || month == 10){
            if(day == 30) {
                nextDay = String(cString: getBirthChart(month+1, 1, year))
            }else{
                nextDay = String(cString: getBirthChart(month, day+1, year))
            }
        } else if(month == 1){
            if(year % 4 == 0){
                if(day == 29){
                    nextDay = String(cString: getBirthChart(month+1, 1, year))
                }else{
                    nextDay = String(cString: getBirthChart(month, day+1, year))
                }
            } else {
                if(day == 28){
                    nextDay = String(cString: getBirthChart(month+1, 1, year))
                }else{
                    nextDay = String(cString: getBirthChart(month, day+1, year))
                }
            }
        }
        return nextDay!
    }
    
    func planetAtBirth(rate: Float, time:Int, planet: String) -> String {
        var realPlanet:String = ""
        let signStart = planet.index(planet.startIndex, offsetBy: 0)
        let signEnd = planet.index(planet.endIndex, offsetBy: -4)
        let signRange = signStart..<signEnd
        var sign = String(planet[signRange])
        
        let degreeStart = planet.index(planet.startIndex, offsetBy: 2)
        let degreeEnd = planet.index(planet.endIndex, offsetBy: -2)
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
                if (s == sign){
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
        let degreeStart = planet1.index(planet1.startIndex, offsetBy: 2)
        let degreeEnd = planet1.index(planet1.endIndex, offsetBy: -2)
        let degreeRange = degreeStart..<degreeEnd
        let minuteStart = planet1.index(planet1.startIndex, offsetBy: 4)
        let minuteEnd = planet1.index(planet1.endIndex, offsetBy: 0)
        let minuteRange = minuteStart..<minuteEnd
        let signStart = planet1.index(planet1.startIndex, offsetBy: 0)
        let signEnd = planet1.index(planet1.endIndex, offsetBy: -4)
        let signRange = signStart..<signEnd
        let planet1Degree = Int(planet1[degreeRange])!
        let planet2Degree = Int(planet2[degreeRange])!
        let planet1Minute = Int(planet1[minuteRange])!
        let planet2Minute = Int(planet2[minuteRange])!
        let planet1Sign = planet1[signRange]
        let planet2Sign = planet2[signRange]
        let totalMinutePlanet1 = (planet1Degree * 60) + planet1Minute
        let totalMinutePlanet2 = (planet2Degree * 60) + planet2Minute
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
        
        return Dif
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
        var rate = minutes / 96
        if(Dif.first == "-"){
            rate = -rate
        }
        return rate // in minutes per 15 minutes
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
    */
    

