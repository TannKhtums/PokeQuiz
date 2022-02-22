//
//  TypesView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/15/22.
//

import SwiftUI

//var capitalCity = ["Nepal": "Kathmandu", "Italy": "Rome", "England": "London"]


let typesArr = ["Normal": Color.blue, "Electric": Color.yellow, "Electric": Color.yellow, "Electric": Color.yellow]

struct TypesButtonView: View {

    @EnvironmentObject var viewModel: MediumGameViewModel
    
    let chosenText: String
    let color: Color
    
    @State var selectedToggle = false
    @State var superDuperToggle = false
    
    var body: some View {
//        Button {
////            self.selectedToggle.toggle()
//            print(viewModel.selectedTypes)
//            viewModel.selectedTypes.append(chosenText)
//            print(viewModel.selectedTypes)
//            print(chosenText)
//            viewModel.trimArray()
//        } label: {
//            ZStack {
//                RoundedRectangle(cornerRadius: 20)
//                Text(chosenText).foregroundColor(.white)
//                    .padding()
//            }
//                .foregroundColor(color)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(viewModel.selectedTypes.contains(chosenText) ? .black : .clear, lineWidth: 3)
//                )
//        }
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                Text(chosenText).foregroundColor(.white)
                    .padding()
            }
                .foregroundColor(color)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(selectedToggle && viewModel.selectedTypes.contains(chosenText) ? .black : .clear, lineWidth: 3)
                )
                        .onTapGesture {
                            self.selectedToggle.toggle()
                            print(viewModel.selectedTypes)
                            viewModel.selectedTypes.append(chosenText)
                            print(viewModel.selectedTypes)
                            print(chosenText)
                            viewModel.trimArray()
                        }
                        .onLongPressGesture(minimumDuration: 0.1) {
                            self.superDuperToggle.toggle()
                            print(viewModel.selectedTypes)
                            viewModel.selectedTypes.append(chosenText)
                            print(viewModel.selectedTypes)
                            print("\(chosenText) is super duper effective!")
                            viewModel.trimArray()
                            }
        }
    }
}

//if useRedText {
//    Button("Hello World") {
//        useRedText.toggle()
//    }
//    .foregroundColor(.red)
//} else {
//    Button("Hello World") {
//        useRedText.toggle()
//    }
//    .foregroundColor(.blue)
//}

struct TypesView: View {
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 200))]) {
                Group {
                    TypesButtonView(chosenText: "Normal", color: Color(white: 0.7))
                    TypesButtonView(chosenText: "Fire", color: .red)
                    TypesButtonView(chosenText: "Water", color: .blue)
                    TypesButtonView(chosenText: "Grass", color: .green)
                    TypesButtonView(chosenText: "Electric", color: .yellow)
                    TypesButtonView(chosenText: "Ice", color: Color(red: 0.4627, green: 0.8392, blue: 1.0))
                    TypesButtonView(chosenText: "Fighting", color: .brown)
                    TypesButtonView(chosenText: "Poison", color: Color(hue: 276/360, saturation: 0.91, brightness: 0.8))
                    TypesButtonView(chosenText: "Ground", color: Color(hue: 20/360, saturation: 0.91, brightness: 0.5))
                }
                Group {
                    TypesButtonView(chosenText: "Flying", color: Color(hue: 240/360, saturation: 0.7, brightness: 1))
                    TypesButtonView(chosenText: "Bug", color: Color(hue: 150/360, saturation: 0.91, brightness: 0.7))

                    TypesButtonView(chosenText: "Psychic", color: .purple)
                    TypesButtonView(chosenText: "Rock", color: Color(hue: 16/360, saturation: 0.91, brightness: 0.7))
                    TypesButtonView(chosenText: "Ghost", color: Color(hue: 276/360, saturation: 0.91, brightness: 0.9))
                    TypesButtonView(chosenText: "Dark", color: Color(white: 0.3))
                    TypesButtonView(chosenText: "Dragon", color: .indigo)
                    TypesButtonView(chosenText: "Steel", color: Color(white: 0.75))
                    TypesButtonView(chosenText: "Fairy", color: Color(hue: 320/360, saturation: 0.6, brightness: 1))
                }
            }
        }
    }
}




struct TypesView_Previews: PreviewProvider {
    static var previews: some View {
        TypesView()
            .environmentObject(MediumGameViewModel())
    }
}


