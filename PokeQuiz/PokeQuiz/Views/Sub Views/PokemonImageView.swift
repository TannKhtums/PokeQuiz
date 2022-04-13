//
//  PokemonImageView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/4/22.
//

import SwiftUI

struct GearPokemonView: View {
    @AppStorage("isDarkMode") var isDarkMode = false

    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(isDarkMode ? .white : .black)
                .frame(width: 50, height: 50)
                .mask(
                    Image("600")
                        .resizable()
                        .frame(width: 50, height: 50)
                )
        }
    }}

struct LunatoneImageView: View {
    var body: some View {
        Image("337")
                .resizable()
                .frame(width: 45, height: 45)
    }
}

struct SolRockImageView: View {
    var body: some View {
        Image("338")
                .resizable()
                .frame(width: 55, height: 55)
    }
}



struct PokemonImageView: View {
    var selection: String
    
    var body: some View {
        Image(selection)
                .resizable()
                .frame(width: 175, height: 175)
                .padding()
                .background(.regularMaterial)
                .shadow(radius: 5)
                .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct PokemonImageViewEasy: View {
    var selection: String
    
    var body: some View {
        Image(selection)
                .resizable()
                .frame(width: 300, height: 300)
                .padding()
                .background(.regularMaterial)
                .shadow(radius: 5)
                .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct PokemonImageViewMedium: View {
    var selection: String
    
    var body: some View {
        Image(selection)
                .resizable()
                .frame(width: 225, height: 225)
                .padding()
                .background(.regularMaterial)
                .shadow(radius: 5)
                .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct PokemonImageView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                LunatoneImageView()
                SolRockImageView()
                PokemonImageView(selection: "001")
                PokemonImageViewEasy(selection: "001")
                PokemonImageViewMedium(selection: "001")
            }
        }
    }
}
