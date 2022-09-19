//
//  ViewController.swift
//  yieldv3
//
//  Created by Ryan Cosgrove on 2/10/19.
//  Copyright © 2019 Ryan Cosgrove Wool. All rights reserved.
//

import UIKit
import Foundation

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}
class ViewController: UIViewController, UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource {

    


    

    @IBOutlet weak var yieldIn: UITextField!
    
    @IBOutlet weak var vmIn: UITextField!
    
    @IBOutlet weak var hhIn: UITextField!
    
    @IBOutlet weak var yieldOut: UILabel!
    
    @IBOutlet weak var vmOut: UILabel!
    
    @IBOutlet weak var hhOut: UILabel!
    
    @IBOutlet weak var wb: UILabel!
    
    @IBOutlet weak var sdry: UILabel!
    
    @IBOutlet weak var jcsy: UILabel!
    
    @IBOutlet weak var iwtoSix: UILabel!
    
    @IBOutlet weak var iwtoSeven: UILabel!
    
    @IBOutlet weak var acy: UILabel!
    

    
    
    
    

    @IBAction func yieldBtn(_ sender: Any) {
        if yieldIn.text! == "" {
            yieldOut.text! = "0"
        } else {
        yieldOut.text! = yieldIn.text!   }
    }
    
    @IBAction func vmBtn(_ sender: Any) {
        if vmIn.text! == "" {
            vmOut.text! = "0"
        } else {
        vmOut.text! = vmIn.text!   }
    }
    
    @IBAction func hhBtn(_ sender: Any) {
        if hhIn.text! == "" {
            hhOut.text! = "0"
        } else {
        hhOut.text! = hhIn.text!   }
        
    }
    
