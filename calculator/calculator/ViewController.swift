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
        formula.text = "";
        result.text = "0";
    }

    private var precision: Int = 0;
    @IBOutlet weak var formula: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBAction func number(_ sender: UIButton) {
        let inputNumber = sender.titleLabel!.text!;
        let text = result.text!;
        if text != "Nan" {
            if text == "0" && text != "."{
                result.text = inputNumber;
            }
            else {
                result.text = text + inputNumber;
            }
            
            if let index = result.text!.firstIndex(of: ".") {
                let tmp = result.text![index..<result.text!.endIndex];
                precision = tmp.count > precision ? tmp.count : precision;
            }
        }
    }
    @IBAction func changeSign(_ sender: UIButton) {
        result.text = String(-Int(result.text!)!);
    }
    @IBAction func operation(_ sender: UIButton) {
        let sign: String = sender.titleLabel!.text!;
        if formula.text!.firstIndex(of: "=") != nil {
            formula.text = "";
        }
        formula.text!.append(result.text ?? "0");
        formula.text!.append(" \(sign) ");
        result.text = "0";
    }
    @IBAction func reset(_ sender: UIButton) {
        result.text = "0";
        formula.text = "";
    }
    @IBAction func calculate(_ sender: UIButton) {
        formula.text!.append(result.text!);
        var text: String = (formula.text ?? "0");
        text = text.replacingOccurrences(of: "÷", with: "/");
        text = text.replacingOccurrences(of: "x", with: "*");
        if let value = NSExpression(format: text).expressionValue(with: nil, context: nil) as? Double {
            result.text = String(format: "%.\(precision)f", value);
            formula.text!.append(" = ");
        }
        else {
            result.text = "Nan";
        }
    }
}

