//
//  Level4ViewModel.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 3/9/22.
//

import SwiftUI

class HardViewModel: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode = false

    @Published var hardGame: HardGame
    //whenever mediumGame is changed, publish those changes to anything listening

    @Published var selectedTypes: [String] = []
    
    var correctGuesses: Int {
        hardGame.guessCount.correct
    }

    var incorrectGuesses: Int {
        hardGame.guessCount.incorrect
    }

    var currentQuestion: Pokemon {
        hardGame.currentQuestion
    }

    var pokemon: Pokemon
    // see if I can connect these variables to HardGame so that when they are changed it changes the view too


    init() {
        let hardGame = HardGame()
        self.hardGame  = hardGame
        self.pokemon = hardGame.currentQuestion
    }

    var questionProgressText: String {
        "\(hardGame.currentQuestionIndex + 1) / \(hardGame.numberOfQuestions)"
    }

    var guessWasMade: Bool {
        if let _ = hardGame.guesses[currentQuestion] {
            return true
        } else {
            return false
        }
    }


    var gameIsOver: Bool {
        hardGame.isOver
    }

    func alphabetizedTypesArr(array: [String]) -> [String] {
        let alphabetizedArr = array.sorted()
        return alphabetizedArr
    }

    func unselectOrAddType(type: String) {
        if let index = selectedTypes.firstIndex(of: type) {
                selectedTypes.remove(at: index)
            } else {
            selectedTypes.append(type)
        }
    }

    func makeGuess(typesArr: [String]) {
        hardGame.makeGuessForCurrentQuestion(typesArr: alphabetizedTypesArr(array: typesArr))
    }
    //    makeGuess() simply communicates the guess to the game game property for the currently displayed question.

    func displayNextScreen() {
        hardGame.updateGameStatus()
    }
    //displayNextScreen() will update the game’s status and will be called when the user taps on the button to proceed to the next screen.

    func assignNextQuestion() {
        self.pokemon = hardGame.currentQuestion
    }

    func color() -> Color {
        if let guessedArr = hardGame.guesses[currentQuestion] {
            // so guessedName is whatever the value of the Key >easyGame.guesses[currentQuestion]
            if guessedArr == currentQuestion.weaknesses.sorted() {
                return Color.green.opacity(0.5)
            } else {
                return Color.red.opacity(0.5)
            }
        } else {
            return (isDarkMode ? Color.black : Color.white)
        }
    }

    func rightWrongText() -> String {
        if let guessedArr = hardGame.guesses[currentQuestion] {
            // so guessedArr is whatever is whatever the value of the Key >easyGame.guesses[currentQuestion]
            if guessedArr == currentQuestion.weaknesses.sorted() {
                return "✅"
            } else {
                return "❌"
            }
        } else {
            return ""
        }
    }


    func correctAnswerNotification() -> String {
        if let guessedTypes = hardGame.guesses[currentQuestion] {
            // so guessedName is whatever the value is for the Key >easyGame.guesses[currentQuestion]
            if guessedTypes == currentQuestion.weaknesses.sorted() {
                if currentQuestion.superWeaknesses.count > 0 {
                    return """
                        "Correct!
                        Fun Fact: These types are x4 as effective against \(currentQuestion.name):
                        \(currentQuestion.superWeaknesses.joined(separator: ", "))
                        """
                } else {
                    return ""
                }
            } else {
                return """
                        \(currentQuestion.name)'s type is \(currentQuestion.type.joined(separator: ", "))
                        Weaknesses: \(currentQuestion.weaknesses.joined(separator: ", "))
                        """
            }
        } else {
            return ""
        }
    }
}
