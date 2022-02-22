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
    
//    @Published var selectedToggle = false
//    @Published var superDuperToggle = false
    
    var selectedTypes: [String] = []
    
    func trimArray() {
        if selectedTypes.count > 2 {
            print("greater than 2")
            selectedTypes.remove(at: 0)
            print(selectedTypes)
        }
    }

    var correctGuesses: Int {
        mediumGame.guessCount.correct
    }
    
    var incorrectGuesses: Int {
        mediumGame.guessCount.incorrect
    }
    
    var currentQuestion: PokemonTypes {
        mediumGame.currentQuestion
    }
    
    var pokemon: PokemonTypes
    // see if I can connect these variables to EasyGame so that when they are changed it changes the view too
    
    
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
    
    func makeGuess(typesArr: [String]) {
        mediumGame.makeGuessForCurrentQuestion(typesArr: typesArr)
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
            } else if guessedArr == currentQuestion.type {
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
            // so guessedName is whatever is whatever the value of the Key >easyGame.guesses[currentQuestion]
            if guessedArr != optionalArr {
                return ""
            } else if guessedArr == currentQuestion.type {
                return "✅"
            } else {
                return "❌"
            }
        } else {
            return ""
        }
    }
                                          
}
