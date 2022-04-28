//
//  WelcomeScreen.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/3/22.
//

import SwiftUI

struct WelcomeScreen: View {
    @AppStorage("isDarkMode") var isDarkMode = false
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
        
    let darkModeSilhouetteColor = Color(hue: 225/360, saturation: 0.1, brightness: 1)
    @EnvironmentObject var viewModel: SettingsViewModel
    
    @State private var animationAmount = 1.0

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                GeometryReader { geo in

                VStack {
                        Image("pokequiz")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width, height: geo.size.height * 0.30)
                    
                        VStack {
                            Rectangle()
                                .foregroundColor(isDarkMode ? darkModeSilhouetteColor : .black)
                                .mask(
                                    Image(viewModel.selectedPokemon.number)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geo.size.width, height: geo.size.height * 0.45)
                                )
                        }
                    
                        NavigationLink(destination: ContentView()) {
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
                        }.environmentObject(viewModel)
                    Spacer()
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .environmentObject(viewModel)
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            OnboardingView().ignoresSafeArea() })

    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen().environmentObject(SettingsViewModel())
    }
}
//                    VStack {
//                        GeometryReader { geo in
//                            Rectangle()
//                                .mask(
//                                    Image(viewModel.selectedPokemon.number)
//                                        .resizable()
//                                        .frame(width: 300, height: 300)
//                                )
//                                .foregroundColor(isDarkMode ? darkModeSilhouetteColor : .black)
//                                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.5)
//                                .frame(width: geo.size.width, height: geo.size.height)
//                        }
//                    }
