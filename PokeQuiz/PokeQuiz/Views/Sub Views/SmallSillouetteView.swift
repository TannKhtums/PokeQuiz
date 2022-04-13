//
//  SmallSillouetteView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/9/22.
//

import SwiftUI

struct SmallSillouetteView: View {
    @AppStorage("isDarkMode") var isDarkMode = false

        var selection: String

        var body: some View {
            VStack {
                Rectangle()
                    .foregroundColor(isDarkMode ? .white : .black)
                    .frame(width: 50, height: 50)
                    .mask(
                        Image(selection)
                            .resizable()
                            .frame(width: 50, height: 50)
                    )
            }
        }
    }

struct SmallSillouetteView_Previews: PreviewProvider {
    static var previews: some View {
        SmallSillouetteView(selection: "001")
    }
}
