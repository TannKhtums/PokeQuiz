//
//  SillouhetteView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/12/22.
//

import SwiftUI

struct SillouhetteView: View {
    var selection: String

    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.black)
                .frame(width: 300, height: 300)
                .mask(
                    Image(selection)
                        .resizable()
                        .frame(width: 300, height: 300)
                )
                .padding()
                .background(.regularMaterial)
//                .shadow(radius: 5)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct SillouhetteView_Previews: PreviewProvider {
    static var previews: some View {
        SillouhetteView(selection: "001")
    }
}
