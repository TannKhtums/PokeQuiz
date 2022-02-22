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
                    .font(.callout)
                MediumQuestionView()
            }
            
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MediumGameView_Previews: PreviewProvider {
    static var previews: some View {
        MediumGameView()
    }
}
