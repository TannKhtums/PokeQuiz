//
//  Onboarding1.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/16/22.
//

import SwiftUI

struct Onboarding_1: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text("Great trainers train their brain along with their Pokemon.")
                    .font(.title)
                    .bold()
                    .padding()
                PokemonImageViewEasy(selection: "001")
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(.white)
        }
    }
}

struct Onboarding_1_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_1()
    }
}
