//
//  Card.swift
//  cardGame
//
//  Created by Guyleaf on 2021/3/17.
//

import Foundation

struct Card {
    var isFaceUp = false;
    var isMatched = false;
    var identifier: Int;
    
//    init(identifier i: Int) {
//        self.identifier = i;
//    }
//    init(identifier: Int) {
//        self.identifier = identifier;
//    }
    
    static var identifierFactory: Int = 0;
    
    static func getUniqueIdentifier() -> Int {
        self.identifierFactory += 1;
        return self.identifierFactory;
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier();
    }
}