    @IBAction func updateYields(_ sender: Any) {
// select the selected yield

        let vmDbl: Double = Double(vmOut.text!)!
        let yieldDbl: Double = Double(yieldOut.text!)!
        let hhDbl: Double = Double(hhOut.text!)!
        let pa: Double = 7.7 - (40.6 / (7.8 + vmDbl - hhDbl))
        
        if yieldSelection == "SDRY" {
            var wbFinal: Double = (yieldDbl + pa) / 1.207
            wbFinal = wbFinal.roundToDecimal((2))
            wb.text! = "\(wbFinal)"
            
            var sdryFinal: Double = (wbFinal * 1.207 - pa)
            sdryFinal = sdryFinal.roundToDecimal(2)
            sdry.text! = "\(sdryFinal)"
            
            var iwtoSixFinal: Double = (wbFinal + vmDbl) * 1.1869
            iwtoSixFinal = iwtoSixFinal.roundToDecimal(2)
            iwtoSix.text! = "\(iwtoSixFinal)"
            
            var iwtoSevenFinal: Double = (wbFinal + vmDbl) * 1.1972
            iwtoSevenFinal = iwtoSevenFinal.roundToDecimal(2)
            iwtoSeven.text! = "\(iwtoSevenFinal)"
            
            var jcsyFinal: Double = (wbFinal) * 1.177
            jcsyFinal = jcsyFinal.roundToDecimal(2)
            jcsy.text! = "\(jcsyFinal)"
            
            var acyFinal: Double = (wbFinal * 1.1972 + 0.1616 * vmDbl - 5.12)
            acyFinal = acyFinal.roundToDecimal(2)
            acy.text! = "\(acyFinal)"
            
        } else if yieldSelection == "IWTO16%" {
            var wbFinal: Double = (yieldDbl / 1.1869 - vmDbl)
            wbFinal = wbFinal.roundToDecimal((2))
            wb.text! = "\(wbFinal)"
            
            var sdryFinal: Double = (wbFinal * 1.207 - pa)
            sdryFinal = sdryFinal.roundToDecimal(2)
            sdry.text! = "\(sdryFinal)"
            
            var iwtoSixFinal: Double = (wbFinal + vmDbl) * 1.1869
            iwtoSixFinal = iwtoSixFinal.roundToDecimal(2)
            iwtoSix.text! = "\(iwtoSixFinal)"
            
            var iwtoSevenFinal: Double = (wbFinal + vmDbl) * 1.1972
            iwtoSevenFinal = iwtoSevenFinal.roundToDecimal(2)
            iwtoSeven.text! = "\(iwtoSevenFinal)"
            
            var jcsyFinal: Double = (wbFinal) * 1.177
            jcsyFinal = jcsyFinal.roundToDecimal(2)
            jcsy.text! = "\(jcsyFinal)"
            
            var acyFinal: Double = (wbFinal * 1.1972 + 0.1616 * vmDbl - 5.12)
            acyFinal = acyFinal.roundToDecimal(2)
            acy.text! = "\(acyFinal)"
        } else if yieldSelection == "IWTO17%" {
            var wbFinal: Double = (yieldDbl / 1.1972 - vmDbl)
            wbFinal = wbFinal.roundToDecimal((2))
            wb.text! = "\(wbFinal)"
            
            var sdryFinal: Double = (wbFinal * 1.207 - pa)
            sdryFinal = sdryFinal.roundToDecimal(2)
            sdry.text! = "\(sdryFinal)"
            
            var iwtoSixFinal: Double = (wbFinal + vmDbl) * 1.1869
            iwtoSixFinal = iwtoSixFinal.roundToDecimal(2)
            iwtoSix.text! = "\(iwtoSixFinal)"
            
            var iwtoSevenFinal: Double = (wbFinal + vmDbl) * 1.1972
            iwtoSevenFinal = iwtoSevenFinal.roundToDecimal(2)
            iwtoSeven.text! = "\(iwtoSevenFinal)"
            
            var jcsyFinal: Double = (wbFinal) * 1.177
            jcsyFinal = jcsyFinal.roundToDecimal(2)
            jcsy.text! = "\(jcsyFinal)"
            
            var acyFinal: Double = (wbFinal * 1.1972 + 0.1616 * vmDbl - 5.12)
            acyFinal = acyFinal.roundToDecimal(2)
            acy.text! = "\(acyFinal)"
            
        } else if yieldSelection == "JCSY" {
            var wbFinal: Double = (yieldDbl / 1.177)
            wbFinal = wbFinal.roundToDecimal((2))
            wb.text! = "\(wbFinal)"
            
            var sdryFinal: Double = (wbFinal * 1.207 - pa)
            sdryFinal = sdryFinal.roundToDecimal(2)
            sdry.text! = "\(sdryFinal)"
            
            var iwtoSixFinal: Double = (wbFinal + vmDbl) * 1.1869
            iwtoSixFinal = iwtoSixFinal.roundToDecimal(2)
            iwtoSix.text! = "\(iwtoSixFinal)"
            
            var iwtoSevenFinal: Double = (wbFinal + vmDbl) * 1.1972
            iwtoSevenFinal = iwtoSevenFinal.roundToDecimal(2)
            iwtoSeven.text! = "\(iwtoSevenFinal)"
            
            var jcsyFinal: Double = (wbFinal) * 1.177
            jcsyFinal = jcsyFinal.roundToDecimal(2)
            jcsy.text! = "\(jcsyFinal)"
            
            var acyFinal: Double = (wbFinal * 1.1972 + 0.1616 * vmDbl - 5.12)
            acyFinal = acyFinal.roundToDecimal(2)
            acy.text! = "\(acyFinal)"
        } else if yieldSelection == "ACY" {
            var wbFinal: Double = (yieldDbl + 5.12 - (0.1616 * vmDbl)) / 1.1972
            wbFinal = wbFinal.roundToDecimal((2))
            wb.text! = "\(wbFinal)"
            
            var sdryFinal: Double = (wbFinal * 1.207 - pa)
            sdryFinal = sdryFinal.roundToDecimal(2)
            sdry.text! = "\(sdryFinal)"
            
            var iwtoSixFinal: Double = (wbFinal + vmDbl) * 1.1869
            iwtoSixFinal = iwtoSixFinal.roundToDecimal(2)
            iwtoSix.text! = "\(iwtoSixFinal)"
            
            var iwtoSevenFinal: Double = (wbFinal + vmDbl) * 1.1972
            iwtoSevenFinal = iwtoSevenFinal.roundToDecimal(2)
            iwtoSeven.text! = "\(iwtoSevenFinal)"
            
            var jcsyFinal: Double = (wbFinal) * 1.177
            jcsyFinal = jcsyFinal.roundToDecimal(2)
            jcsy.text! = "\(jcsyFinal)"
            
            var acyFinal: Double = (wbFinal * 1.1972 + 0.1616 * vmDbl - 5.12)
            acyFinal = acyFinal.roundToDecimal(2)
            acy.text! = "\(acyFinal)"
        } else {

            wb.text! = "--"
            

            sdry.text! = "--"
            

            iwtoSix.text! = "--"
            

            iwtoSeven.text! = "--"
            

            jcsy.text! = "--"
            

            acy.text! = "--"
        }
            

        }

    
    @IBOutlet weak var yieldPicker: UIPickerView!
    //var yieldPickerData: [String] = [String]()
    var yieldSelection = ""
    let yieldPickerData: NSArray = ["","SDRY","IWTO16%","IWTO17%","JCSY","ACY"]
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.yieldPicker.delegate = self
        self.yieldPicker.dataSource = self
        
  
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        
    

        
        yieldSelection = ""

    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return yieldPickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(yieldPickerData[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // selected value in Uipickerview in Swift
        yieldSelection = yieldPickerData[row] as! String
    }
    

    


        
        
        
}
        
        


