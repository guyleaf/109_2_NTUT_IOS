//
//  ContentView.swift
//  Demo
//
//  Created by Guyleaf on 2021/4/26.
//

import SwiftUI

struct ContentView: View {
    @State private var number: Int = 1;

    var body: some View {
        VStack {
            Dice(number: number)

            Button(action: {
                number = Int.random(in: 1...6)
            }, label: {
                Text("Play")
                    .font(.largeTitle)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Dice: View {
    var number: Int

    var body: some View {
        Image(systemName: "die.face.\(number).fill")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100, alignment: .top)
    }
}
