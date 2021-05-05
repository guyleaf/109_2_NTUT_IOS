//
//  ContentView.swift
//  movieIntro
//
//  Created by Guyleaf on 2021/5/5.
//

import SwiftUI

struct ContentView: View {
    @State var showMovieDetails: Bool = false;
    @State var showMovieTrailer: Bool = false;

    var body: some View {
        VStack(alignment: .leading, spacing: 50,
            content: {
                Text("Pacific Rim")
                    .padding()
                    .font(.largeTitle)
                VStack {
                    Image("cover")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    Button(action: {
                        showMovieDetails = true;
                    }, label: {
                        Text("Movie details")
                    })
                    .sheet(isPresented: $showMovieDetails, content: {
                        MovieDetailsView()
                    })
                    Button(action: {
                        showMovieTrailer = true;
                    }, label: {
                        Text("Movie trailer")
                    })
                    .sheet(isPresented: $showMovieTrailer, content: {
                        MovieTrailerView()
                            
                    })
                }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
