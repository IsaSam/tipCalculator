//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Isaac Samuel on 9/1/18.
//  Copyright © 2018 Isaac Samuel. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var billAmountText: UITextField!
    @IBOutlet weak var customTipLabel: UILabel!
    @IBOutlet weak var tipsResultLabel: UILabel!
    @IBOutlet weak var costResultLabel: UILabel!
    @IBOutlet weak var billAmountLabel: UILabel!
    
    
    @IBAction func customTipSlider(_ sender: UISlider) {
        customTipLabel.text = String(Int(sender.value))
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"

        //billAmountText.text = String(format: "$%.0f",UserDefaults.standard.double(forKey: "billKey"))
        
        
        
        billAmountLabel.text = String(format: "$%.0f", UserDefaults.standard.double(forKey: "billKey"))

        tipsResultLabel.text = String(format: "$%.2f", UserDefaults.standard.double(forKey: "tipKey"))
        costResultLabel.text = String(format: "$%.2f", UserDefaults.standard.double(forKey: "totKey"))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculCustomTip(_ sender: Any) {
        let customTipPercentage = Double(customTipLabel.text!) ?? 0
        //Saving data
        //let defaultsCustomTip = UserDefaults.standard
        //defaultsCustomTip.set(customTipPercentage, forKey: "costomTipKey")
        let customBill = Double(billAmountText.text!) ?? 0
        let tipsResult = customBill * (customTipPercentage/100)
        let costResult = customBill + tipsResult
        
        billAmountLabel.text = billAmountText.text
        tipsResultLabel.text = String(format: "$%.2f", tipsResult)
        costResultLabel.text = String(format: "$%.2f", costResult)
        
    }

    @IBAction func onClearSettings(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "billKey")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
