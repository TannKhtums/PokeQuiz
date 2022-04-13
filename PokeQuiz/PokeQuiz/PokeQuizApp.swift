//
//  PokeQuizApp.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 1/22/22.
//

import SwiftUI

@main
struct PokeQuizApp: App {
    @StateObject var test = SettingsViewModel()
    @AppStorage("isDarkMode") var isDarkMode = false

    var body: some Scene {
        WindowGroup {
            WelcomeScreen().environmentObject(test)
                .preferredColorScheme(isDarkMode ? .dark : .light)
//            RegionSettingsTest()
        }
    }
}
