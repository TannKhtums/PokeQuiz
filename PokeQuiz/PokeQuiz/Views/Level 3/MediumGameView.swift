//
//  MediumGameView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/17/22.
//

import SwiftUI

struct MediumGameView: View {
    @StateObject var viewModel = MediumGameViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text(viewModel.questionProgressText)
                    .font(.callout).bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
//                    .padding()
                    MediumQuestionView()
    //            .navigationBarHidden(true)
                .environmentObject(viewModel)

            }
        }
        .background(
            NavigationLink(destination: ScoreView(viewModel: EasyScoreViewModel(correctGuesses: viewModel.correctGuesses, incorrectGuesses: viewModel.incorrectGuesses)),
                           isActive: .constant(viewModel.gameIsOver),
                           //isActive takes a binding boolean and whenever you set that binding boolean to true, the navigation link gets activated and you are navigated to the destination.
                           label: { EmptyView() })
        )
    }
}

struct MediumGameView_Previews: PreviewProvider {
    static var previews: some View {
        MediumGameView()
    }
}
