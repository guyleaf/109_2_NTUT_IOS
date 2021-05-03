//
//  SheetView.swift
//  Demo
//
//  Created by Guyleaf on 2021/5/3.
//

import SwiftUI

struct SheetView: View {
    @State private var showSecondPage = false
    
    var body: some View {
        Button(action: {
            showSecondPage = true;
        }, label: {
            Text("Show second page")
        })
        .fullScreenCover(isPresented: $showSecondPage, content: {
            SecondView(showSecondPage: $showSecondPage)
        })
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}

struct SecondView: View {
    @Binding var showSecondPage: Bool;
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Text("Second view")
        }
        .overlay(
            Button(action: {
                showSecondPage = false;
            }, label: {
                Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(20)
            }), alignment: .topTrailing)
    }
}
