//
//  ContentView.swift
//  firebaseTest
//
//  Created by Guyleaf on 2021/5/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContentView: View {
    @State var songs = [Song]()
    
    func fetchSongs() {
        let db = Firestore.firestore()
        db.collection("songs").getDocuments { QuerySnapshot, Error in
            
            guard let snapshot = QuerySnapshot else { return }
            
            songs = snapshot.documents.compactMap { element in
                try? element.data(as: Song.self)
            }
        }
    }
    
    var body: some View {
        List(songs) { song in
            HStack {
                Text("Song: \(song.name)")
                Text("Singer: \(song.singer)")
                Text("URL: \(song.url)")
            }
        }
        .onAppear(perform: {
            fetchSongs()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
