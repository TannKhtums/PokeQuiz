//
//  MediumGameViewModel.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/16/22.
//

import SwiftUI

class MediumGameViewModel: ObservableObject {
    
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
    
    func color(optionalArr: [String]) -> Color {
        if let guessedArr = mediumGame.guesses[currentQuestion] {
            // so guessedName is whatever the value of the Key >easyGame.guesses[currentQuestion]
            if guessedArr != optionalArr {
                return Color.white
            } else if guessedArr == alphabetizedTypesArr(array: currentQuestion.type) {
                return Color.green.opacity(0.5)

            } else {
                return Color.red.opacity(0.5)
            }
        } else {
            return Color.white
        }
    }
    
    func rightWrongText(optionalArr: [String]) -> String {
        if let guessedArr = mediumGame.guesses[currentQuestion] {
            // so guessedArr is whatever is whatever the value of the Key >easyGame.guesses[currentQuestion]
            if guessedArr != optionalArr {
                return ""
            } else if guessedArr == alphabetizedTypesArr(array: currentQuestion.type) {
                return "✅"
            } else {
                return "❌"
            }
        } else {
            return ""
        }
    }
    
    
    func correctAnswerNotification(optionalName: [String]) -> String {
        if let guessedTypes = mediumGame.guesses[currentQuestion] {
            // so guessedName is whatever the value is for the Key >easyGame.guesses[currentQuestion]
            if guessedTypes != optionalName {
                if currentQuestion.type.count < 2 {
                    return "The correct answer was: \(currentQuestion.type[0])"
                } else {
                    return "The correct answer was: \(currentQuestion.type[0]), \(currentQuestion.type[1])"
                }
            } else if guessedTypes == alphabetizedTypesArr(array: currentQuestion.type) {
                return ""
            } else {
                return ""
            }
        } else {
            return ""
        }
    }
                                        
}
