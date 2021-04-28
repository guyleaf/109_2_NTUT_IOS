//
//  ContentView.swift
//  DiceGame
//
//  Created by Guyleaf on 2021/4/28.
//

import SwiftUI

struct ContentView: View {
    @State private var dice1_number = 0;
    @State private var dice2_number = 0;
    @State private var dice3_number = 0;
    @State private var guess_number = "";
    @State private var money = 1000;
    @State private var result = "猜測中";
    private var die_size = CGFloat(80.0);
    
    private func roll() {
        dice1_number = Int.random(in: 1...6)
        dice2_number = Int.random(in: 1...6)
        dice3_number = Int.random(in: 1...6)
    }

    var body: some View {
        VStack {
            VStack {
                Text("骰子遊戲")
                    .padding()
                    .font(.largeTitle)
                Spacer()
            }
            .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "die.face.\(dice1_number == 0 ? 6 : dice1_number)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: die_size, height: die_size, alignment: .center)
                    Text("骰子1數字：\(dice1_number)")
                        .padding()
                }
                HStack {
                    Image(systemName: "die.face.\(dice2_number == 0 ? 6 : dice2_number)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: die_size, height: die_size, alignment: .center)
                    Text("骰子2數字：\(dice2_number)")
                        .padding()
                }
                HStack {
                    Image(systemName: "die.face.\(dice3_number == 0 ? 6 : dice3_number)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: die_size, height: die_size, alignment: .center)
                    Text("骰子3數字：\(dice3_number)")
                        .padding()
                }
                HStack {
                    TextField("請輸入猜測總和", text: $guess_number)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                    Button(action: {
                        if let number = Int(guess_number) {
                            roll()
            
                            let total: Int = dice1_number + dice2_number + dice3_number;

                            if total <= number {
                                result = "猜測成功加100元"
                                money += 100
                            }
                            else {
                                result = "猜測成功減100元"
                                money -= 100
                            }
                        }
                    }, label: {
                        Text("猜測！")
                    })
                    .padding()
                }
                VStack {
                    Spacer()
                    Text("猜測結果：\(result)")
                    Spacer()
                }
                .frame(width: 250, height: 50, alignment: .leading)
                VStack {
                    Spacer()
                    Text("目前金額：\(money)")
                    Spacer()
                }
                .frame(width: 250, height: 50, alignment: .leading)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
