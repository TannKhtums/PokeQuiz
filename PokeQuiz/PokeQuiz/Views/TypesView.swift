//
//  TypesView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/15/22.
//

import SwiftUI

struct TypesView: View {
    
    @EnvironmentObject var viewModel: MediumGameViewModel
    
    @State private var selectedToggle = false
    @State private var superDuperToggle = false
    @State var selectedTypes: [String] = []
    
    func trimArray() {
        if selectedTypes.count > 2 {
            print("greater than 2")
            selectedTypes.remove(at: 0)
            print(selectedTypes)
        }
    }
    
    func unselectOrAddType(type: String) {
        if let index = selectedTypes.firstIndex(of: type) {
                selectedTypes.remove(at: index)
            } else {
            selectedTypes.append(type)
        }
    }

    let typesArr = ["Normal", "Fire", "Water", "Grass", "Electric", "Ice", "Fighting", "Poison", "Ground", "Flying", "Bug", "Psychic", "Rock", "Ghost", "Dark", "Dragon", "Steel", "Fairy"]
   
    func generateCorrectColor(type: String) -> Color {
        if type == "Normal" {
            return Color(white: 0.7)
        } else if type == "Fire" {
            return Color.red
        } else if type == "Water" {
            return Color.blue
        } else if type == "Grass" {
            return Color.green
        } else if type == "Electric" {
            return Color.yellow
        } else if type == "Ice" {
            return Color(red: 0.4627, green: 0.8392, blue: 1.0)
        } else if type == "Fighting" {
            return Color.brown
        } else if type == "Poison" {
            return Color(hue: 276/360, saturation: 0.91, brightness: 0.8)
        } else if type == "Ground" {
            return Color(hue: 20/360, saturation: 0.91, brightness: 0.5)
        }  else if type == "Flying" {
            return Color(hue: 240/360, saturation: 0.7, brightness: 1)
        } else if type == "Bug" {
            return Color(hue: 150/360, saturation: 0.91, brightness: 0.7)
        } else if type == "Psychic" {
            return Color.purple
        } else if type == "Rock" {
            return Color(hue: 16/360, saturation: 0.91, brightness: 0.7)
        } else if type == "Ghost" {
            return Color(hue: 276/360, saturation: 0.91, brightness: 0.9)
        } else if type == "Dark" {
            return Color(white: 0.3)
        } else if type == "Dragon" {
            return Color.indigo
        } else if type == "Steel" {
            return Color(white: 0.75)
        } else if type == "Fairy" {
            return Color(hue: 320/360, saturation: 0.6, brightness: 1)
        }else {
            return Color.black
        }
    }
    
    var body: some View {
        VStack {

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 200))]) {
                ForEach(typesArr, id:\.self) { type in
                    Button {
                        print("Button")
                        print(type)
                        print(selectedTypes)
                        unselectOrAddType(type: type)
                        print(selectedTypes)
                        trimArray()
                        print(selectedTypes)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                            Text(type).foregroundColor(.white).bold()
                                .padding()
                        }
                            .foregroundColor(generateCorrectColor(type: type))

                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(selectedTypes.contains(type) ? .black : .clear, lineWidth: 3)
                                )
                    }
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


