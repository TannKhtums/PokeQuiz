//
//  EasyScoreView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/9/22.
//

import SwiftUI

struct ScoreView: View {
    let viewModel: EasyScoreViewModel
    
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Spacer()
                VStack {
                    VStack {
                        Text("Final Score:")
                        Text("\(viewModel.percentage)%")
                            .font(.system(size: 50))
                            .bold()
                    }
                    .font(.largeTitle)
//                    .foregroundColor(.black)
//                    .position(x: 100, y: 100)
//                    .frame(width: 200, height: 200)
                    VStack {
                        Text("Correct ✅: \(viewModel.correctGuesses)")
                        Text("Incorrect ❌: \(viewModel.incorrectGuesses)")
                    }
                    .font(.title)
                    .padding()
                }
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

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

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(viewModel: EasyScoreViewModel(correctGuesses: 8, incorrectGuesses: 2))
    }
}
