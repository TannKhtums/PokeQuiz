//
//  VeryHardGameView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 3/19/22.
//

import SwiftUI

struct VeryHardGameView: View {
    @StateObject var viewModel = VeryHardViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text(viewModel.questionProgressText)
                    .font(.callout).bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding()
                VeryHardQuestionView()
            }
//            .navigationBarHidden(true)
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

struct VeryHardGameView_Previews: PreviewProvider {
    static var previews: some View {
        VeryHardGameView()
    }
}
