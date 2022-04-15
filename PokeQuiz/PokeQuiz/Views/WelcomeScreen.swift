//
//  WelcomeScreen.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/3/22.
//

import SwiftUI

struct WelcomeScreen: View {
    @AppStorage("isDarkMode") var isDarkMode = false
//    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    
    let darkModeSilhouetteColor = Color(hue: 225/360, saturation: 0.1, brightness: 1)
    @EnvironmentObject var viewModel: SettingsViewModel
    
    @State private var animationAmount = 1.0

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    Spacer()
                    GeometryReader { geo in
                        Image("pokequiz")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width * 1.0, height: geo.size.height * 1.0)
                    }
                    Spacer()
                    VStack {
                        Rectangle()
                            .foregroundColor(isDarkMode ? darkModeSilhouetteColor : .black)
                            .frame(width: 300, height: 300)
                            .mask(
                                Image(viewModel.selectedPokemon.number)
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
                    }.environmentObject(viewModel)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
        }
        .environmentObject(viewModel)
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            OnboardingView(shouldShowOnboarding: $shouldShowOnboarding) })
        .navigationBarHidden(true)
    }
}
//
//struct OnboardingView: View {
//    @Binding var shouldShowOnboarding: Bool
//    @EnvironmentObject var viewModel: SettingsViewModel
//
//    var body: some View {
//        TabView {
//            PageView(
//                title: "Bulbasaur",
//                text: "Test",
//                image: "001",
//                showDismissButton: false,
//                shouldShowOnboarding: $shouldShowOnboarding
//            )
//
//            PageView(
//                title: "Bulbasaur",
//                text: "Test",
//                image: "002",
//                showDismissButton: true,
//                shouldShowOnboarding: $shouldShowOnboarding
//            )
//            WelcomeSettingsView(
//                shouldShowOnboarding: $shouldShowOnboarding
//            ).environmentObject(viewModel)
//
//        }
//        .tabViewStyle(PageTabViewStyle())
//        //allows you to swipe between tab pages
//    }
//}
//
//struct PageView: View {
//    let title: String
//    let text: String
//    let image: String
//    let showDismissButton: Bool
//    @Binding var shouldShowOnboarding: Bool
//
//    var body: some View {
//        VStack {
//            PokemonImageView(selection: image)
//                .padding()
//            Text(title)
//                .font(.system(size: 32))
//                .padding()
//            Text(text)
//                .font(.system(size: 32))
//                .padding()
//
//            if showDismissButton {
//                Button(action: {
//                    shouldShowOnboarding.toggle()
//                }, label: {
//                    Text("Done")
//                        .bold()
//                        .foregroundColor(Color.white)
//                        .frame(width: 200, height: 50)
//                        .background(Color.green)
//                })
//            }
//        }
//    }
//}
//
//
//struct WelcomeSettingsView: View {
//    @EnvironmentObject var viewModel: SettingsViewModel
//    @Binding var shouldShowOnboarding: Bool
//
//    var body: some View {
//            Form {
//                Section {
//                    Picker("Level Style", selection: $viewModel.selectedStyle) {
//                        ForEach(SettingsViewModel.LevelStyle.allCases) { style in
//                            Text(style.rawValue.capitalized)
//                        }
//                    }
//                    .pickerStyle(.segmented)
//                    .padding([.leading, .trailing])
//                }
//                HStack {
//                    Text("Select your favorite Pokemon:")
//                    Spacer()
//                    Picker("Favorite Pokemon", selection: $viewModel.selectedPokemon) {
//                        ForEach(viewModel.pokemonArr, id: \.self) {
//                                Text($0.name)
//                            }
//                        }
//                    .pickerStyle(.menu)
//                }
//                HStack {
//                    Spacer()
//                    PokemonImageView(selection: viewModel.selectedPokemon.number)
//                    Spacer()
//                }
//
//                Button("Test") {
//                    viewModel.selectedPokemon = self.viewModel.selectedPokemon
//                    shouldShowOnboarding.toggle()
//                }
//
//                Button(action: {
//                    shouldShowOnboarding.toggle()
//                }, label: {
//                    Text("Done")
//                        .bold()
//                        .foregroundColor(Color.white)
//                        .frame(width: 200, height: 50)
//                        .background(Color.green)
//                        .cornerRadius(6)
//                })
//            }
//    }
//}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen().environmentObject(SettingsViewModel())
    }
}
