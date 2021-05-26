//
//  MainView.swift
//  firestoreTODO
//
//  Created by Guyleaf on 2021/5/26.
//

import SwiftUI

struct MainView: View {
    @StateObject var todoViewModel: TodoViewModel = TodoViewModel()
    
    var body: some View {
        VStack {
            Text("ToDO App")
                .font(.largeTitle)
            VStack {
                Text("輸入數據")
                    .padding()
                VStack(alignment: .leading) {
                    HStack {
                        Text("名稱: ")
                        TextField("請輸入名稱", text: $todoViewModel.name)
                    }.padding()
                    HStack {
                        Text("是否完成: ")
                        TextField("請輸入“是”或“否”", text: $todoViewModel.isFinished)
                    }.padding()
                    DatePicker("到期時間: ", selection: $todoViewModel.expiredTime).padding()
                }
                Button("新增數據") {
                    todoViewModel.submit()
                }.padding()
            }
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .butt, dash: [4]))
                .frame(height: 1)
            VStack {
                Text("目前數據")
                    .padding()
                VStack(alignment: .leading) {
                    HStack() {
                        Text("名稱: ")
                        
                        if (todoViewModel.todoItem != nil) {
                            Text(todoViewModel.todoItem?.name ?? "")
                        }
                        Spacer()
                    }.padding()
                    HStack {
                        Text(todoViewModel.todoItem != nil ? "是否完成: " :"名稱: ")
                        if (todoViewModel.todoItem != nil) {
                            Text(todoViewModel.todoItem?.isFinished ?? "")
                        }
                        Spacer()
                    }.padding()
                    HStack {
                        Text(todoViewModel.todoItem != nil ? "到期時間: " :"名稱: ")
                        if (todoViewModel.todoItem != nil) {
                            Text(todoViewModel.expiredTime, style: .date) + Text(", ")
                            + Text(todoViewModel.expiredTime, style: .time)
                        }
                        Spacer()
                    }.padding()
                }
                Button("讀取數據") {
                    todoViewModel.getTodo()
                }.padding()
            }
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
