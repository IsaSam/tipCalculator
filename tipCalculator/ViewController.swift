//
//  ViewController.swift
//  tipCalculator
//
//  Created by Isaac Samuel on 8/31/18.
//  Copyright © 2018 Isaac Samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            billField.text = String(format: "$%.0f", UserDefaults.standard.double(forKey: "billKey"))
            tipLabel.text = String(format: "$%.2f", UserDefaults.standard.double(forKey: "tipKey"))
            totalLabel.text = String(format: "$%.2f", UserDefaults.standard.double(forKey: "totKey"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculatedTip(_ sender: Any) {
        let tipPercentage = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        //Saving data
        let defaultsBill = UserDefaults.standard
        defaultsBill.set(bill, forKey: "billKey")
        
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        //Saving data
        let defaultsTip = UserDefaults.standard
        defaultsTip.set(tip, forKey: "tipKey")
        
        let total = bill + tip
        //Saving data
        let defaultsTot = UserDefaults.standard
        defaultsTot.set(total, forKey: "totKey")
        
        //posting data saved
        tipLabel.text = String(format: "$%.2f", defaultsTip.double(forKey: "tipKey"))
        
        //posting data saved
        totalLabel.text = String(format: "$%.2f", defaultsTot.double(forKey: "totKey"))
    }
    @IBAction func onClear(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "billKey")
        billField.text = ""

    }
    
}

