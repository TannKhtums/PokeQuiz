//
//  BackgroundView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/4/22.
//

import SwiftUI

struct BackgroundView: View {
    @AppStorage("isDarkMode") var isDarkMode = false
    
//    let darkRed = Color(red: 0.0, green: 0.0, blue: 0.67)
    let darkBackground = Color(hue: 225/360, saturation: 0.1, brightness: 0.25)
    
    var body: some View {
        NavigationView {
            VStack {
                    GeometryReader { geo in
                        Rectangle()
                            .fill(isDarkMode ? darkBackground : .red)
                            .frame(width: geo.size.width * 1.0, height: geo.size.height * 0.33)
                        

                    }
                        .ignoresSafeArea()

                Spacer()
            }
            
//            .toolbar {
//                Button(Image(systemName: "house")) {
//                    print("test")
//                }
//            }
        }

        }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}

//                        Image(systemName: "house")
//                        .imageScale(.large)
//                        .foregroundColor(.black)
//                        .offset(x: 300, y: 100)

//            VStack {
//                HStack {
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Image(systemName: "house")
//                    .imageScale(.large)
//                    .foregroundColor(.black)
//                    Spacer()
//                }
//                Spacer()
//            }
