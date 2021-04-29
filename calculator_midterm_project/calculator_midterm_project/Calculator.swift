//
//  Calculator.swift
//  calculator_midterm_project
//
//  Created by Guyleaf on 2021/4/29.
//

import Foundation

class Calculator {
    private var steps: Array<String>;
    private var number: String;
    private var negative: Bool;
    private var formula: String {
        get {
            var result: String = "";
            for step in steps {
                result += step;
                result += " ";
            }

            return result;
        }
    }
    private var result: Double {
        get {
            let steps: Array<String> = self.steps;

            while let index = self.steps.firstIndex(of: "%") {
                let left = Double(self.steps[index-1])!;
                let right = Double(self.steps[index+1])!;
                self.steps.insert(
                    String(
                        left.truncatingRemainder(dividingBy: right)),
                    at: index-1);
                self.steps.removeSubrange(index...index+2);
            }
            
            var formula = self.formula
                .replacingOccurrences(of: "÷", with: "/")
                .replacingOccurrences(of: "x", with: "*");
            
            /* convert all integers to double */
            var tmp = formula.split(separator: " ");

            for i in tmp.indices {
                tmp[i] = Double(tmp[i]) != nil ? String.SubSequence(String(Double(tmp[i])!)) : tmp[i];
            }

            formula = tmp.joined(separator: " ");
            /* end */

            let result = NSExpression(format: formula)
                .expressionValue(with: nil, context: nil) as? Double;

            // restore original steps to avoid '%' disappeared
            self.steps = steps;
            return result != nil && result!.isFinite ? result! : 0.0;
        }
    }
    
    private func isNumberValid() -> Bool {
        return Double(self.number) != nil ? true : false;
    }

    private func checkLastStepIsNumber() -> Bool {
        return Double(self.steps.last!) != nil ? true : false;
    }
    
    private func addLastNumber() {
        // store the number that is in tmp first
        let number: Double = Double(self.number)!;
        if number == Double(Int(number)) {
            self.steps.append(String(Int(number)));
        }
        else {
            self.steps.append(String(number));
        }
    }

    public func operate(input: String) {
        if self.steps.last != nil && (self.steps.last! == "=" || self.steps.last! == "0") {
            self.steps.removeAll();
        }
        
        if self.number.isEmpty {
            self.number = "0";
        }

        if self.isNumberValid() {
            if self.steps.count > 0 && !self.checkLastStepIsNumber() {
                self.steps.removeLast();
                self.steps.append(input);
                return;
            }
            
            self.addLastNumber();
            
            self.number = "";

            if self.checkLastStepIsNumber() {
                self.steps.append(input);
            }
        }
    }

    public func chooseNumber(input: String) {
        if (input == "." && self.number.last != nil && self.number.contains(".")) {
            return;
        }
        
        if input == "." && self.number.isEmpty {
            self.number = "0";
        }

        self.number += input;
    }

    public func inverseNumber() {
        if self.steps.last != nil && (self.steps.last! == "=" || self.steps.last! == "0") {
            self.steps.removeAll();
        }
        if self.number.isEmpty {
            self.number = "0";
        }
        
        self.steps.append("±(\(self.number))");

        if self.negative {
            self.number.removeFirst();
        }
        else {
            self.number.insert("-", at: self.number.startIndex);
        }

        self.negative = !self.negative;
        self.steps.append("=");
    }

    public func calculate() -> Double {
        if self.steps.last != nil && (self.steps.last! == "=" || self.steps.last! == "0") {
            self.steps.removeAll();
        }
        
        if self.number.isEmpty {
            self.number = "0";
        }

        if self.isNumberValid() {
            self.addLastNumber();
        }

        var result = self.result;
        
        if result == Double(Int(result)) {
            self.number = String(Int(result));
        }
        else {
            self.number = String(result);
        }
        
        let formatter = NumberFormatter();
        formatter.maximumFractionDigits = 8;

        result = Double(formatter.string(from: NSNumber(value: result))!)!;

        self.steps.append("=");
        print("Formula: \(self.formula)");
        print("Result: \(result)");
        return result;
    }

    public func getFormula() -> String {
        return self.formula;
    }
    
    public func getLastNumber() -> String {
        return self.number.isEmpty ? "0" : self.number;
    }
    
    public func reset() {
        self.steps.removeAll();
        self.steps.append("0");
        self.number = "";
    }

    init() {
        self.steps = Array();
        self.number = "";
        self.negative = false;
    }
}
