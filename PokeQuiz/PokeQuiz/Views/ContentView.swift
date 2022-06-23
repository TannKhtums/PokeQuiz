//
//  ContentView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 3/26/22.
//

import SwiftUI

extension UserDefaults {
    var welcomeScreenShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "welcomeScreenShown") as? Bool) ?? false
            // as? Bool is casting? Not sure what casting means, "that value will be cast to any object, but if casting fails then we'll default to false"
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeScreenShown")
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: SettingsViewModel

    var body: some View {
        NavigationView {
            TabView {
                MainMenu()
//                    .navigationBarHidden(true)
                    .tabItem {
                        Label("Game", systemImage: "gamecontroller.fill")
                    }.navigationBarHidden(true)
                
                
                SettingsView()
//                    .navigationBarHidden(true)
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                        }
                    }.navigationBarHidden(true).navigationBarTitle("")
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SettingsViewModel())
    }
}

