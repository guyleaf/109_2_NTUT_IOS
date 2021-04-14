//
//  Card.swift
//  cardGame
//
//  Created by Guyleaf on 2021/3/17.
//

import Foundation

struct Card : Hashable {
    var isFaceUp = false;
    var isMatched = false;
    private var identifier: Int;

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier);
    }

    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier;
    }

    static var identifierFactory: Int = 0;
    
    static func getUniqueIdentifier() -> Int {
        self.identifierFactory += 1;
        return self.identifierFactory;
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier();
    }
}
