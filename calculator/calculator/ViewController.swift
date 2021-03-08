//
//  ViewController.swift
//  calculator
//
//  Created by Guyleaf on 2021/3/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private var total: Float = 0;
    @IBOutlet weak var result: UILabel!
    @IBAction func number(_ sender: UIButton) {
        let inputNumber = sender.titleLabel?.text;
        total = total + Float(inputNumber!)!;
        if result.text != nil {
            if result.text == "0" {
                result.text = inputNumber!;
            }
            else {
                result.text = result.text! + inputNumber!;
            }
        }
    }
}

