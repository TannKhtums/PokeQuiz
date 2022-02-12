//
//  BackgroundView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/4/22.
//

import SwiftUI

struct BackgroundView: View {
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                Rectangle()
                    .fill(.red)
                    .frame(width: geo.size.width * 1.0, height: geo.size.height * 0.33)

            }
                .ignoresSafeArea()
            Spacer()
        }

        }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
