//
//  WelcomeScreen.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/3/22.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    Spacer()
                    Image("Pokemon")
                        .resizable()
                        .frame(width: 400, height: 148, alignment: .center)
                    Spacer()
                    Spacer()
                    NavigationLink(destination: MainMenu()) {
                        ButtonView(chosenText: "test")
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
