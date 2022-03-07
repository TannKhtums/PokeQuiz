//
//  EasyScoreView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/9/22.
//

import SwiftUI

struct EasyScoreView: View {
    let viewModel: EasyScoreViewModel
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                VStack {
                    VStack {
                        Text("Final Score:")
                        Text("\(viewModel.percentage)%")
                            .font(.system(size: 50))
                            .bold()
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .position(x: 100, y: 100)
                    .frame(width: 200, height: 200)
                    VStack {
                        Text("Correct ✅: \(viewModel.correctGuesses)")
                        Text("Incorrect ❌: \(viewModel.incorrectGuesses)")
                    }
                    .font(.title)
                    .padding()
                }

                NavigationLink(destination: MainMenu()) {
                        ButtonView(chosenText: "Return to Main Menu")
                }
                .foregroundColor(.black)
                .border(.blue, width: 4)
                .padding()
                Spacer()
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct EasyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        EasyScoreView(viewModel: EasyScoreViewModel(correctGuesses: 8, incorrectGuesses: 2))
    }
}
