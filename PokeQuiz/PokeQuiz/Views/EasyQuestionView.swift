//
//  EasyQuestionView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/4/22.
//

import SwiftUI

struct EasyQuestionView: View {
    
    @EnvironmentObject var viewModel: EasyGameViewModel
    
    //We also took advantage of EnvironmentObject to get access to the view model which allows the question view to update the quiz when a user guesses.
    
//    let pokemon: [Pokemon]
//    var pokemonShuffled: [Pokemon]
//    
//    init() {
//        self.pokemon = viewModel.pokemon
//        self.pokemonShuffled = viewModel.pokemonShuffled
//    }

    
    var body: some View {
        ZStack{
            BackgroundView()
            VStack {
                Spacer()
                Spacer()
                Text("Who's that Pokemon?")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                PokemonImageViewEasy(selection: viewModel.pokemon[0].number)
                Spacer()
                VStack {
                    HStack {
                        ForEach(0..<2) { index in
                            Button {
                                print("\(viewModel.pokemonShuffled[index].name)")
                                print(viewModel.pokemon)
                                print(viewModel.pokemonShuffled)
                                print(viewModel.easyGame.guesses)
//                                print(viewModel.easyGame.guesses[viewModel.easyGame.currentQuestion[0]])
                                viewModel.makeGuess(name: viewModel.pokemonShuffled[index].name)
                            } label: {
                                ButtonView(chosenText: viewModel.pokemonShuffled[index].name + " " + viewModel.rightWrongText(optionalName: viewModel.pokemonShuffled[index].name))
                            }
                            .foregroundColor(.black)
                            .background(viewModel.color(optionalName: viewModel.pokemonShuffled[index].name))
                            .disabled(viewModel.guessWasMade)
                      }
                    }
                    HStack {
                        ForEach(2..<4) { index in
                            Button {
                                print("\(viewModel.pokemonShuffled[index].name)")
                                print(viewModel.pokemon)
                                print(viewModel.pokemonShuffled)
                                print(viewModel.easyGame.guesses)
                                viewModel.makeGuess(name: viewModel.pokemonShuffled[index].name)
                            } label: {
                                ButtonView(chosenText: viewModel.pokemonShuffled[index].name + " " + viewModel.rightWrongText(optionalName: viewModel.pokemonShuffled[index].name))
                        }
                            .foregroundColor(.black)
                            .background(viewModel.color(optionalName: viewModel.pokemonShuffled[index].name))
                            .disabled(viewModel.guessWasMade)
                      }
                    }
                    
                    if viewModel.guessWasMade {
                        Button(action: { viewModel.displayNextScreen()
                            viewModel.shufflePokemonAgain()
                            print(viewModel.pokemon)
                            print(viewModel.pokemonShuffled)
                        }) {
                            BottomTextView(str: "Next")
                        }
                    }
                }
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
}
    
struct EasyQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        EasyQuestionView()
            .environmentObject(EasyGameViewModel())
    }
}
