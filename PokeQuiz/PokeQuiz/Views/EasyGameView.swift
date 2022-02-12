//
//  EasyGameView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/8/22.
//

import SwiftUI

struct EasyGameView: View {
    @StateObject var viewModel = EasyGameViewModel()

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text(viewModel.questionProgressText)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding()
                EasyQuestionView()
            }
            .navigationBarHidden(true)
            .environmentObject(viewModel)
        }
        .background(
            NavigationLink(destination: EasyScoreView(viewModel: EasyScoreViewModel(correctGuesses: viewModel.correctGuesses, incorrectGuesses: viewModel.incorrectGuesses)),
                           isActive: .constant(viewModel.gameIsOver),
                           //isActive takes a binding boolean and whenever you set that binding boolean to true, the navigation link gets activated and you are navigated to the destination.
                           label: { EmptyView() })
        )
    }
}

struct EasyGameView_Previews: PreviewProvider {
    static var previews: some View {
        EasyGameView()
    }
}
