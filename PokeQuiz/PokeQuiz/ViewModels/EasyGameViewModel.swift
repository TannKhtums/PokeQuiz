//
//  EasyGameViewModel.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/5/22.
//

import SwiftUI

class EasyGameViewModel: ObservableObject {
    
    @Published var easyGame: EasyGame

    var correctGuesses: Int {
        easyGame.guessCount.correct
    }
    
    var incorrectGuesses: Int {
        easyGame.guessCount.incorrect
    }
    
    var currentQuestion: Pokemon {
        easyGame.currentQuestion[0]
    }
    
    var pokemon: [Pokemon]
    var pokemonShuffled: [Pokemon]
    // see if I can connect these variables to EasyGame so that when they are changed it changes the view too
    
    
    init() {
        let easyGame = EasyGame()
        self.easyGame  = easyGame
        self.pokemon = easyGame.currentQuestion
        self.pokemonShuffled = pokemon.shuffled()
    }
    
    var questionProgressText: String {
        "\(easyGame.currentQuestionIndex + 1) / \(easyGame.numberOfQuestions)"
    }
    
    var guessWasMade: Bool {
        if let _ = easyGame.guesses[currentQuestion] {
            return true
        } else {
            return false
        }
    }
    
    var gameIsOver: Bool {
        easyGame.isOver
    }
    
    func makeGuess(name: String) {
        easyGame.makeGuessForCurrentQuestion(name: name)
    }
    //    makeGuess(atIndex index: Int) simply communicates the guessed index to the game game property for the currently displayed question.
    
    func displayNextScreen() {
        easyGame.updateGameStatus()
    }
    //displayNextScreen() will update the game’s status and will be called when the user taps on the button to proceed to the next screen.
    
    func shufflePokemonAgain() {
        easyGame.reshufflePokemonAfterGuess()
        self.pokemon = easyGame.currentQuestion
        self.pokemonShuffled = pokemon.shuffled()
    }
    
    func color(optionalName: String) -> Color {
        if let guessedName = easyGame.guesses[currentQuestion] {
            // so guessedName is whatever is whatever the value of the Key >easyGame.guesses[currentQuestion]
            if guessedName != optionalName {
                return Color.white
            } else if guessedName == currentQuestion.name {
                return Color.green.opacity(0.5)

            } else {
                return Color.red.opacity(0.5)
            }
        } else {
            return Color.white
        }
    }
    
    func rightWrongText(optionalName: String) -> String {
        if let guessedName = easyGame.guesses[currentQuestion] {
            // so guessedName is whatever is whatever the value of the Key >easyGame.guesses[currentQuestion]
            if guessedName != optionalName {
                return ""
            } else if guessedName == currentQuestion.name {
                return "✅"
            } else {
                return "❌"
            }
        } else {
            return ""
        }
    }
                                          
}
