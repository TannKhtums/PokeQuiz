//
//  Onboarding_2.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/16/22.
//

import SwiftUI

struct Onboarding_2: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text("""
                    PokeQuiz is the fun quiz app to help you do just that.
                    
                    Can you learn 'em all?
                    """)
                    .font(.title)
                    .bold()
                    .padding()
                PokemonImageViewEasy(selection: "003")
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(.white)
        }
    }
}

struct Onboarding_2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_2()
    }
}
