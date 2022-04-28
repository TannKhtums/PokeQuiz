//
//  BackgroundView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/4/22.
//

import SwiftUI

struct BackgroundView: View {
    @AppStorage("isDarkMode") var isDarkMode = false
        
    var body: some View {
            VStack {
                    GeometryReader { geo in
                        Rectangle()
                            .fill(isDarkMode ? darkBackgrounColor.darkBackground : .red)
                            .frame(width: geo.size.width * 1.0, height: geo.size.height * 0.33)
                    }
                        .ignoresSafeArea()
                Spacer()
            }
    }
}

struct darkBackgrounColor {
    static var darkBackground = Color(hue: 225/360, saturation: 0.1, brightness: 0.25)
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}

