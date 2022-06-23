//
//  EasyQuestionView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/12/22.
//

import SwiftUI

struct EasyQuestionView: View {
    
    @EnvironmentObject var viewModel: EasyGameViewModel
    
    @AppStorage("isDarkMode") var isDarkMode = false
    
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
            ScrollView {
            VStack {
                Spacer()
                Spacer()
                Text("Who's that Pokemon?")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                SillouhetteView(selection: viewModel.pokemon[0].number)
                Spacer()
                VStack {
                    HStack {
                        ForEach(0..<2) { index in
                            Button {
                                print("\(viewModel.pokemonShuffled[index].name)")
                                print(viewModel.pokemon)
                                print(viewModel.pokemonShuffled)
                                print(viewModel.easyGame.guesses)
                                viewModel.makeGuess(name: viewModel.pokemonShuffled[index].name)
                                viewModel.selectedGuess = viewModel.pokemonShuffled[index].name
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
                                    viewModel.selectedGuess = viewModel.pokemonShuffled[index].name
                                } label: {
                                    ButtonView(chosenText: viewModel.pokemonShuffled[index].name + " " + viewModel.rightWrongText(optionalName: viewModel.pokemonShuffled[index].name))
                            }
                                .foregroundColor(.black)
                                .background(viewModel.color(optionalName: viewModel.pokemonShuffled[index].name))
                                .disabled(viewModel.guessWasMade)
                          }
                        }
                    Text(viewModel.correctAnswerNotification(optionalName: viewModel.selectedGuess))
                        .padding()
                                        
                    if viewModel.guessWasMade {
                        Button(action: { viewModel.displayNextScreen()
                            viewModel.shufflePokemonAgain()
                            print(viewModel.pokemon)
                            print(viewModel.pokemonShuffled)
                            viewModel.selectedGuess = ""
                        }) {
                            BottomTextView(str: "Next")
                        }
                    }
                }
                Spacer()
                Spacer()
            }
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

