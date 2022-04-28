//
//  PokemonLevelView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/18/22.
//

import SwiftUI

struct PokemonLevelView: View {
    var selection: String
    var text: String
    
    var body: some View {
        HStack {
            Image(selection)
                    .resizable()
                    .frame(width: 175, height: 175)
                    .padding()
                    .shadow(radius: 5)
            Text(text)
                .foregroundColor(.black)
                .font(.title)
                .bold()
                .padding()
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))

        }

}

struct PokemonLevelView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonLevelView(selection: "001", text: "EASY")
    }
}
