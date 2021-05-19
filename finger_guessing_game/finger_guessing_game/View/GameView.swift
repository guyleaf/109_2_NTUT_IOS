//
//  GameView.swift
//  finger_guessing_game
//
//  Created by Guyleaf on 2021/5/19.
//

import SwiftUI

struct GameView: View {
    @StateObject var gameViewModel: GameViewModel = GameViewModel()
    
    var body: some View {
        VStack (alignment: .center) {
            Text("猜拳遊戲")
                .font(.largeTitle)
            HStack {
                Text("玩家：  ")
                    .font(.title)
                Label {
                    Text(gameViewModel.playerFinger?.name ?? "石頭")
                        .font(.title)
                } icon: {
                    Image(gameViewModel.playerFinger?.type.rawValue ?? "stone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
            }
            HStack {
                Text("電腦：  ")
                    .font(.title)
                Label {
                    Text(gameViewModel.computerFinger?.name ?? "石頭")
                        .font(.title)
                } icon: {
                    Image(gameViewModel.computerFinger?.type.rawValue ?? "stone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
            }
            
            Button(action: {
                gameViewModel.play()
            }, label: {
                ZStack {
                    Text("出拳！")
                    Image("paperscissorstone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
            })
            
            HStack {
                Text("結果：  ")
                    .font(.system(size: 20))
                if let result = gameViewModel.gameState {
                    Text(result == .win ? "玩家獲勝！" : result == .lose ? "玩家輸了！" : "平手！")
                        .font(.system(size: 20))
                        .foregroundColor(.red)
                }
                else {
                    Text("請按”出拳“開始出拳")
                        .font(.system(size: 20))
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
