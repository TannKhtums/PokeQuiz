//
//  MediumGame.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/16/22.
//

import Foundation

struct MediumGame {
    
    private(set) var currentQuestionIndex = 0
    var guesses = [PokemonTypes: [String]]()
    private(set) var isOver = false
    private var pokemon = PokemonTypes.allPokemon.shuffled()
    

    var guessCount: (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0,0)
        for (pokemon, guessedTypes) in guesses {
            // pokemon, guessedName are the assigned names for the dictionary pairs in guesses that I'm looping over
            if pokemon.type == guessedTypes {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count
    }

    var numberOfQuestions = 10
    
    var currentQuestion: PokemonTypes {
        pokemon[currentQuestionIndex]
    }
    
    mutating func reshufflePokemonAfterGuess() {
        pokemon = pokemon.shuffled()
    }
    
    mutating func makeGuessForCurrentQuestion(typesArr: [String]) {
        guesses[(currentQuestion)] = typesArr
    }
    // adds current guess to guesses to check
    
    mutating func updateGameStatus() {
        if currentQuestionIndex < numberOfQuestions - 1 {
            currentQuestionIndex += 1
        } else {
            isOver = true
        }
    }
    
}
