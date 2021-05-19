//
//  User.swift
//  finger_guessing_game
//
//  Created by Guyleaf on 2021/5/19.
//

import Foundation

struct Finger {
    let type: FingerType
    var name: String {
        get {
            switch type {
                case .paper:
                    return "布"
                case .scissor:
                    return "剪刀"
                case .stone:
                    return "石頭"
            }
        }
    }

    enum FingerType: String, CaseIterable {
        case paper = "paper"
        case scissor = "scissor"
        case stone = "stone"
    }
}
