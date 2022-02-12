//
//  EasyScoreViewModel.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/9/22.
//

import Foundation

struct EasyScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
