//
//  ContentView.swift
//  lab8
//
//  Created by Guyleaf on 2021/5/12.
//

import SwiftUI

struct ContentView: View {
    private var songs = ["聽媽媽的話", "床邊故事", "告白氣球", "等你下課"];
    @State private var isLike = false;
    @State private var isFan = false;
    @State private var age = 42;
    @State private var date = Date();
    @State private var favoriteScale: CGFloat = 10;
    @State private var selectedSongIndex = 0;
    @State private var text = "";
    @State private var showAlert = false;

    var body: some View {
        VStack {
            VStack {
                Text("周杰倫")
                    .font(.largeTitle)
                Image("Cover")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 15)
                    .blur(radius: 10 - favoriteScale)
            }
            HStack {
                Spacer()
                Button(action: {
                    isLike = !isLike;
                }, label: {
                    Image(systemName: isLike ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width:50, height:50)
                        .foregroundColor(.red)
                })
            }
            Toggle("是粉絲嗎?", isOn: $isFan)
            HStack(spacing: 4) {
                Text("年齡\t\t:")
                Stepper("\(age) 歲", onIncrement: {
                    age += 1;
                }, onDecrement: {
                    age -= 1;
                })
            }
            HStack {
                Text("生日\t\t:")
                Spacer()
                DatePicker("", selection: $date, displayedComponents: .date)
                    .frame(minWidth: 280)
            }
            HStack(spacing: 15) {
                Text("喜歡程度\t:")
                Slider(value: $favoriteScale, in: 0...10)
                Text("\(favoriteScale, specifier: "%.0f")分")
            }
            HStack(spacing: 2) {
                Text("喜歡的歌\t:")
                Spacer()
                Picker(selection: $selectedSongIndex, label: Text("選擇歌")) {
                    ForEach(songs.indices) { (index) in
                        Text(songs[index])
                    }
                }
                .frame(width: 280, height: 120)
                .clipped()
            }
            TextField("Description", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                Button(action: {
                    showAlert = true;
                }, label: {
                    Text("送出")
                        .font(.title)
                        .frame(width: 100, height: 50)
                })
                .background(Color(red: 0, green: 0, blue: 255, opacity: 0.1))
                .foregroundColor(.purple)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .alert(isPresented: $showAlert) { () -> Alert in
                    let formatter = DateFormatter();
                    formatter.dateFormat = "MM dd, yyyy";
                    let dateText = formatter.string(from: date);
                    let result = "他今年\(age)歲\n他的生日是 \(dateText)\n我\(Int(favoriteScale))分喜歡他\n我喜歡的歌是 \(songs[selectedSongIndex])\n我想對他說 \(text)";
                    return Alert(title: Text("我\(isFan ? "是" : "不是")周杰倫的粉絲"), message: Text(result).font(.system(size: 2)));
                }
            }
        }
        .padding(.horizontal)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
