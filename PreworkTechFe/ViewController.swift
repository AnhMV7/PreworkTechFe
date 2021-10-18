//
//  ViewController.swift
//  PreworkTechFe
//
//  Created by Anh Vu on 10/16/21.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    
    @IBOutlet weak var oweAmountLabel: UILabel!
    @IBOutlet weak var splitAmount: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    
    @IBOutlet weak var buttonClicked: UIButton!
    
    
    @IBOutlet weak var stateSwitch: UISwitch!
    
    @IBOutlet weak var splitTipTextField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    @IBOutlet weak var splitTip: UILabel!
    
    @IBOutlet weak var amountAdjuster: UISlider!
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stateSwitch.addTarget(self, action: #selector(stateChanged), for: .valueChanged)
    }
    
    
    @IBAction func amountAdjuster(_ sender: UISlider) {
        let sender = Int(sender.value)
        label.text = "\(sender)"
        
        
        
 
    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        if stateSwitch.isOn {
            textLabel.text = "Light Mode"
            stateSwitch.setOn(false, animated: true)
            self.view.backgroundColor = UIColor.white
        } else {
            textLabel.text = "Dark Mode"
            self.view.backgroundColor = UIColor.darkGray
            stateSwitch.setOn(true, animated: true)
            
        }
    }
    
    @objc func stateChanged(switchState: UISwitch) {
        if switchState.isOn {
            textLabel.text = "Light Mode"
            self.view.backgroundColor = UIColor.white
        } else {
            textLabel.text = "Dark Mode"
            self.view.backgroundColor = UIColor.darkGray
        }
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let amountAdjuster = Double(label.text!) ?? 0
        label.text = String(format: "$.2f")
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip) * amountAdjuster
        let numberSplit = Double(splitTipTextField.text!) ?? 0
        let splitTipTotal = tip /  numberSplit
        
        
        
        splitTip.text = String(format: "$%.2f", splitTipTotal)
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    

}

