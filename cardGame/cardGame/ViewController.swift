//
//  ViewController.swift
//  cardGame
//
//  Created by Guyleaf on 2021/3/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var flipButton: UIButton!
    @IBOutlet weak var counterDisplayer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.flipButton.layer.cornerRadius = 10;
        self.flipButton.layer.borderWidth = 0.5;
        self.counterDisplayer.text = "0";
        for (index, emoji) in self.emojis.enumerated() {
            cardButtons[index].setTitle(emoji, for: UIControl.State.normal);
        }
        
    }
    
    var emojis = ["😂", "🤣", "❤️", "😼", "🙏", "👐", "🤝", "💄"];
    var counter: Int = 0;
    var flipState: Bool = false;
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func flip(_ sender: UIButton) {
        let emoji = emojis[sender.tag];
        if (sender.currentTitle == emoji) {
            sender.backgroundColor = UIColor.red;
            sender.setTitle("", for: UIControl.State.normal);
        }
        else {
            sender.backgroundColor = UIColor.white;
            sender.setTitle(emoji, for: UIControl.State.normal);
        }
        
        counter += 1;
        self.counterDisplayer.text = String(counter);
    }
    @IBAction func flipAll(_ sender: UIButton) {
        for button in cardButtons {
            if !self.flipState && button.currentTitle == self.emojis[button.tag] {
                button.sendActions(for: .touchUpInside);
            }
            else if self.flipState && button.currentTitle != self.emojis[button.tag] {
                button.sendActions(for: .touchUpInside);
            }
        }
        flipState = !flipState;
        counter = 0;
        self.counterDisplayer.text = String(counter);
    }
}

