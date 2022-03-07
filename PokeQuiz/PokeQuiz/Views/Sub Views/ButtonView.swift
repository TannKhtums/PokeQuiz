//
//  ButtonView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/5/22.
//

import SwiftUI

struct ButtonView: View {
    let chosenText: String
    
    var body: some View {
        Text(chosenText)
            .font(.body)
            .bold()
            .multilineTextAlignment(.center)
            .padding()
            .border(.red, width: 4)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(chosenText: "Test")
    }
}
