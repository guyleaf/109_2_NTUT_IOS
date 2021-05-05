//
//  MovieTrailerView.swift
//  movieIntro
//
//  Created by Guyleaf on 2021/5/5.
//

import SwiftUI

struct MovieTrailerView: View {
    let names = ["Charlie Hunnam as Raleigh Becket", "Idris Elba as Marshal Stacker Pentecost"]
    let texts = ["A washed-up former pilot called out of retirement by the Pan Pacific Defense Corps. On casting Hunnam, del Toro stated: I saw him and I thought he had an earnest, really honest nature. And he was the kind of guy that I can relate to, as a male audience member I go, I like that guy. I would like to have a few beers with that guy' ... he has an earthy quality. Describing the character, Hunnam stated: When you meet me, in the beginning of the story, I've suffered a giant loss. Not only has it killed my sense of self-worth, but also my will to fight and keep on going. And then, Rinko and Idris, and a couple other people, bring me out of retirement to try to help with this grand push. I think that journey is a very relatable one. Everybody, at some point in their life, has fallen down and not felt like getting back up, but you have to, no matter how difficult it is. Hunnam was also considered for the role of Prince Nuada in del Toro's previous film, Hellboy II: The Golden Army. Paul Michael Wyers plays Raleigh as a child.", "Raleigh's commanding officer in Pan Pacific Defense Corps and former Jaeger pilot dying of radiation poisoning due to lax radiation shielding on the first Jaeger models. On selecting Elba, del Toro stated: This is a movie where I have had to deal with more dialogue than ever, and the way I cast the movie was—who do I want to hear say these things? Who do I want Charlie Hunnam to go against? Who can really tell Charlie Hunnam 'sit down and listen'? In another interview, the director said: I wanted to have Idris not be the blonde, square-jawed, Anglo, super hip marine that knows [everything]. I wanted somebody that could bring a lot of authority, but that you could feel the weight of the world on his shoulders. When I watched Luther, that's the essence of the character ... Luther is carrying literally the evils of the world on his shoulders. He's doing penance for all humanity ... Idris is one of those actors that is capable of embodying humanity, in almost like a Rodin sculpture-type, larger than life, almost like a Russian realism statue, you know, big hands, all the turmoil of humanity in his eyes. I wanted somebody that you could have doubts internally, and very few guys can do that. To prepare for the role, Elba watched footage of politicians David Cameron and Barack Obama, as well as Russell Crowe in Gladiator and Mel Gibson in Braveheart. Del Toro initially offered the role to Tom Cruise, who declined because of scheduling conflicts."]
    var body: some View {
        ScrollView(.vertical) {
            Spacer(minLength: 10)
            VStack(spacing: 40) {
                ForEach(names.indices) { index in
                    VStack(spacing: 10) {
                        Image("man\(index)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                        Text(names[index])
                        VStack {
                            Text(texts[index])
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct MovieTrailerView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTrailerView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
