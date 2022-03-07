//
//  ContentView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 1/22/22.
//

import SwiftUI

struct MainMenu: View {
    @State private var experiencePoints = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    Text("Select a training level below:")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                        NavigationLink(destination: VeryEasyGameView()) {
                                PokemonImageView(selection: "001")
                            }
                        NavigationLink(destination: EasyGameView()) {
                                PokemonImageView(selection: "002")
                            }
                        NavigationLink(destination: MediumGameView()) {
                                PokemonImageView(selection: "003")
                            }
                    Spacer()
                }
            }
            .navigationTitle("PokeQuiz!")
        }
        .navigationBarHidden(true)
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
