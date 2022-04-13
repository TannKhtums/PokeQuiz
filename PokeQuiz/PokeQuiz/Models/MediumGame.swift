//
//  MediumGame.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/16/22.
//

import Foundation

struct MediumGame {
    
    private(set) var currentQuestionIndex = 0
    var guesses = [Pokemon: [String]]()
    private(set) var isOver = false
    private var pokemon: [Pokemon] = []
    
    init() {
        if let savedSelectedPokemonArr = UserDefaults.standard.data(forKey: "selectedPokemonArr") {
            if let loadedSelectedPokemonArr = try? JSONDecoder().decode([Pokemon].self, from: savedSelectedPokemonArr) {
                self.pokemon = loadedSelectedPokemonArr.shuffled()
            }
        }
    }
    

    var guessCount: (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0,0)
        
        func alphabetizedTypesArrCorrectAnswer(array: [String]) -> [String] {
            let alphabetizedArr = array.sorted()
            return alphabetizedArr
        }

        for (pokemon, guessedTypes) in guesses {
            // pokemon, guessedName are the assigned names for the dictionary pairs in guesses that I'm looping over
            if pokemon.type.sorted() == guessedTypes {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        
        return count
    }

    var numberOfQuestions = 10
    
    var currentQuestion: Pokemon {
        pokemon[currentQuestionIndex]
    }
    
//    mutating func alphabetizedTypesArrCorrectAnswer (array: [String]) -> [String] {
//        let alphabetizedArr = array.sorted()
//        return alphabetizedArr
//    }
    
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
