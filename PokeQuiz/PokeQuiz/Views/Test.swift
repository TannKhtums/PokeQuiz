//
//  Test.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/11/22.
//

import SwiftUI

struct Test: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.black)
            .frame(width: 300, height: 300)
            .mask(
                Image("003")
                    .resizable()
                    .frame(width: 300, height: 300)
            )
//        Text("Hello, world!")
//            .offset(x: 100, y: 100)
//            .background(.red)
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
