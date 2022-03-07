//
//  EasyGame.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/5/22.
//

import Foundation

struct EasyGame {
    
    private(set) var currentQuestionIndex = 0
    var guesses = [Pokemon: String]()
    private(set) var isOver = false
    private var pokemon = Pokemon.allPokemon.shuffled()
    

    var guessCount: (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0,0)
        for (pokemon, guessedName) in guesses {
            // pokemon, guessedName are the assigned names for the dictionary pairs in guesses that I'm looping over
            if pokemon.name == guessedName {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count
    }

    var numberOfQuestions = 10
    
    var currentQuestion: [Pokemon] { [
        pokemon[0],
        pokemon[1],
        pokemon[2],
        pokemon[3]
    ]
    }
    
    mutating func reshufflePokemonAfterGuess() {
        print("Current Array:", pokemon[0].name, pokemon[1].name, pokemon[2].name, pokemon[3].name)
        pokemon.removeFirst(1)
        pokemon = pokemon.shuffled()
    }
    
    mutating func makeGuessForCurrentQuestion(name: String) {
        guesses[(currentQuestion[0])] = name
    }
    // adds current guess to guesses to check
    
    mutating func updateGameStatus() {
        if currentQuestionIndex < numberOfQuestions - 1 {
            currentQuestionIndex += 1
//            Pokemon.allPokemon.shuffled()
        } else {
            isOver = true
        }
    }
    
}
