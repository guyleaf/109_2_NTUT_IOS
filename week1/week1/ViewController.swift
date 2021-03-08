//
//  ViewController.swift
//  week1
//
//  Created by Guyleaf on 2021/2/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func calculate(_ sender: Any) {
        if (self.height.text == "" || self.weight.text == "") {
            return
        }
        
        let _height:Double = Double(self.height.text!)! / 100.0
        let _weight:Double = Double(self.weight.text!)!
        let _bmi = _weight / (pow(_height, 2.0))
        
        self.result.text = String(format: "%.2f", _bmi)
        
        if (_bmi < 18.5) {
            self.resultLabel.text = "體重過輕"
        }
        else if (_bmi > 24) {
            self.resultLabel.text = "體重過重"
        }
        else {
            self.resultLabel.text = "體重標準"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.button.layer.cornerRadius = 10
        self.button.layer.borderWidth = 2
    }


}

