//
//  MediumGameViewModel.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/16/22.
//

import SwiftUI

class MediumGameViewModel: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode = false

    
    @Published var mediumGame: MediumGame
    //whenever mediumGame is changed, publish those changes to anything listening

    @Published var selectedTypes: [String] = []

    var correctGuesses: Int {
        mediumGame.guessCount.correct
    }
    
    var incorrectGuesses: Int {
        mediumGame.guessCount.incorrect
    }
    
    var currentQuestion: Pokemon {
        mediumGame.currentQuestion
    }
    
    var pokemon: Pokemon
    // see if I can connect these variables to MediumGame so that when they are changed it changes the view too
    
    
    init() {
        let mediumGame = MediumGame()
        self.mediumGame  = mediumGame
        self.pokemon = mediumGame.currentQuestion
    }
    
    var questionProgressText: String {
        "\(mediumGame.currentQuestionIndex + 1) / \(mediumGame.numberOfQuestions)"
    }
    
    var guessWasMade: Bool {
        if let _ = mediumGame.guesses[currentQuestion] {
            return true
        } else {
            return false
        }
    }
    
    
    var gameIsOver: Bool {
        mediumGame.isOver
    }
    
//    func alphabetizedTypesArr(array: [String]) -> [String] {
//        mediumGame.alphabetizedTypesArr(array: array)
//    }
    
    func alphabetizedTypesArr(array: [String]) -> [String] {
            let alphabetizedArr = array.sorted()
            return alphabetizedArr
        }
    
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
    
    func makeGuess(typesArr: [String]) {
//        let alphabatizedGuess = typesArr.sorted()
        mediumGame.makeGuessForCurrentQuestion(typesArr: alphabetizedTypesArr(array: typesArr))
    }
    //    makeGuess() simply communicates the guessed index to the game game property for the currently displayed question.
    
    func displayNextScreen() {
        mediumGame.updateGameStatus()
    }
    //displayNextScreen() will update the game’s status and will be called when the user taps on the button to proceed to the next screen.
    
    func assignNextQuestion() {
        self.pokemon = mediumGame.currentQuestion
    }
    
    func color() -> Color {
        if let guessedArr = mediumGame.guesses[currentQuestion] {
            // so guessedName is whatever the value of the Key >easyGame.guesses[currentQuestion]
            if guessedArr == alphabetizedTypesArr(array: currentQuestion.type) {
                return Color.green.opacity(0.5)
            } else {
                return Color.red.opacity(0.5)
            }
        } else {
            return (isDarkMode ? Color.black : Color.white)
        }
    }
    
    func rightWrongText() -> String {
        if let guessedArr = mediumGame.guesses[currentQuestion] {
            // so guessedArr is whatever is whatever the value of the Key >easyGame.guesses[currentQuestion]
            if guessedArr == alphabetizedTypesArr(array: currentQuestion.type) {
                return "✅"
            } else {
                return "❌"
            }
        } else {
            return ""
        }
    }
    
    
    func correctAnswerNotification() -> String {
        if let guessedTypes = mediumGame.guesses[currentQuestion] {
            // so guessedName is whatever the value is for the Key >easyGame.guesses[currentQuestion]
            if guessedTypes == alphabetizedTypesArr(array: currentQuestion.type) {
                return ""
            } else {
                if currentQuestion.type.count < 2 {
                    return "\(currentQuestion.name)'s type is \(currentQuestion.type[0])"
                } else {
                    return "\(currentQuestion.name)'s types are \(currentQuestion.type[0]) and \(currentQuestion.type[1])"
                }
            }
        } else {
            return ""
        }
    }
                                        
}
