//
//  ViewController.swift
//  calculator_midterm_project
//
//  Created by Guyleaf on 2021/4/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var buttons: [UIButton]!;
    @IBOutlet weak var resultLabel: UILabel!;
    @IBOutlet weak var formulaLabel: UILabel!;
    
    private var calculator: Calculator = Calculator();
    private var result: String = "";
    private var formula: String = "";

    func buttonStyleSetup(button: UIButton) -> Void {
        button.layer.borderWidth = CGFloat(1.0);
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttons.forEach(buttonStyleSetup);
        
        result = "0";
        updateView();
    }

    @IBAction func clickNumber(_ sender: UIButton) {
        calculator.chooseNumber(input: sender.currentTitle!);
        
        result = calculator.getLastNumber();
        updateView();
    }

    @IBAction func clickOperaton(_ sender: UIButton) {
        calculator.operate(input: sender.currentTitle!);
        
        result = calculator.getLastNumber();
        formula = calculator.getFormula();
        updateView();
    }

    @IBAction func inverseNumber(_ sender: UIButton) {
        calculator.inverseNumber();
        
        formula = calculator.getFormula();
        result = calculator.getLastNumber();
        updateView();
    }

    @IBAction func calculate(_ sender: UIButton) {
        let tmp = calculator.calculate();

        if (tmp == Double(Int(tmp))) {
            result = String(Int(tmp));
        }
        else {
            result = String(tmp);
        }

        formula = calculator.getFormula();
        updateView();
    }

    @IBAction func reset(_ sender: UIButton) {
        calculator.reset();
        formula = calculator.getFormula();
        result = calculator.getLastNumber();
        updateView();
    }

    func updateView() {
        resultLabel.text = result;
        formulaLabel.text = formula;
    }
}
