//
//  MovieDetailsView.swift
//  movieIntro
//
//  Created by Guyleaf on 2021/5/5.
//

import SwiftUI

struct MovieDetailsView: View {
    let texts: Array<String> = ["Pacific Rim is a 2013 American science fiction monster film directed by Guillermo del Toro, starring Charlie Hunnam, Idris Elba, Rinko Kikuchi, Charlie Day, Robert Kazinsky, Max Martini, Ron Perlman, and Mana Ashida, and the first film in the Pacific Rim franchise.", "The screenplay was written by Travis Beacham and del Toro from a story by Beacham. The film is set in the future, when Earth is at war with the Kaiju, colossal sea monsters which have emerged from an interdimensional portal on the bottom of the Pacific Ocean.", "To combat the monsters, humanity unites to create the Jaegers, gigantic humanoid mechas, each controlled by two co-pilots whose minds are joined by a mental link. Focusing on the war's later days, the story follows Raleigh Becket, a washed-up Jaeger pilot called out of retirement and teamed with rookie pilot Mako Mori as part of a last-ditch effort to defeat the Kaiju."]

    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            Image("detail")
                .resizable()
                .scaledToFit()
            ForEach(texts.indices) { index in
                Text(texts[index])
            }
        })
        .padding()
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
