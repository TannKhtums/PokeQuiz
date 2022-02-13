//
//  WelcomeScreen.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/3/22.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var animationAmount = 1.0


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
                    VStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: 300, height: 300)
                            .mask(
                                Image("006")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                            )
                    }
                    .padding()
                    Spacer()
                    NavigationLink(destination: MainMenu()) {
                        Text("START")
                            .bold()
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
                                        .easeInOut(duration: 2)
                                            .repeatForever(autoreverses: false),
                                        value: animationAmount
                                    )
                            )
                            .onAppear {
                                animationAmount = 2
                            }
                    }
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
//
//struct ContentView: View {
//    @State private var animationAmount = 1.0
//
//    var body: some View {
//        Button("") {
//            // animationAmount += 1
//        }
//        .padding(50)
//        .background(.blue)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .overlay(
//            Circle()
//                .stroke(.blue)
//                .scaleEffect(animationAmount)
//                .opacity(2 - animationAmount)
//                .animation(
//                    .easeInOut(duration: 1.5)
//                        .repeatForever(autoreverses: false),
//                    value: animationAmount
//                )
//        )
//        .onAppear {
//            animationAmount = 2
//        }
//    }
//}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
