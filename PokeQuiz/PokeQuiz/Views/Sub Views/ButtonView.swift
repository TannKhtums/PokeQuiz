//
//  ButtonView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/5/22.
//

import SwiftUI

struct ButtonView: View {
    @AppStorage("isDarkMode") var isDarkMode = false

    let chosenText: String
    
    var body: some View {
        Text(chosenText)
            .foregroundColor(isDarkMode ? .white : .black)
            .font(.body)
            .bold()
            .padding()
            .border(.red, width: 4)
            .multilineTextAlignment(.center)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonView(chosenText: "Test")
            ButtonView(chosenText: "Test")
        }
    }
}
