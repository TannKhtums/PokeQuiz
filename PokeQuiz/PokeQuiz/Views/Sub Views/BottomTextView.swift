//
//  BottomTextView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/7/22.
//

import SwiftUI

struct BottomTextView: View {
    let str: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(str)
                .foregroundColor(.white)
                .font(.body)
                .bold()
                .padding()
            Spacer()
        }.background(.blue)
    }
}

struct BottomTextView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTextView(str: "Test")
    }
}
