//
//  Level4GameView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 3/9/22.
//

import SwiftUI

struct HardGameView: View {
    @StateObject var viewModel = HardViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text(viewModel.questionProgressText)
                    .font(.callout).bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
//                    .padding()
                HardQuestionView()
            }
//            .navigationBarHidden(true)
            .environmentObject(viewModel)
        }
        .background(
            NavigationLink(destination: ScoreView(viewModel: EasyScoreViewModel(correctGuesses: viewModel.correctGuesses, incorrectGuesses: viewModel.incorrectGuesses)),
                           isActive: .constant(viewModel.gameIsOver),
                           //isActive takes a binding boolean and whenever you set that binding boolean to true, the navigation link gets activated and you are navigated to the destination.
                           label: { EmptyView() })
        )
    }
}

struct HardGameView_Previews: PreviewProvider {
    static var previews: some View {
        HardGameView()
    }
}
