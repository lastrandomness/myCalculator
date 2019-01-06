//
//  ViewController.swift
//  vzv
//
//  Created by TikTak on 12/13/18.
//  Copyright © 2018 TikTak. All rights reserved.
//

import UIKit
var g = String(0)

enum modes {
    case not_set
    case addition
    case subtraction
    case multiple
    case divide
    case mode
}
class ViewController: UIViewController {
   // var b = String()
    @IBOutlet weak var label: UILabel!
    //My variable
    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        //var x:Int
    }
   
    @IBAction func didPressMode(_ sender: Any) {
        changeModes(newMode: .mode)
        let theNum = Int(labelString)
        savedNum = theNum!/100
    
    
    currentMode = .not_set
    labelString = "\(savedNum)"
    updateText()
    lastButtonWasMode = true
    }
    @IBAction func didPressDivide(_ sender: Any) {
        changeModes(newMode: .divide)
    }
    @IBAction func didPressMultiple(_ sender: Any) {
        changeModes(newMode: .multiple )
    }
    @IBAction func didPressPlus(_ sender: Any) {
        changeModes (newMode: .addition)
    }
    
    @IBAction func didPressSubtract(_ sender: Any) {
        changeModes(newMode: .subtraction)
        
    }
    
    @IBAction func didPressEquals(_ sender: Any) {
        guard  let labelInt:Int = Int(labelString) else {
            return
        }
        
        if (currentMode == .not_set || lastButtonWasMode){
            return
        }
        if (currentMode == .addition){
            savedNum += labelInt
        } else if (currentMode == .subtraction){
            savedNum -= labelInt
        }else if (currentMode == .multiple){
            savedNum *= labelInt
        }
        else if (currentMode == .divide){
            savedNum /= labelInt
        }else if (currentMode == .mode){
            changeModes(newMode: .mode)
            savedNum = labelInt/100
        }
        
        currentMode = .not_set
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
        
    }
    
    @IBAction func didPressClear(_ sender: Any) {
        labelString = "0"
        currentMode = .not_set
        savedNum = 0
        lastButtonWasMode = false
        label.text = "0"
    }
    
    @IBAction func didPressNumber(_ sender: UIButton) {
        let stringValue:String? = sender.titleLabel?.text
        
        if(lastButtonWasMode){
            lastButtonWasMode = false
            labelString  = "0"
        }
        
        labelString = labelString.appending(stringValue!)
        updateText()
    }
    
    func updateText() {
        guard let labelInt:Int = Int(labelString) else {
            return
        }
        if (currentMode == .not_set){
            savedNum = labelInt
        }
        if (labelInt <= 999)&&(labelInt >= 0){
            label.text = "\(labelInt)"
        }else if (labelInt >= 1000)&&(labelInt <= 999999) {
            label.text = commaFirst(labelInt: labelInt)
        }
        if (labelInt >= 1000000)&&(labelInt <= 999999999){
            label.text = "\(commaSecond(labelInt: labelInt))"
        }
        if (labelInt >= 1000000000)&&(labelInt <= 999999999999){
            label.text = "\(commaThird(labelInt: labelInt))"
        }
    }
    
    func commaFirst (labelInt : Int)-> String{
        
        let l1 = labelInt / 1000
        let mode1 = labelInt % 1000
        return "\(l1),\(mode1)"
        
    }
   
    func commaSecond (labelInt : Int)-> String{
        let l2 = labelInt / 1000000
        return "\(l2),\(commaFirst(labelInt: labelInt % 1000000))"
    }
    func commaThird (labelInt : Int)-> String{
        let l3 = labelInt / 1000000000
        return "\(l3),\(commaSecond(labelInt: labelInt % 1000000000)),\(commaFirst(labelInt:labelInt % 1000000))"
    }
    
    func changeModes(newMode:modes) {
        if (savedNum == 0) {
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
    }
   //
}



