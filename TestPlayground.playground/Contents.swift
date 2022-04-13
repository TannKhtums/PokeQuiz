import Cocoa

//
//  TypesUtility.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 3/15/22.
//

import Foundation

func generateWeaknessResistanceArrays(typesArr: [String]) {
    var weaknessesArr: [String] = []
    var superWeaknesses: [String] = []
    var resistanceArr: [String] = []
    var superResistance: [String] = []
    
    var currentTypes: [String: Double] = [
        "Normal": 1.0,
        "Fire": 1.0,
        "Water": 1.0,
        "Grass": 1.0,
        "Electric": 1.0,
        "Ice": 1.0,
        "Fighting": 1.0,
        "Poison": 1.0,
        "Ground": 1.0,
        "Flying": 1.0,
        "Bug": 1.0,
        "Psychic": 1.0,
        "Rock": 1.0,
        "Ghost": 1.0,
        "Dark": 1.0,
        "Dragon": 1.0,
        "Steel": 1.0,
        "Fairy": 1.0
    ]
    
    func updateCurrentPokemonDictionaryStrengthWeaknesses(typeArr: [String]) {
        typeArr.forEach { type in
            if type == "Normal" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 2
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 0
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Fire" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 0.5
                currentTypes["Water"]! *= 2
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 0.5
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 2
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 2
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Water" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 0.5
                currentTypes["Water"]! *= 0.5
                currentTypes["Grass"]! *= 2
                currentTypes["Electric"]! *= 2
                currentTypes["Ice"]! *= 0.5
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 0.5
                currentTypes["Fairy"]! *= 1
            }
            if type == "Grass" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 2
                currentTypes["Water"]! *= 0.5
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 0.5
                currentTypes["Ice"]! *= 2
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 2
                currentTypes["Ground"]! *= 0.5
                currentTypes["Flying"]! *= 2
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 2
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Electric" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 0.5
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 2
                currentTypes["Flying"]! *= 0.5
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Ice" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 2
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 0.5
                currentTypes["Fighting"]! *= 2
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 2
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 2
                currentTypes["Fairy"]! *= 1
            }
            if type == "Fighting" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 2
                currentTypes["Psychic"]! *= 2
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 0.5
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 0.5
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 2
            }
            if type == "Poison" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 0.5
                currentTypes["Poison"]! *= 0.5
                currentTypes["Ground"]! *= 2
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 2
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 0.5
            }
            if type == "Ground" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 2
                currentTypes["Grass"]! *= 2
                currentTypes["Electric"]! *= 0
                currentTypes["Ice"]! *= 2
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 0.5
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 0.5
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Flying" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 2
                currentTypes["Ice"]! *= 2
                currentTypes["Fighting"]! *= 0.5
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 0
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 2
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Psychic" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 0.5
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 0.5
                currentTypes["Bug"]! *= 2
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 2
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 2
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Bug" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 2
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 0.5
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 0.5
                currentTypes["Flying"]! *= 2
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 2
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Rock" {
                currentTypes["Normal"]! *= 0.5
                currentTypes["Fire"]! *= 0.5
                currentTypes["Water"]! *= 2
                currentTypes["Grass"]! *= 2
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 2
                currentTypes["Poison"]! *= 0.5
                currentTypes["Ground"]! *= 2
                currentTypes["Flying"]! *= 0.5
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 2
                currentTypes["Fairy"]! *= 1
            }
            if type == "Ghost" {
                currentTypes["Normal"]! *= 0
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 0
                currentTypes["Poison"]! *= 0.5
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 2
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 2
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Dragon" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 0.5
                currentTypes["Water"]! *= 0.5
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 0.5
                currentTypes["Ice"]! *= 2
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 2
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 2
            }
            if type == "Dark" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 2
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 0
                currentTypes["Bug"]! *= 2
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 0.5
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 0.5
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 2
            }
            if type == "Steel" {
                currentTypes["Normal"]! *= 0.5
                currentTypes["Fire"]! *= 2
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 0.5
                currentTypes["Fighting"]! *= 2
                currentTypes["Poison"]! *= 0
                currentTypes["Ground"]! *= 2
                currentTypes["Flying"]! *= 0.5
                currentTypes["Psychic"]! *= 0.5
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 0.5
                currentTypes["Ghost"]! *= 0.5
                currentTypes["Dragon"]! *= 0.5
                currentTypes["Dark"]! *= 0.5
                currentTypes["Steel"]! *= 0.5
                currentTypes["Fairy"]! *= 0.5
            }
            if type == "Fairy" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 0.5
                currentTypes["Poison"]! *= 2
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 0
                currentTypes["Dark"]! *= 0.5
                currentTypes["Steel"]! *= 2
                currentTypes["Fairy"]! *= 1
            }
        }
    }
    
    func calculateStrengthsWeaknesses(typesDictionary: [String: Double]) {
        for(key, value) in typesDictionary {
            if value > 1.0 {
                weaknessesArr.append(key)
            }
            if value > 2.0 {
                superWeaknesses.append(key)
            }
            if value < 1.0 {
                resistanceArr.append(key)
            }
            if value < 0.5 {
                superResistance.append(key)
            }
        }
    }
    updateCurrentPokemonDictionaryStrengthWeaknesses(typeArr: typesArr)
    calculateStrengthsWeaknesses(typesDictionary: currentTypes)
    print("Weakness Array: \(weaknessesArr), Super Weakness: \(superWeaknesses), Resistance: \(resistanceArr), Super Resistance: \(superResistance)")
}

    var weaknessesArr: [String] = []
    var superWeaknesses: [String] = []
    var resistanceArr: [String] = []
    var superResistance: [String] = []

    var currentTypes: [String: Double] = [
        "Normal": 1.0,
        "Fire": 1.0,
        "Water": 1.0,
        "Grass": 1.0,
        "Electric": 1.0,
        "Ice": 1.0,
        "Fighting": 1.0,
        "Poison": 1.0,
        "Ground": 1.0,
        "Flying": 1.0,
        "Bug": 1.0,
        "Psychic": 1.0,
        "Rock": 1.0,
        "Ghost": 1.0,
        "Dark": 1.0,
        "Dragon": 1.0,
        "Steel": 1.0,
        "Fairy": 1.0
    ]

    func calculateStrengthsWeaknesses(typesDictionary: [String: Double]) {
        for(key, value) in typesDictionary {
            if value > 1.0 {
                weaknessesArr.append(key)
            }
            if value > 2.0 {
                superWeaknesses.append(key)
            }
            if value < 1.0 {
                resistanceArr.append(key)
            }
            if value < 0.5 {
                superResistance.append(key)
            }
        }
    }

    func updateCurrentPokemonDictionaryStrengthWeaknesses(typeArr: [String]) {
        typeArr.forEach { type in
            if type == "Normal" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 2
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 0
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Fire" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 0.5
                currentTypes["Water"]! *= 2
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 0.5
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 2
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 2
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Water" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 0.5
                currentTypes["Water"]! *= 0.5
                currentTypes["Grass"]! *= 2
                currentTypes["Electric"]! *= 2
                currentTypes["Ice"]! *= 0.5
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 0.5
                currentTypes["Fairy"]! *= 1
            }
            if type == "Grass" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 2
                currentTypes["Water"]! *= 0.5
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 0.5
                currentTypes["Ice"]! *= 2
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 2
                currentTypes["Ground"]! *= 0.5
                currentTypes["Flying"]! *= 2
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 2
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Electric" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 0.5
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 2
                currentTypes["Flying"]! *= 0.5
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Ice" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 2
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 0.5
                currentTypes["Fighting"]! *= 2
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 2
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 2
                currentTypes["Fairy"]! *= 1
            }
            if type == "Fighting" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 2
                currentTypes["Psychic"]! *= 2
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 0.5
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 0.5
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 2
            }
            if type == "Poison" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 0.5
                currentTypes["Poison"]! *= 0.5
                currentTypes["Ground"]! *= 2
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 2
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 0.5
            }
            if type == "Ground" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 2
                currentTypes["Grass"]! *= 2
                currentTypes["Electric"]! *= 0
                currentTypes["Ice"]! *= 2
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 0.5
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 0.5
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Flying" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 2
                currentTypes["Ice"]! *= 2
                currentTypes["Fighting"]! *= 0.5
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 0
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 2
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Psychic" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 0.5
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 0.5
                currentTypes["Bug"]! *= 2
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 2
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 2
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Bug" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 2
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 0.5
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 0.5
                currentTypes["Flying"]! *= 2
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 2
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Rock" {
                currentTypes["Normal"]! *= 0.5
                currentTypes["Fire"]! *= 0.5
                currentTypes["Water"]! *= 2
                currentTypes["Grass"]! *= 2
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 2
                currentTypes["Poison"]! *= 0.5
                currentTypes["Ground"]! *= 2
                currentTypes["Flying"]! *= 0.5
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 2
                currentTypes["Fairy"]! *= 1
            }
            if type == "Ghost" {
                currentTypes["Normal"]! *= 0
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 0
                currentTypes["Poison"]! *= 0.5
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 2
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 2
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 1
            }
            if type == "Dragon" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 0.5
                currentTypes["Water"]! *= 0.5
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 0.5
                currentTypes["Ice"]! *= 2
                currentTypes["Fighting"]! *= 1
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 1
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 2
                currentTypes["Dark"]! *= 1
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 2
            }
            if type == "Dark" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 2
                currentTypes["Poison"]! *= 1
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 0
                currentTypes["Bug"]! *= 2
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 0.5
                currentTypes["Dragon"]! *= 1
                currentTypes["Dark"]! *= 0.5
                currentTypes["Steel"]! *= 1
                currentTypes["Fairy"]! *= 2
            }
            if type == "Steel" {
                currentTypes["Normal"]! *= 0.5
                currentTypes["Fire"]! *= 2
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 0.5
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 0.5
                currentTypes["Fighting"]! *= 2
                currentTypes["Poison"]! *= 0
                currentTypes["Ground"]! *= 2
                currentTypes["Flying"]! *= 0.5
                currentTypes["Psychic"]! *= 0.5
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 0.5
                currentTypes["Ghost"]! *= 0.5
                currentTypes["Dragon"]! *= 0.5
                currentTypes["Dark"]! *= 0.5
                currentTypes["Steel"]! *= 0.5
                currentTypes["Fairy"]! *= 0.5
            }
            if type == "Fairy" {
                currentTypes["Normal"]! *= 1
                currentTypes["Fire"]! *= 1
                currentTypes["Water"]! *= 1
                currentTypes["Grass"]! *= 1
                currentTypes["Electric"]! *= 1
                currentTypes["Ice"]! *= 1
                currentTypes["Fighting"]! *= 0.5
                currentTypes["Poison"]! *= 2
                currentTypes["Ground"]! *= 1
                currentTypes["Flying"]! *= 1
                currentTypes["Psychic"]! *= 1
                currentTypes["Bug"]! *= 0.5
                currentTypes["Rock"]! *= 1
                currentTypes["Ghost"]! *= 1
                currentTypes["Dragon"]! *= 0
                currentTypes["Dark"]! *= 0.5
                currentTypes["Steel"]! *= 2
                currentTypes["Fairy"]! *= 1
            }
        }
    }

    func resetTypesArrays() {
        currentTypes = [
            "Normal": 1.0,
            "Fire": 1.0,
            "Water": 1.0,
            "Grass": 1.0,
            "Electric": 1.0,
            "Ice": 1.0,
            "Fighting": 1.0,
            "Poison": 1.0,
            "Ground": 1.0,
            "Flying": 1.0,
            "Bug": 1.0,
            "Psychic": 1.0,
            "Rock": 1.0,
            "Ghost": 1.0,
            "Dark": 1.0,
            "Dragon": 1.0,
            "Steel": 1.0,
            "Fairy": 1.0
        ];
        weaknessesArr = [];
        superWeaknesses = [];
        resistanceArr = [];
        superResistance = []
    }


generateWeaknessResistanceArrays(typesArr: ["Fire", "Ice"])
