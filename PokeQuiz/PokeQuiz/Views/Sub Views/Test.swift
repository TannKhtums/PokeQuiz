//
//  Test.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/11/22.
//

import SwiftUI

struct Test: View {
        @State private var animationAmount = 1.0

    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.black)
                .frame(width: 300, height: 300)
                .mask(
                    Image("003")
                        .resizable()
                        .frame(width: 300, height: 300)
                )
            Button("") {
                // animationAmount += 1
            }
            .padding(50)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.blue)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1.5)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
        }

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

