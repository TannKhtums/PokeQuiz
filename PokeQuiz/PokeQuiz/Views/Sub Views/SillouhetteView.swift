//
//  SillouhetteView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/12/22.
//

import SwiftUI

struct SillouhetteView: View {
    @AppStorage("isDarkMode") var isDarkMode = false
    
    let darkModeSilhouetteColor = Color(hue: 225/360, saturation: 0.1, brightness: 1)


    var selection: String

    var body: some View {
        VStack {
//            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(isDarkMode ? darkModeSilhouetteColor : .black)
//                    .frame(width: geo.size.width * 0.7, height: geo.size.width * 0.7)
                    .frame(width: 300, height: 300)
                    .mask(
                        Image(selection)
                            .resizable()
                            .scaledToFit()
//                            .frame(width: geo.size.width * 0.7, height: geo.size.width * 0.7)
                    )
                    .padding()
                    .background(.regularMaterial)
    //                .shadow(radius: 5)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
//            }
        }
    }
}


struct TypesSillouhetteView: View {
    @AppStorage("isDarkMode") var isDarkMode = false
    
    let darkModeSilhouetteColor = Color(hue: 225/360, saturation: 0.1, brightness: 1)


    var selection: String

    var body: some View {
        VStack {
//            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(isDarkMode ? darkModeSilhouetteColor : .black)
//                    .frame(width: geo.size.width * 0.7, height: geo.size.width * 0.7)
                    .frame(width: 225, height: 225)
                    .mask(
                        Image(selection)
                            .resizable()
                            .scaledToFit()
//                            .frame(width: geo.size.width * 0.7, height: geo.size.width * 0.7)
                    )
                    .padding()
                    .background(.regularMaterial)
    //                .shadow(radius: 5)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
//            }
        }
    }
}

struct SillouhetteView_Previews: PreviewProvider {
    static var previews: some View {
        SillouhetteView(selection: "001")
        TypesSillouhetteView(selection: "001")
    }
}
