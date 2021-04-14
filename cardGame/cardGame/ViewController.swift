//
//  ViewController.swift
//  cardGame
//
//  Created by Guyleaf on 2021/3/10.
//

import UIKit

class ViewController: UIViewController {
    // lazy variable dont have observers
    lazy var game = MatchingGame(numberOfPairsOfCards: (cardButtons.count + 1) / 2);
    
    var emojis = ["😂", "🤣", "❤️", "😼", "🙏", "👐", "🤝", "💄", "👤", "🏃🏽", "👬", "💅", "🥂", "🍻", "🧂", "🍭"];
    var emojiDict: Dictionary<Card, String> = [Card:String]();

    var flipState: Bool = false;

    @IBOutlet weak var flipButton: UIButton!
    @IBOutlet weak var counterDisplayer: UILabel!
    @IBOutlet weak var scoreDisplayer: UILabel!
    @IBOutlet var cardButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.flipButton.layer.cornerRadius = 10;
        self.flipButton.layer.borderWidth = 0.5;
        self.counterDisplayer.text = "0";
        self.updateViewFromModel();
    }

    @IBAction func flip(_ sender: UIButton) {
        let index = cardButtons.firstIndex(of: sender);
        print("cardNumber = \(String(describing: index!))");

        self.game.chooseCard(at: index!);

        self.updateViewFromModel();
    }

    @IBAction func flipAll(_ sender: UIButton) {
        if self.game.isAllCardsSameState(state: !flipState) {
            flipState = !flipState;
        }
        self.game.flipAll(state: flipState);
        self.updateViewFromModel();
        flipState = !flipState;
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index];
            let card = game.getCard(at: index);
            if card.isFaceUp || card.isMatched {
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.2316158334, green: 0.2316158334, blue: 0.2316158334, alpha: 0.5) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
                button.setTitle(self.emoji(for: card), for: UIControl.State.normal);
            } else {
                button.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.1217626589, alpha: 1);
                button.setTitle("", for: UIControl.State.normal);
            }
        }
        
        counterDisplayer.text = String(game.getCount());
        scoreDisplayer.text = String(game.getScore());
    }

    func emoji(for card: Card) -> String {
        if self.emojiDict[card] == nil && !self.emojis.isEmpty {
            let randomIndex = Int(arc4random_uniform(UInt32(self.emojis.count)));
            self.emojiDict[card] = self.emojis[randomIndex];
            self.emojis.remove(at: randomIndex);
        }

        return self.emojiDict[card] ?? "?";
    }

    @IBAction func reset(_ sender: UIButton) {
        self.game.reset();
        self.updateViewFromModel();
    }
}

