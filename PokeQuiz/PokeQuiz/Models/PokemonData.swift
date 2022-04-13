//
//  PokemonDataModel.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/4/22.
//

import Foundation
import SwiftUI

struct Pokemon: Hashable, Codable {
    // must be hashable in order to be a key in a dictionary
    
    var name: String
    var number: String
    var type: [String]
    var weaknesses: [String] = []
    var superWeaknesses: [String] = []
    var resistance: [String] = []
    var superResistance: [String] = []
    var region: String
    
    init(name: String, number: String, type: [String], region: String) {
        self.name = name
        self.number = number
        self.type = type
        self.region = region
        weaknesses = generateWeaknessResistanceArrays(typesArr: self.type)[0]
        superWeaknesses = generateWeaknessResistanceArrays(typesArr: self.type)[1]
        resistance = generateWeaknessResistanceArrays(typesArr: self.type)[2]
        superResistance = generateWeaknessResistanceArrays(typesArr: self.type)[3]
    }
    
    static var allPokemon = [
        Pokemon(name: "Bulbasaur", number: "001", type: ["Grass", "Poison"], region: "Kanto"),
        Pokemon(name: "Ivysaur", number: "002", type: ["Grass", "Poison"], region: "Kanto"),
        Pokemon(name: "Venusaur", number: "003", type: ["Grass", "Poison"], region: "Kanto"),
        Pokemon(name: "Charmander", number: "004", type: ["Fire"], region: "Kanto"),
        Pokemon(name: "Charmeleon", number: "005", type: ["Fire"], region: "Kanto"),
        Pokemon(name: "Charizard", number: "006", type: ["Fire", "Flying"], region: "Kanto"),
        Pokemon(name: "Squirtle", number: "007", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Wartortle", number: "008", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Blastoise", number: "009", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Caterpie", number: "010", type: ["Bug"], region: "Kanto"),
        Pokemon(name: "Metapod", number: "011", type: ["Bug"], region: "Kanto"),
        Pokemon(name: "Butterfree", number: "012", type: ["Bug", "Flying"], region: "Kanto"),
        Pokemon(name: "Weedle", number: "013", type: ["Bug", "Poison"], region: "Kanto"),
        Pokemon(name: "Kakuna", number: "014", type: ["Bug", "Poison"], region: "Kanto"),
        Pokemon(name: "Beedrill", number: "015", type: ["Bug", "Poison"], region: "Kanto"),
        Pokemon(name: "Pidgey", number: "016", type: ["Normal", "Flying"], region: "Kanto"),
        Pokemon(name: "Pidgeotto", number: "017", type: ["Normal", "Flying"], region: "Kanto"),
        Pokemon(name: "Pidgeot", number: "018", type: ["Normal", "Flying"], region: "Kanto"),
        Pokemon(name: "Rattata", number: "019", type: ["Normal"], region: "Kanto"),
        Pokemon(name: "Raticate", number: "020", type: ["Normal"], region: "Kanto"),
        Pokemon(name: "Spearow", number: "021", type: ["Normal", "Flying"], region: "Kanto"),
        Pokemon(name: "Fearow", number: "022", type: ["Normal", "Flying"], region: "Kanto"),
        Pokemon(name: "Ekans", number: "023", type: ["Poison"], region: "Kanto"),
        Pokemon(name: "Arbok", number: "024", type: ["Poison"], region: "Kanto"),
        Pokemon(name: "Pikachu", number: "025", type: ["Electric"], region: "Kanto"),
        Pokemon(name: "Raichu", number: "026", type: ["Electric"], region: "Kanto"),
        Pokemon(name: "Sandshrew", number: "027", type: ["Ground"], region: "Kanto"),
        Pokemon(name: "Sandslash", number: "028", type: ["Ground"], region: "Kanto"),
        Pokemon(name: "Nidoran♀", number: "029", type: ["Poison"], region: "Kanto"),
        Pokemon(name: "Nidorina", number: "030", type: ["Poison"], region: "Kanto"),
        Pokemon(name: "Nidoqueen", number: "031", type: ["Poison", "Ground"], region: "Kanto"),
        Pokemon(name: "Nidoran♂", number: "032", type: ["Poison"], region: "Kanto"),
        Pokemon(name: "Nidorino", number: "033", type: ["Poison"], region: "Kanto"),
        Pokemon(name: "Nidoking", number: "034", type: ["Poison", "Ground"], region: "Kanto"),
        Pokemon(name: "Clefairy", number: "035", type: ["Fairy"], region: "Kanto"),
        Pokemon(name: "Clefable", number: "036", type: ["Fairy"], region: "Kanto"),
        Pokemon(name: "Vulpix", number: "037", type: ["Fire"], region: "Kanto"),
        Pokemon(name: "Ninetales", number: "038", type: ["Fire"], region: "Kanto"),
        Pokemon(name: "Jigglypuff", number: "039", type: ["Normal", "Fairy"], region: "Kanto"),
        Pokemon(name: "Wigglytuff", number: "040", type: ["Normal", "Fairy"], region: "Kanto"),
        Pokemon(name: "Zubat", number: "041", type: ["Poison", "Flying"], region: "Kanto"),
        Pokemon(name: "Golbat", number: "042", type: ["Poison", "Flying"], region: "Kanto"),
        Pokemon(name: "Oddish", number: "043", type: ["Grass", "Poison"], region: "Kanto"),
        Pokemon(name: "Gloom", number: "044", type: ["Grass", "Poison"], region: "Kanto"),
        Pokemon(name: "Vileplume", number: "045", type: ["Grass", "Poison"], region: "Kanto"),
        Pokemon(name: "Paras", number: "046", type: ["Bug", "Grass"], region: "Kanto"),
        Pokemon(name: "Parasect", number: "047", type: ["Bug", "Grass"], region: "Kanto"),
        Pokemon(name: "Venonat", number: "048", type: ["Bug", "Poison"], region: "Kanto"),
        Pokemon(name: "Venomoth", number: "049", type: ["Bug", "Poison"], region: "Kanto"),
        Pokemon(name: "Diglett", number: "050", type: ["Ground"], region: "Kanto"),
        Pokemon(name: "Dugtrio", number: "051", type: ["Ground"], region: "Kanto"),
        Pokemon(name: "Meowth", number: "052", type: ["Normal"], region: "Kanto"),
        Pokemon(name: "Persian", number: "053", type: ["Normal"], region: "Kanto"),
        Pokemon(name: "Psyduck", number: "054", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Golduck", number: "055", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Mankey", number: "056", type: ["Fighting"], region: "Kanto"),
        Pokemon(name: "Primeape", number: "057", type: ["Fighting"], region: "Kanto"),
        Pokemon(name: "Growlithe", number: "058", type: ["Fire"], region: "Kanto"),
        Pokemon(name: "Arcanine", number: "059", type: ["Fire"], region: "Kanto"),
        Pokemon(name: "Poliwag", number: "060", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Poliwhirl", number: "061", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Poliwrath", number: "062", type: ["Water", "Fighting"], region: "Kanto"),
        Pokemon(name: "Abra", number: "063", type: ["Psychic"], region: "Kanto"),
        Pokemon(name: "Kadabra", number: "064", type: ["Psychic"], region: "Kanto"),
        Pokemon(name: "Alakazam", number: "065", type: ["Psychic"], region: "Kanto"),
        Pokemon(name: "Machop", number: "066", type: ["Fighting"], region: "Kanto"),
        Pokemon(name: "Machoke", number: "067", type: ["Fighting"], region: "Kanto"),
        Pokemon(name: "Machamp", number: "068", type: ["Fighting"], region: "Kanto"),
        Pokemon(name: "Bellsprout", number: "069", type: ["Grass", "Poison"], region: "Kanto"),
        Pokemon(name: "Weepinbell", number: "070", type: ["Grass", "Poison"], region: "Kanto"),
        Pokemon(name: "Victreebel", number: "071", type: ["Grass", "Poison"], region: "Kanto"),
        Pokemon(name: "Tentacool", number: "072", type: ["Water", "Poison"], region: "Kanto"),
        Pokemon(name: "Tentacruel", number: "073", type: ["Water", "Poison"], region: "Kanto"),
        Pokemon(name: "Geodude", number: "074", type: ["Rock", "Ground"], region: "Kanto"),
        Pokemon(name: "Graveler", number: "075", type: ["Rock", "Ground"], region: "Kanto"),
        Pokemon(name: "Golem", number: "076", type: ["Rock", "Ground"], region: "Kanto"),
        Pokemon(name: "Ponyta", number: "077", type: ["Fire"], region: "Kanto"),
        Pokemon(name: "Rapidash", number: "078", type: ["Fire"], region: "Kanto"),
        Pokemon(name: "Slowpoke", number: "079", type: ["Water", "Psychic"], region: "Kanto"),
        Pokemon(name: "Slowbro", number: "080", type: ["Water", "Psychic"], region: "Kanto"),
        Pokemon(name: "Magnemite", number: "081", type: ["Electric", "Steel"], region: "Kanto"),
        Pokemon(name: "Magneton", number: "082", type: ["Electric", "Steel"], region: "Kanto"),
        Pokemon(name: "Farfetch’d", number: "083", type: ["Normal", "Flying"], region: "Kanto"),
        Pokemon(name: "Doduo", number: "084", type: ["Normal", "Flying"], region: "Kanto"),
        Pokemon(name: "Dodrio", number: "085", type: ["Normal", "Flying"], region: "Kanto"),
        Pokemon(name: "Seel", number: "086", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Dewgong", number: "087", type: ["Water", "Ice"], region: "Kanto"),
        Pokemon(name: "Grimer", number: "088", type: ["Poison"], region: "Kanto"),
        Pokemon(name: "Muk", number: "089", type: ["Poison"], region: "Kanto"),
        Pokemon(name: "Shellder", number: "090", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Cloyster", number: "091", type: ["Water", "Ice"], region: "Kanto"),
        Pokemon(name: "Gastly", number: "092", type: ["Ghost", "Poison"], region: "Kanto"),
        Pokemon(name: "Haunter", number: "093", type: ["Ghost", "Poison"], region: "Kanto"),
        Pokemon(name: "Gengar", number: "094", type: ["Ghost", "Poison"], region: "Kanto"),
        Pokemon(name: "Onix", number: "095", type: ["Rock", "Ground"], region: "Kanto"),
        Pokemon(name: "Drowzee", number: "096", type: ["Psychic"], region: "Kanto"),
        Pokemon(name: "Hypno", number: "097", type: ["Psychic"], region: "Kanto"),
        Pokemon(name: "Krabby", number: "098", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Kingler", number: "099", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Voltorb", number: "100", type: ["Electric"], region: "Kanto"),
        Pokemon(name: "Electrode", number: "101", type: ["Electric"], region: "Kanto"),
        Pokemon(name: "Exeggcute", number: "102", type: ["Grass", "Psychic"], region: "Kanto"),
        Pokemon(name: "Exeggutor", number: "103", type: ["Grass", "Psychic"], region: "Kanto"),
        Pokemon(name: "Cubone", number: "104", type: ["Ground"], region: "Kanto"),
        Pokemon(name: "Marowak", number: "105", type: ["Ground"], region: "Kanto"),
        Pokemon(name: "Hitmonlee", number: "106", type: ["Fighting"], region: "Kanto"),
        Pokemon(name: "Hitmonchan", number: "107", type: ["Fighting"], region: "Kanto"),
        Pokemon(name: "Lickitung", number: "108", type: ["Normal"], region: "Kanto"),
        Pokemon(name: "Koffing", number: "109", type: ["Poison"], region: "Kanto"),
        Pokemon(name: "Weezing", number: "110", type: ["Poison"], region: "Kanto"),
        Pokemon(name: "Rhyhorn", number: "111", type: ["Ground", "Rock"], region: "Kanto"),
        Pokemon(name: "Rhydon", number: "112", type: ["Ground", "Rock"], region: "Kanto"),
        Pokemon(name: "Chansey", number: "113", type: ["Normal"], region: "Kanto"),
        Pokemon(name: "Tangela", number: "114", type: ["Grass"], region: "Kanto"),
        Pokemon(name: "Kangaskhan", number: "115", type: ["Normal"], region: "Kanto"),
        Pokemon(name: "Horsea", number: "116", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Seadra", number: "117", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Goldeen", number: "118", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Seaking", number: "119", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Staryu", number: "120", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Starmie", number: "121", type: ["Water", "Psychic"], region: "Kanto"),
        Pokemon(name: "Mr. Mime", number: "122", type: ["Psychic", "Fairy"], region: "Kanto"),
        Pokemon(name: "Scyther", number: "123", type: ["Bug", "Flying"], region: "Kanto"),
        Pokemon(name: "Jynx", number: "124", type: ["Ice", "Psychic"], region: "Kanto"),
        Pokemon(name: "Electabuzz", number: "125", type: ["Electric"], region: "Kanto"),
        Pokemon(name: "Magmar", number: "126", type: ["Fire"], region: "Kanto"),
        Pokemon(name: "Pinsir", number: "127", type: ["Bug"], region: "Kanto"),
        Pokemon(name: "Tauros", number: "128", type: ["Normal"], region: "Kanto"),
        Pokemon(name: "Magikarp", number: "129", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Gyarados", number: "130", type: ["Water", "Flying"], region: "Kanto"),
        Pokemon(name: "Lapras", number: "131", type: ["Water", "Ice"], region: "Kanto"),
        Pokemon(name: "Ditto", number: "132", type: ["Normal"], region: "Kanto"),
        Pokemon(name: "Eevee", number: "133", type: ["Normal"], region: "Kanto"),
        Pokemon(name: "Vaporeon", number: "134", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Jolteon", number: "135", type: ["Electric"], region: "Kanto"),
        Pokemon(name: "Flareon", number: "136", type: ["Fire"], region: "Kanto"),
        Pokemon(name: "Porygon", number: "137", type: ["Normal"], region: "Kanto"),
        Pokemon(name: "Omanyte", number: "138", type: ["Rock", "Water"], region: "Kanto"),
        Pokemon(name: "Omastar", number: "139", type: ["Rock", "Water"], region: "Kanto"),
        Pokemon(name: "Kabuto", number: "140", type: ["Rock", "Water"], region: "Kanto"),
        Pokemon(name: "Kabutops", number: "141", type: ["Rock", "Water"], region: "Kanto"),
        Pokemon(name: "Aerodactyl", number: "142", type: ["Rock", "Flying"], region: "Kanto"),
        Pokemon(name: "Snorlax", number: "143", type: ["Normal"], region: "Kanto"),
        Pokemon(name: "Articuno", number: "144", type: ["Ice", "Flying"], region: "Kanto"),
        Pokemon(name: "Zapdos", number: "145", type: ["Electric", "Flying"], region: "Kanto"),
        Pokemon(name: "Moltres", number: "146", type: ["Fire", "Flying"], region: "Kanto"),
        Pokemon(name: "Dratini", number: "147", type: ["Dragon"], region: "Kanto"),
        Pokemon(name: "Dragonair", number: "148", type: ["Dragon"], region: "Kanto"),
        Pokemon(name: "Dragonite", number: "149", type: ["Dragon", "Flying"], region: "Kanto"),
        Pokemon(name: "Mewtwo", number: "150", type: ["Psychic"], region: "Kanto"),
        Pokemon(name: "Mew", number: "151", type: ["Psychic"], region: "Kanto"),
        Pokemon(name: "Chikorita", number: "152", type: ["Grass"], region: "Johto"),
        Pokemon(name: "Bayleef", number: "153", type: ["Grass"], region: "Johto"),
        Pokemon(name: "Meganium", number: "154", type: ["Grass"], region: "Johto"),
        Pokemon(name: "Cyndaquil", number: "155", type: ["Fire"], region: "Johto"),
        Pokemon(name: "Quilava", number: "156", type: ["Fire"], region: "Johto"),
        Pokemon(name: "Typhlosion", number: "157", type: ["Fire"], region: "Johto"),
        Pokemon(name: "Totodile", number: "158", type: ["Water"], region: "Johto"),
        Pokemon(name: "Croconaw", number: "159", type: ["Water"], region: "Johto"),
        Pokemon(name: "Feraligatr", number: "160", type: ["Water"], region: "Johto"),
        Pokemon(name: "Sentret", number: "161", type: ["Normal"], region: "Johto"),
        Pokemon(name: "Furret", number: "162", type: ["Normal"], region: "Johto"),
        Pokemon(name: "Hoothoot", number: "163", type: ["Normal", "Flying"], region: "Johto"),
        Pokemon(name: "Noctowl", number: "164", type: ["Normal", "Flying"], region: "Johto"),
        Pokemon(name: "Ledyba", number: "165", type: ["Bug", "Flying"], region: "Johto"),
        Pokemon(name: "Ledian", number: "166", type: ["Bug", "Flying"], region: "Johto"),
        Pokemon(name: "Spinarak", number: "167", type: ["Bug", "Poison"], region: "Johto"),
        Pokemon(name: "Ariados", number: "168", type: ["Bug", "Poison"], region: "Johto"),
        Pokemon(name: "Crobat", number: "169", type: ["Poison", "Flying"], region: "Johto"),
        Pokemon(name: "Chinchou", number: "170", type: ["Water", "Electric"], region: "Johto"),
        Pokemon(name: "Lanturn", number: "171", type: ["Water", "Electric"], region: "Johto"),
        Pokemon(name: "Pichu", number: "172", type: ["Electric"], region: "Johto"),
        Pokemon(name: "Cleffa", number: "173", type: ["Fairy"], region: "Johto"),
        Pokemon(name: "Igglybuff", number: "174", type: ["Normal", "Fairy"], region: "Johto"),
        Pokemon(name: "Togepi", number: "175", type: ["Fairy"], region: "Johto"),
        Pokemon(name: "Togetic", number: "176", type: ["Fairy", "Flying"], region: "Johto"),
        Pokemon(name: "Natu", number: "177", type: ["Psychic", "Flying"], region: "Johto"),
        Pokemon(name: "Xatu", number: "178", type: ["Psychic", "Flying"], region: "Johto"),
        Pokemon(name: "Mareep", number: "179", type: ["Electric"], region: "Johto"),
        Pokemon(name: "Flaaffy", number: "180", type: ["Electric"], region: "Johto"),
        Pokemon(name: "Ampharos", number: "181", type: ["Electric"], region: "Johto"),
        Pokemon(name: "Bellossom", number: "182", type: ["Grass"], region: "Johto"),
        Pokemon(name: "Marill", number: "183", type: ["Water", "Fairy"], region: "Johto"),
        Pokemon(name: "Azumarill", number: "184", type: ["Water", "Fairy"], region: "Johto"),
        Pokemon(name: "Sudowoodo", number: "185", type: ["Rock"], region: "Johto"),
        Pokemon(name: "Politoed", number: "186", type: ["Water"], region: "Johto"),
        Pokemon(name: "Hoppip", number: "187", type: ["Grass", "Flying"], region: "Johto"),
        Pokemon(name: "Skiploom", number: "188", type: ["Grass", "Flying"], region: "Johto"),
        Pokemon(name: "Jumpluff", number: "189", type: ["Grass", "Flying"], region: "Johto"),
        Pokemon(name: "Aipom", number: "190", type: ["Normal"], region: "Johto"),
        Pokemon(name: "Sunkern", number: "191", type: ["Grass"], region: "Johto"),
        Pokemon(name: "Sunflora", number: "192", type: ["Grass"], region: "Johto"),
        Pokemon(name: "Yanma", number: "193", type: ["Bug", "Flying"], region: "Johto"),
        Pokemon(name: "Wooper", number: "194", type: ["Water", "Ground"], region: "Johto"),
        Pokemon(name: "Quagsire", number: "195", type: ["Water", "Ground"], region: "Johto"),
        Pokemon(name: "Espeon", number: "196", type: ["Psychic"], region: "Johto"),
        Pokemon(name: "Umbreon", number: "197", type: ["Dark"], region: "Johto"),
        Pokemon(name: "Murkrow", number: "198", type: ["Dark", "Flying"], region: "Johto"),
        Pokemon(name: "Slowking", number: "199", type: ["Water", "Psychic"], region: "Johto"),
        Pokemon(name: "Misdreavus", number: "200", type: ["Ghost"], region: "Johto"),
        Pokemon(name: "Unown", number: "201", type: ["Psychic"], region: "Johto"),
        Pokemon(name: "Wobbuffet", number: "202", type: ["Psychic"], region: "Johto"),
        Pokemon(name: "Girafarig", number: "203", type: ["Normal", "Psychic"], region: "Johto"),
        Pokemon(name: "Pineco", number: "204", type: ["Bug"], region: "Johto"),
        Pokemon(name: "Forretress", number: "205", type: ["Bug", "Steel"], region: "Johto"),
        Pokemon(name: "Dunsparce", number: "206", type: ["Normal"], region: "Johto"),
        Pokemon(name: "Gligar", number: "207", type: ["Ground", "Flying"], region: "Johto"),
        Pokemon(name: "Steelix", number: "208", type: ["Steel", "Ground"], region: "Johto"),
        Pokemon(name: "Snubbull", number: "209", type: ["Fairy"], region: "Johto"),
        Pokemon(name: "Granbull", number: "210", type: ["Fairy"], region: "Johto"),
        Pokemon(name: "Qwilfish", number: "211", type: ["Water", "Poison"], region: "Johto"),
        Pokemon(name: "Scizor", number: "212", type: ["Bug", "Steel"], region: "Johto"),
        Pokemon(name: "Shuckle", number: "213", type: ["Bug", "Rock"], region: "Johto"),
        Pokemon(name: "Heracross", number: "214", type: ["Bug", "Fighting"], region: "Johto"),
        Pokemon(name: "Sneasel", number: "215", type: ["Dark", "Ice"], region: "Johto"),
        Pokemon(name: "Teddiursa", number: "216", type: ["Normal"], region: "Johto"),
        Pokemon(name: "Ursaring", number: "217", type: ["Normal"], region: "Johto"),
        Pokemon(name: "Slugma", number: "218", type: ["Fire"], region: "Johto"),
        Pokemon(name: "Magcargo", number: "219", type: ["Fire", "Rock"], region: "Johto"),
        Pokemon(name: "Swinub", number: "220", type: ["Ice", "Ground"], region: "Johto"),
        Pokemon(name: "Piloswine", number: "221", type: ["Ice", "Ground"], region: "Johto"),
        Pokemon(name: "Corsola", number: "222", type: ["Water", "Rock"], region: "Johto"),
        Pokemon(name: "Remoraid", number: "223", type: ["Water"], region: "Johto"),
        Pokemon(name: "Octillery", number: "224", type: ["Water"], region: "Johto"),
        Pokemon(name: "Delibird", number: "225", type: ["Ice", "Flying"], region: "Johto"),
        Pokemon(name: "Mantine", number: "226", type: ["Water", "Flying"], region: "Johto"),
        Pokemon(name: "Skarmory", number: "227", type: ["Steel", "Flying"], region: "Johto"),
        Pokemon(name: "Houndour", number: "228", type: ["Dark", "Fire"], region: "Johto"),
        Pokemon(name: "Houndoom", number: "229", type: ["Dark", "Fire"], region: "Johto"),
        Pokemon(name: "Kingdra", number: "230", type: ["Water", "Dragon"], region: "Johto"),
        Pokemon(name: "Phanpy", number: "231", type: ["Ground"], region: "Johto"),
        Pokemon(name: "Donphan", number: "232", type: ["Ground"], region: "Johto"),
        Pokemon(name: "Porygon2", number: "233", type: ["Normal"], region: "Johto"),
        Pokemon(name: "Stantler", number: "234", type: ["Normal"], region: "Johto"),
        Pokemon(name: "Smeargle", number: "235", type: ["Normal"], region: "Johto"),
        Pokemon(name: "Tyrogue", number: "236", type: ["Fighting"], region: "Johto"),
        Pokemon(name: "Hitmontop", number: "237", type: ["Fighting"], region: "Johto"),
        Pokemon(name: "Smoochum", number: "238", type: ["Ice", "Psychic"], region: "Johto"),
        Pokemon(name: "Elekid", number: "239", type: ["Electric"], region: "Johto"),
        Pokemon(name: "Magby", number: "240", type: ["Fire"], region: "Johto"),
        Pokemon(name: "Miltank", number: "241", type: ["Normal"], region: "Johto"),
        Pokemon(name: "Blissey", number: "242", type: ["Normal"], region: "Johto"),
        Pokemon(name: "Raikou", number: "243", type: ["Electric"], region: "Johto"),
        Pokemon(name: "Entei", number: "244", type: ["Fire"], region: "Johto"),
        Pokemon(name: "Suicune", number: "245", type: ["Water"], region: "Johto"),
        Pokemon(name: "Larvitar", number: "246", type: ["Rock", "Ground"], region: "Johto"),
        Pokemon(name: "Pupitar", number: "247", type: ["Rock", "Ground"], region: "Johto"),
        Pokemon(name: "Tyranitar", number: "248", type: ["Rock", "Dark"], region: "Johto"),
        Pokemon(name: "Lugia", number: "249", type: ["Psychic", "Flying"], region: "Johto"),
        Pokemon(name: "Ho-Oh", number: "250", type: ["Fire", "Flying"], region: "Johto"),
        Pokemon(name: "Celebi", number: "251", type: ["Psychic", "Grass"], region: "Johto"),
        Pokemon(name: "Treecko", number: "252", type: ["Grass"], region: "Hoenn"),
        Pokemon(name: "Grovyle", number: "253", type: ["Grass"], region: "Hoenn"),
        Pokemon(name: "Sceptile", number: "254", type: ["Grass"], region: "Hoenn"),
        Pokemon(name: "Torchic", number: "255", type: ["Fire"], region: "Hoenn"),
        Pokemon(name: "Combusken", number: "256", type: ["Fire", "Fighting"], region: "Hoenn"),
        Pokemon(name: "Blaziken", number: "257", type: ["Fire", "Fighting"], region: "Hoenn"),
        Pokemon(name: "Mudkip", number: "258", type: ["Water"], region: "Hoenn"),
        Pokemon(name: "Marshtomp", number: "259", type: ["Water", "Ground"], region: "Hoenn"),
        Pokemon(name: "Swampert", number: "260", type: ["Water", "Ground"], region: "Hoenn"),
        Pokemon(name: "Poochyena", number: "261", type: ["Dark"], region: "Hoenn"),
        Pokemon(name: "Mightyena", number: "262", type: ["Dark"], region: "Hoenn"),
        Pokemon(name: "Zigzagoon", number: "263", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Linoone", number: "264", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Wurmple", number: "265", type: ["Bug"], region: "Hoenn"),
        Pokemon(name: "Silcoon", number: "266", type: ["Bug"], region: "Hoenn"),
        Pokemon(name: "Beautifly", number: "267", type: ["Bug", "Flying"], region: "Hoenn"),
        Pokemon(name: "Cascoon", number: "268", type: ["Bug"], region: "Hoenn"),
        Pokemon(name: "Dustox", number: "269", type: ["Bug", "Poison"], region: "Hoenn"),
        Pokemon(name: "Lotad", number: "270", type: ["Water", "Grass"], region: "Hoenn"),
        Pokemon(name: "Lombre", number: "271", type: ["Water", "Grass"], region: "Hoenn"),
        Pokemon(name: "Ludicolo", number: "272", type: ["Water", "Grass"], region: "Hoenn"),
        Pokemon(name: "Seedot", number: "273", type: ["Grass"], region: "Hoenn"),
        Pokemon(name: "Nuzleaf", number: "274", type: ["Grass", "Dark"], region: "Hoenn"),
        Pokemon(name: "Shiftry", number: "275", type: ["Grass", "Dark"], region: "Hoenn"),
        Pokemon(name: "Taillow", number: "276", type: ["Normal", "Flying"], region: "Hoenn"),
        Pokemon(name: "Swellow", number: "277", type: ["Normal", "Flying"], region: "Hoenn"),
        Pokemon(name: "Wingull", number: "278", type: ["Water", "Flying"], region: "Hoenn"),
        Pokemon(name: "Pelipper", number: "279", type: ["Water", "Flying"], region: "Hoenn"),
        Pokemon(name: "Ralts", number: "280", type: ["Psychic", "Fairy"], region: "Hoenn"),
        Pokemon(name: "Kirlia", number: "281", type: ["Psychic", "Fairy"], region: "Hoenn"),
        Pokemon(name: "Gardevoir", number: "282", type: ["Psychic", "Fairy"], region: "Hoenn"),
        Pokemon(name: "Surskit", number: "283", type: ["Bug", "Water"], region: "Hoenn"),
        Pokemon(name: "Masquerain", number: "284", type: ["Bug", "Flying"], region: "Hoenn"),
        Pokemon(name: "Shroomish", number: "285", type: ["Grass"], region: "Hoenn"),
        Pokemon(name: "Breloom", number: "286", type: ["Grass", "Fighting"], region: "Hoenn"),
        Pokemon(name: "Slakoth", number: "287", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Vigoroth", number: "288", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Slaking", number: "289", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Nincada", number: "290", type: ["Bug", "Ground"], region: "Hoenn"),
        Pokemon(name: "Ninjask", number: "291", type: ["Bug", "Flying"], region: "Hoenn"),
        Pokemon(name: "Shedinja", number: "292", type: ["Bug", "Ghost"], region: "Hoenn"),
        Pokemon(name: "Whismur", number: "293", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Loudred", number: "294", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Exploud", number: "295", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Makuhita", number: "296", type: ["Fighting"], region: "Hoenn"),
        Pokemon(name: "Hariyama", number: "297", type: ["Fighting"], region: "Hoenn"),
        Pokemon(name: "Azurill", number: "298", type: ["Normal", "Fairy"], region: "Hoenn"),
        Pokemon(name: "Nosepass", number: "299", type: ["Rock"], region: "Hoenn"),
        Pokemon(name: "Skitty", number: "300", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Delcatty", number: "301", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Sableye", number: "302", type: ["Dark", "Ghost"], region: "Hoenn"),
        Pokemon(name: "Mawile", number: "303", type: ["Steel", "Fairy"], region: "Hoenn"),
        Pokemon(name: "Aron", number: "304", type: ["Steel", "Rock"], region: "Hoenn"),
        Pokemon(name: "Lairon", number: "305", type: ["Steel", "Rock"], region: "Hoenn"),
        Pokemon(name: "Aggron", number: "306", type: ["Steel", "Rock"], region: "Hoenn"),
        Pokemon(name: "Meditite", number: "307", type: ["Fighting", "Psychic"], region: "Hoenn"),
        Pokemon(name: "Medicham", number: "308", type: ["Fighting", "Psychic"], region: "Hoenn"),
        Pokemon(name: "Electrike", number: "309", type: ["Electric"], region: "Hoenn"),
        Pokemon(name: "Manectric", number: "310", type: ["Electric"], region: "Hoenn"),
        Pokemon(name: "Plusle", number: "311", type: ["Electric"], region: "Hoenn"),
        Pokemon(name: "Minun", number: "312", type: ["Electric"], region: "Hoenn"),
        Pokemon(name: "Volbeat", number: "313", type: ["Bug"], region: "Hoenn"),
        Pokemon(name: "Illumise", number: "314", type: ["Bug"], region: "Hoenn"),
        Pokemon(name: "Roselia", number: "315", type: ["Grass", "Poison"], region: "Hoenn"),
        Pokemon(name: "Gulpin", number: "316", type: ["Poison"], region: "Hoenn"),
        Pokemon(name: "Swalot", number: "317", type: ["Poison"], region: "Hoenn"),
        Pokemon(name: "Carvanha", number: "318", type: ["Water", "Dark"], region: "Hoenn"),
        Pokemon(name: "Sharpedo", number: "319", type: ["Water", "Dark"], region: "Hoenn"),
        Pokemon(name: "Wailmer", number: "320", type: ["Water"], region: "Hoenn"),
        Pokemon(name: "Wailord", number: "321", type: ["Water"], region: "Hoenn"),
        Pokemon(name: "Numel", number: "322", type: ["Fire", "Ground"], region: "Hoenn"),
        Pokemon(name: "Camerupt", number: "323", type: ["Fire", "Ground"], region: "Hoenn"),
        Pokemon(name: "Torkoal", number: "324", type: ["Fire"], region: "Hoenn"),
        Pokemon(name: "Spoink", number: "325", type: ["Psychic"], region: "Hoenn"),
        Pokemon(name: "Grumpig", number: "326", type: ["Psychic"], region: "Hoenn"),
        Pokemon(name: "Spinda", number: "327", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Trapinch", number: "328", type: ["Ground"], region: "Hoenn"),
        Pokemon(name: "Vibrava", number: "329", type: ["Ground", "Dragon"], region: "Hoenn"),
        Pokemon(name: "Flygon", number: "330", type: ["Ground", "Dragon"], region: "Hoenn"),
        Pokemon(name: "Cacnea", number: "331", type: ["Grass"], region: "Hoenn"),
        Pokemon(name: "Cacturne", number: "332", type: ["Grass", "Dark"], region: "Hoenn"),
        Pokemon(name: "Swablu", number: "333", type: ["Normal", "Flying"], region: "Hoenn"),
        Pokemon(name: "Altaria", number: "334", type: ["Dragon", "Flying"], region: "Hoenn"),
        Pokemon(name: "Zangoose", number: "335", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Seviper", number: "336", type: ["Poison"], region: "Hoenn"),
        Pokemon(name: "Lunatone", number: "337", type: ["Rock", "Psychic"], region: "Hoenn"),
        Pokemon(name: "Solrock", number: "338", type: ["Rock", "Psychic"], region: "Hoenn"),
        Pokemon(name: "Barboach", number: "339", type: ["Water", "Ground"], region: "Hoenn"),
        Pokemon(name: "Whiscash", number: "340", type: ["Water", "Ground"], region: "Hoenn"),
        Pokemon(name: "Corphish", number: "341", type: ["Water"], region: "Hoenn"),
        Pokemon(name: "Crawdaunt", number: "342", type: ["Water", "Dark"], region: "Hoenn"),
        Pokemon(name: "Baltoy", number: "343", type: ["Ground", "Psychic"], region: "Hoenn"),
        Pokemon(name: "Claydol", number: "344", type: ["Ground", "Psychic"], region: "Hoenn"),
        Pokemon(name: "Lileep", number: "345", type: ["Rock", "Grass"], region: "Hoenn"),
        Pokemon(name: "Cradily", number: "346", type: ["Rock", "Grass"], region: "Hoenn"),
        Pokemon(name: "Anorith", number: "347", type: ["Rock", "Bug"], region: "Hoenn"),
        Pokemon(name: "Armaldo", number: "348", type: ["Rock", "Bug"], region: "Hoenn"),
        Pokemon(name: "Feebas", number: "349", type: ["Water"], region: "Hoenn"),
        Pokemon(name: "Milotic", number: "350", type: ["Water"], region: "Hoenn"),
        Pokemon(name: "Castform", number: "351", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Kecleon", number: "352", type: ["Normal"], region: "Hoenn"),
        Pokemon(name: "Shuppet", number: "353", type: ["Ghost"], region: "Hoenn"),
        Pokemon(name: "Banette", number: "354", type: ["Ghost"], region: "Hoenn"),
        Pokemon(name: "Duskull", number: "355", type: ["Ghost"], region: "Hoenn"),
        Pokemon(name: "Dusclops", number: "356", type: ["Ghost"], region: "Hoenn"),
        Pokemon(name: "Tropius", number: "357", type: ["Grass", "Flying"], region: "Hoenn"),
        Pokemon(name: "Chimecho", number: "358", type: ["Psychic"], region: "Hoenn"),
        Pokemon(name: "Absol", number: "359", type: ["Dark"], region: "Hoenn"),
        Pokemon(name: "Wynaut", number: "360", type: ["Psychic"], region: "Hoenn"),
        Pokemon(name: "Snorunt", number: "361", type: ["Ice"], region: "Hoenn"),
        Pokemon(name: "Glalie", number: "362", type: ["Ice"], region: "Hoenn"),
        Pokemon(name: "Spheal", number: "363", type: ["Ice", "Water"], region: "Hoenn"),
        Pokemon(name: "Sealeo", number: "364", type: ["Ice", "Water"], region: "Hoenn"),
        Pokemon(name: "Walrein", number: "365", type: ["Ice", "Water"], region: "Hoenn"),
        Pokemon(name: "Clamperl", number: "366", type: ["Water"], region: "Hoenn"),
        Pokemon(name: "Huntail", number: "367", type: ["Water"], region: "Hoenn"),
        Pokemon(name: "Gorebyss", number: "368", type: ["Water"], region: "Hoenn"),
        Pokemon(name: "Relicanth", number: "369", type: ["Water", "Rock"], region: "Hoenn"),
        Pokemon(name: "Luvdisc", number: "370", type: ["Water"], region: "Hoenn"),
        Pokemon(name: "Bagon", number: "371", type: ["Dragon"], region: "Hoenn"),
        Pokemon(name: "Shelgon", number: "372", type: ["Dragon"], region: "Hoenn"),
        Pokemon(name: "Salamence", number: "373", type: ["Dragon", "Flying"], region: "Hoenn"),
        Pokemon(name: "Beldum", number: "374", type: ["Steel", "Psychic"], region: "Hoenn"),
        Pokemon(name: "Metang", number: "375", type: ["Steel", "Psychic"], region: "Hoenn"),
        Pokemon(name: "Metagross", number: "376", type: ["Steel", "Psychic"], region: "Hoenn"),
        Pokemon(name: "Regirock", number: "377", type: ["Rock"], region: "Hoenn"),
        Pokemon(name: "Regice", number: "378", type: ["Ice"], region: "Hoenn"),
        Pokemon(name: "Registeel", number: "379", type: ["Steel"], region: "Hoenn"),
        Pokemon(name: "Latias", number: "380", type: ["Dragon", "Psychic"], region: "Hoenn"),
        Pokemon(name: "Latios", number: "381", type: ["Dragon", "Psychic"], region: "Hoenn"),
        Pokemon(name: "Kyogre", number: "382", type: ["Water"], region: "Hoenn"),
        Pokemon(name: "Groudon", number: "383", type: ["Ground"], region: "Hoenn"),
        Pokemon(name: "Rayquaza", number: "384", type: ["Dragon", "Flying"], region: "Hoenn"),
        Pokemon(name: "Jirachi", number: "385", type: ["Steel", "Psychic"], region: "Hoenn"),
        Pokemon(name: "Deoxys", number: "386", type: ["Psychic"], region: "Hoenn"),
        Pokemon(name: "Turtwig", number: "387", type: ["Grass"], region: "Sinnoh"),
        Pokemon(name: "Grotle", number: "388", type: ["Grass"], region: "Sinnoh"),
        Pokemon(name: "Torterra", number: "389", type: ["Grass", "Ground"], region: "Sinnoh"),
        Pokemon(name: "Chimchar", number: "390", type: ["Fire"], region: "Sinnoh"),
        Pokemon(name: "Monferno", number: "391", type: ["Fire", "Fighting"], region: "Sinnoh"),
        Pokemon(name: "Infernape", number: "392", type: ["Fire", "Fighting"], region: "Sinnoh"),
        Pokemon(name: "Piplup", number: "393", type: ["Water"], region: "Sinnoh"),
        Pokemon(name: "Prinplup", number: "394", type: ["Water"], region: "Sinnoh"),
        Pokemon(name: "Empoleon", number: "395", type: ["Water", "Steel"], region: "Sinnoh"),
        Pokemon(name: "Starly", number: "396", type: ["Normal", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Staravia", number: "397", type: ["Normal", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Staraptor", number: "398", type: ["Normal", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Bidoof", number: "399", type: ["Normal"], region: "Sinnoh"),
        Pokemon(name: "Bibarel", number: "400", type: ["Normal", "Water"], region: "Sinnoh"),
        Pokemon(name: "Kricketot", number: "401", type: ["Bug"], region: "Sinnoh"),
        Pokemon(name: "Kricketune", number: "402", type: ["Bug"], region: "Sinnoh"),
        Pokemon(name: "Shinx", number: "403", type: ["Electric"], region: "Sinnoh"),
        Pokemon(name: "Luxio", number: "404", type: ["Electric"], region: "Sinnoh"),
        Pokemon(name: "Luxray", number: "405", type: ["Electric"], region: "Sinnoh"),
        Pokemon(name: "Budew", number: "406", type: ["Grass", "Poison"], region: "Sinnoh"),
        Pokemon(name: "Roserade", number: "407", type: ["Grass", "Poison"], region: "Sinnoh"),
        Pokemon(name: "Cranidos", number: "408", type: ["Rock"], region: "Sinnoh"),
        Pokemon(name: "Rampardos", number: "409", type: ["Rock"], region: "Sinnoh"),
        Pokemon(name: "Shieldon", number: "410", type: ["Rock", "Steel"], region: "Sinnoh"),
        Pokemon(name: "Bastiodon", number: "411", type: ["Rock", "Steel"], region: "Sinnoh"),
        Pokemon(name: "Burmy", number: "412", type: ["Bug"], region: "Sinnoh"),
        Pokemon(name: "Wormadam", number: "413", type: ["Bug", "Grass"], region: "Sinnoh"),
        Pokemon(name: "Mothim", number: "414", type: ["Bug", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Combee", number: "415", type: ["Bug", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Vespiquen", number: "416", type: ["Bug", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Pachirisu", number: "417", type: ["Electric"], region: "Sinnoh"),
        Pokemon(name: "Buizel", number: "418", type: ["Water"], region: "Sinnoh"),
        Pokemon(name: "Floatzel", number: "419", type: ["Water"], region: "Sinnoh"),
        Pokemon(name: "Cherubi", number: "420", type: ["Grass"], region: "Sinnoh"),
        Pokemon(name: "Cherrim", number: "421", type: ["Grass"], region: "Sinnoh"),
        Pokemon(name: "Shellos", number: "422", type: ["Water"], region: "Sinnoh"),
        Pokemon(name: "Gastrodon", number: "423", type: ["Water", "Ground"], region: "Sinnoh"),
        Pokemon(name: "Ambipom", number: "424", type: ["Normal"], region: "Sinnoh"),
        Pokemon(name: "Drifloon", number: "425", type: ["Ghost", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Drifblim", number: "426", type: ["Ghost", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Buneary", number: "427", type: ["Normal"], region: "Sinnoh"),
        Pokemon(name: "Lopunny", number: "428", type: ["Normal"], region: "Sinnoh"),
        Pokemon(name: "Mismagius", number: "429", type: ["Ghost"], region: "Sinnoh"),
        Pokemon(name: "Honchkrow", number: "430", type: ["Dark", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Glameow", number: "431", type: ["Normal"], region: "Sinnoh"),
        Pokemon(name: "Purugly", number: "432", type: ["Normal"], region: "Sinnoh"),
        Pokemon(name: "Chingling", number: "433", type: ["Psychic"], region: "Sinnoh"),
        Pokemon(name: "Stunky", number: "434", type: ["Poison", "Dark"], region: "Sinnoh"),
        Pokemon(name: "Skuntank", number: "435", type: ["Poison", "Dark"], region: "Sinnoh"),
        Pokemon(name: "Bronzor", number: "436", type: ["Steel", "Psychic"], region: "Sinnoh"),
        Pokemon(name: "Bronzong", number: "437", type: ["Steel", "Psychic"], region: "Sinnoh"),
        Pokemon(name: "Bonsly", number: "438", type: ["Rock"], region: "Sinnoh"),
        Pokemon(name: "Mime Jr.", number: "439", type: ["Psychic", "Fairy"], region: "Sinnoh"),
        Pokemon(name: "Happiny", number: "440", type: ["Normal"], region: "Sinnoh"),
        Pokemon(name: "Chatot", number: "441", type: ["Normal", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Spiritomb", number: "442", type: ["Ghost", "Dark"], region: "Sinnoh"),
        Pokemon(name: "Gible", number: "443", type: ["Dragon", "Ground"], region: "Sinnoh"),
        Pokemon(name: "Gabite", number: "444", type: ["Dragon", "Ground"], region: "Sinnoh"),
        Pokemon(name: "Garchomp", number: "445", type: ["Dragon", "Ground"], region: "Sinnoh"),
        Pokemon(name: "Munchlax", number: "446", type: ["Normal"], region: "Sinnoh"),
        Pokemon(name: "Riolu", number: "447", type: ["Fighting"], region: "Sinnoh"),
        Pokemon(name: "Lucario", number: "448", type: ["Fighting", "Steel"], region: "Sinnoh"),
        Pokemon(name: "Hippopotas", number: "449", type: ["Ground"], region: "Sinnoh"),
        Pokemon(name: "Hippowdon", number: "450", type: ["Ground"], region: "Sinnoh"),
        Pokemon(name: "Skorupi", number: "451", type: ["Poison", "Bug"], region: "Sinnoh"),
        Pokemon(name: "Drapion", number: "452", type: ["Poison", "Dark"], region: "Sinnoh"),
        Pokemon(name: "Croagunk", number: "453", type: ["Poison", "Fighting"], region: "Sinnoh"),
        Pokemon(name: "Toxicroak", number: "454", type: ["Poison", "Fighting"], region: "Sinnoh"),
        Pokemon(name: "Carnivine", number: "455", type: ["Grass"], region: "Sinnoh"),
        Pokemon(name: "Finneon", number: "456", type: ["Water"], region: "Sinnoh"),
        Pokemon(name: "Lumineon", number: "457", type: ["Water"], region: "Sinnoh"),
        Pokemon(name: "Mantyke", number: "458", type: ["Water", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Snover", number: "459", type: ["Grass", "Ice"], region: "Sinnoh"),
        Pokemon(name: "Abomasnow", number: "460", type: ["Grass", "Ice"], region: "Sinnoh"),
        Pokemon(name: "Weavile", number: "461", type: ["Dark", "Ice"], region: "Sinnoh"),
        Pokemon(name: "Magnezone", number: "462", type: ["Electric", "Steel"], region: "Sinnoh"),
        Pokemon(name: "Lickilicky", number: "463", type: ["Normal"], region: "Sinnoh"),
        Pokemon(name: "Rhyperior", number: "464", type: ["Ground", "Rock"], region: "Sinnoh"),
        Pokemon(name: "Tangrowth", number: "465", type: ["Grass"], region: "Sinnoh"),
        Pokemon(name: "Electivire", number: "466", type: ["Electric"], region: "Sinnoh"),
        Pokemon(name: "Magmortar", number: "467", type: ["Fire"], region: "Sinnoh"),
        Pokemon(name: "Togekiss", number: "468", type: ["Fairy", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Yanmega", number: "469", type: ["Bug", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Leafeon", number: "470", type: ["Grass"], region: "Sinnoh"),
        Pokemon(name: "Glaceon", number: "471", type: ["Ice"], region: "Sinnoh"),
        Pokemon(name: "Gliscor", number: "472", type: ["Ground", "Flying"], region: "Sinnoh"),
        Pokemon(name: "Mamoswine", number: "473", type: ["Ice", "Ground"], region: "Sinnoh"),
        Pokemon(name: "Porygon-Z", number: "474", type: ["Normal"], region: "Sinnoh"),
        Pokemon(name: "Gallade", number: "475", type: ["Psychic", "Fighting"], region: "Sinnoh"),
        Pokemon(name: "Probopass", number: "476", type: ["Rock", "Steel"], region: "Sinnoh"),
        Pokemon(name: "Dusknoir", number: "477", type: ["Ghost"], region: "Sinnoh"),
        Pokemon(name: "Froslass", number: "478", type: ["Ice", "Ghost"], region: "Sinnoh"),
        Pokemon(name: "Rotom", number: "479", type: ["Electric", "Ghost"], region: "Sinnoh"),
        Pokemon(name: "Uxie", number: "480", type: ["Psychic"], region: "Sinnoh"),
        Pokemon(name: "Mesprit", number: "481", type: ["Psychic"], region: "Sinnoh"),
        Pokemon(name: "Azelf", number: "482", type: ["Psychic"], region: "Sinnoh"),
        Pokemon(name: "Dialga", number: "483", type: ["Steel", "Dragon"], region: "Sinnoh"),
        Pokemon(name: "Palkia", number: "484", type: ["Water", "Dragon"], region: "Sinnoh"),
        Pokemon(name: "Heatran", number: "485", type: ["Fire", "Steel"], region: "Sinnoh"),
        Pokemon(name: "Regigigas", number: "486", type: ["Normal"], region: "Sinnoh"),
        Pokemon(name: "Giratina", number: "487", type: ["Ghost", "Dragon"], region: "Sinnoh"),
        Pokemon(name: "Cresselia", number: "488", type: ["Psychic"], region: "Sinnoh"),
        Pokemon(name: "Phione", number: "489", type: ["Water"], region: "Sinnoh"),
        Pokemon(name: "Manaphy", number: "490", type: ["Water"], region: "Sinnoh"),
        Pokemon(name: "Darkrai", number: "491", type: ["Dark"], region: "Sinnoh"),
        Pokemon(name: "Shaymin", number: "492", type: ["Grass"], region: "Sinnoh"),
        Pokemon(name: "Arceus", number: "493", type: ["Normal"], region: "Sinnoh"),
        Pokemon(name: "Victini", number: "494", type: ["Psychic", "Fire"], region: "Sinnoh"),
        Pokemon(name: "Snivy", number: "495", type: ["Grass"], region: "Unova"),
        Pokemon(name: "Servine", number: "496", type: ["Grass"], region: "Unova"),
        Pokemon(name: "Serperior", number: "497", type: ["Grass"], region: "Unova"),
        Pokemon(name: "Tepig", number: "498", type: ["Fire"], region: "Unova"),
        Pokemon(name: "Pignite", number: "499", type: ["Fire", "Fighting"], region: "Unova"),
        Pokemon(name: "Emboar", number: "500", type: ["Fire", "Fighting"], region: "Unova"),
        Pokemon(name: "Oshawott", number: "501", type: ["Water"], region: "Unova"),
        Pokemon(name: "Dewott", number: "502", type: ["Water"], region: "Unova"),
        Pokemon(name: "Samurott", number: "503", type: ["Water"], region: "Unova"),
        Pokemon(name: "Patrat", number: "504", type: ["Normal"], region: "Unova"),
        Pokemon(name: "Watchog", number: "505", type: ["Normal"], region: "Unova"),
        Pokemon(name: "Lillipup", number: "506", type: ["Normal"], region: "Unova"),
        Pokemon(name: "Herdier", number: "507", type: ["Normal"], region: "Unova"),
        Pokemon(name: "Stoutland", number: "508", type: ["Normal"], region: "Unova"),
        Pokemon(name: "Purrloin", number: "509", type: ["Dark"], region: "Unova"),
        Pokemon(name: "Liepard", number: "510", type: ["Dark"], region: "Unova"),
        Pokemon(name: "Pansage", number: "511", type: ["Grass"], region: "Unova"),
        Pokemon(name: "Simisage", number: "512", type: ["Grass"], region: "Unova"),
        Pokemon(name: "Pansear", number: "513", type: ["Fire"], region: "Unova"),
        Pokemon(name: "Simisear", number: "514", type: ["Fire"], region: "Unova"),
        Pokemon(name: "Panpour", number: "515", type: ["Water"], region: "Unova"),
        Pokemon(name: "Simipour", number: "516", type: ["Water"], region: "Unova"),
        Pokemon(name: "Munna", number: "517", type: ["Psychic"], region: "Unova"),
        Pokemon(name: "Musharna", number: "518", type: ["Psychic"], region: "Unova"),
        Pokemon(name: "Pidove", number: "519", type: ["Normal", "Flying"], region: "Unova"),
        Pokemon(name: "Tranquill", number: "520", type: ["Normal", "Flying"], region: "Unova"),
        Pokemon(name: "Unfezant", number: "521", type: ["Normal", "Flying"], region: "Unova"),
        Pokemon(name: "Blitzle", number: "522", type: ["Electric"], region: "Unova"),
        Pokemon(name: "Zebstrika", number: "523", type: ["Electric"], region: "Unova"),
        Pokemon(name: "Roggenrola", number: "524", type: ["Rock"], region: "Unova"),
        Pokemon(name: "Boldore", number: "525", type: ["Rock"], region: "Unova"),
        Pokemon(name: "Gigalith", number: "526", type: ["Rock"], region: "Unova"),
        Pokemon(name: "Woobat", number: "527", type: ["Psychic", "Flying"], region: "Unova"),
        Pokemon(name: "Swoobat", number: "528", type: ["Psychic", "Flying"], region: "Unova"),
        Pokemon(name: "Drilbur", number: "529", type: ["Ground"], region: "Unova"),
        Pokemon(name: "Excadrill", number: "530", type: ["Ground", "Steel"], region: "Unova"),
        Pokemon(name: "Audino", number: "531", type: ["Normal"], region: "Unova"),
        Pokemon(name: "Timburr", number: "532", type: ["Fighting"], region: "Unova"),
        Pokemon(name: "Gurdurr", number: "533", type: ["Fighting"], region: "Unova"),
        Pokemon(name: "Conkeldurr", number: "534", type: ["Fighting"], region: "Unova"),
        Pokemon(name: "Tympole", number: "535", type: ["Water"], region: "Unova"),
        Pokemon(name: "Palpitoad", number: "536", type: ["Water", "Ground"], region: "Unova"),
        Pokemon(name: "Seismitoad", number: "537", type: ["Water", "Ground"], region: "Unova"),
        Pokemon(name: "Throh", number: "538", type: ["Fighting"], region: "Unova"),
        Pokemon(name: "Sawk", number: "539", type: ["Fighting"], region: "Unova"),
        Pokemon(name: "Sewaddle", number: "540", type: ["Bug", "Grass"], region: "Unova"),
        Pokemon(name: "Swadloon", number: "541", type: ["Bug", "Grass"], region: "Unova"),
        Pokemon(name: "Leavanny", number: "542", type: ["Bug", "Grass"], region: "Unova"),
        Pokemon(name: "Venipede", number: "543", type: ["Bug", "Poison"], region: "Unova"),
        Pokemon(name: "Whirlipede", number: "544", type: ["Bug", "Poison"], region: "Unova"),
        Pokemon(name: "Scolipede", number: "545", type: ["Bug", "Poison"], region: "Unova"),
        Pokemon(name: "Cottonee", number: "546", type: ["Grass", "Fairy"], region: "Unova"),
        Pokemon(name: "Whimsicott", number: "547", type: ["Grass", "Fairy"], region: "Unova"),
        Pokemon(name: "Petilil", number: "548", type: ["Grass"], region: "Unova"),
        Pokemon(name: "Lilligant", number: "549", type: ["Grass"], region: "Unova"),
        Pokemon(name: "Basculin", number: "550", type: ["Water"], region: "Unova"),
        Pokemon(name: "Sandile", number: "551", type: ["Ground", "Dark"], region: "Unova"),
        Pokemon(name: "Krokorok", number: "552", type: ["Ground", "Dark"], region: "Unova"),
        Pokemon(name: "Krookodile", number: "553", type: ["Ground", "Dark"], region: "Unova"),
        Pokemon(name: "Darumaka", number: "554", type: ["Fire"], region: "Unova"),
        Pokemon(name: "Darmanitan", number: "555", type: ["Fire"], region: "Unova"),
        Pokemon(name: "Maractus", number: "556", type: ["Grass"], region: "Unova"),
        Pokemon(name: "Dwebble", number: "557", type: ["Bug", "Rock"], region: "Unova"),
        Pokemon(name: "Crustle", number: "558", type: ["Bug", "Rock"], region: "Unova"),
        Pokemon(name: "Scraggy", number: "559", type: ["Dark", "Fighting"], region: "Unova"),
        Pokemon(name: "Scrafty", number: "560", type: ["Dark", "Fighting"], region: "Unova"),
        Pokemon(name: "Sigilyph", number: "561", type: ["Psychic", "Flying"], region: "Unova"),
        Pokemon(name: "Yamask", number: "562", type: ["Ghost"], region: "Unova"),
        Pokemon(name: "Cofagrigus", number: "563", type: ["Ghost"], region: "Unova"),
        Pokemon(name: "Tirtouga", number: "564", type: ["Water", "Rock"], region: "Unova"),
        Pokemon(name: "Carracosta", number: "565", type: ["Water", "Rock"], region: "Unova"),
        Pokemon(name: "Archen", number: "566", type: ["Rock", "Flying"], region: "Unova"),
        Pokemon(name: "Archeops", number: "567", type: ["Rock", "Flying"], region: "Unova"),
        Pokemon(name: "Trubbish", number: "568", type: ["Poison"], region: "Unova"),
        Pokemon(name: "Garbodor", number: "569", type: ["Poison"], region: "Unova"),
        Pokemon(name: "Zorua", number: "570", type: ["Dark"], region: "Unova"),
        Pokemon(name: "Zoroark", number: "571", type: ["Dark"], region: "Unova"),
        Pokemon(name: "Minccino", number: "572", type: ["Normal"], region: "Unova"),
        Pokemon(name: "Cinccino", number: "573", type: ["Normal"], region: "Unova"),
        Pokemon(name: "Gothita", number: "574", type: ["Psychic"], region: "Unova"),
        Pokemon(name: "Gothorita", number: "575", type: ["Psychic"], region: "Unova"),
        Pokemon(name: "Gothitelle", number: "576", type: ["Psychic"], region: "Unova"),
        Pokemon(name: "Solosis", number: "577", type: ["Psychic"], region: "Unova"),
        Pokemon(name: "Duosion", number: "578", type: ["Psychic"], region: "Unova"),
        Pokemon(name: "Reuniclus", number: "579", type: ["Psychic"], region: "Unova"),
        Pokemon(name: "Ducklett", number: "580", type: ["Water", "Flying"], region: "Unova"),
        Pokemon(name: "Swanna", number: "581", type: ["Water", "Flying"], region: "Unova"),
        Pokemon(name: "Vanillite", number: "582", type: ["Ice"], region: "Unova"),
        Pokemon(name: "Vanillish", number: "583", type: ["Ice"], region: "Unova"),
        Pokemon(name: "Vanilluxe", number: "584", type: ["Ice"], region: "Unova"),
        Pokemon(name: "Deerling", number: "585", type: ["Normal", "Grass"], region: "Unova"),
        Pokemon(name: "Sawsbuck", number: "586", type: ["Normal", "Grass"], region: "Unova"),
        Pokemon(name: "Emolga", number: "587", type: ["Electric", "Flying"], region: "Unova"),
        Pokemon(name: "Karrablast", number: "588", type: ["Bug"], region: "Unova"),
        Pokemon(name: "Escavalier", number: "589", type: ["Bug", "Steel"], region: "Unova"),
        Pokemon(name: "Foongus", number: "590", type: ["Grass", "Poison"], region: "Unova"),
        Pokemon(name: "Amoonguss", number: "591", type: ["Grass", "Poison"], region: "Unova"),
        Pokemon(name: "Frillish", number: "592", type: ["Water", "Ghost"], region: "Unova"),
        Pokemon(name: "Jellicent", number: "593", type: ["Water", "Ghost"], region: "Unova"),
        Pokemon(name: "Alomomola", number: "594", type: ["Water"], region: "Unova"),
        Pokemon(name: "Joltik", number: "595", type: ["Bug", "Electric"], region: "Unova"),
        Pokemon(name: "Galvantula", number: "596", type: ["Bug", "Electric"], region: "Unova"),
        Pokemon(name: "Ferroseed", number: "597", type: ["Grass", "Steel"], region: "Unova"),
        Pokemon(name: "Ferrothorn", number: "598", type: ["Grass", "Steel"], region: "Unova"),
        Pokemon(name: "Klink", number: "599", type: ["Steel"], region: "Unova"),
        Pokemon(name: "Klang", number: "600", type: ["Steel"], region: "Unova"),
        Pokemon(name: "Klinklang", number: "601", type: ["Steel"], region: "Unova"),
        Pokemon(name: "Tynamo", number: "602", type: ["Electric"], region: "Unova"),
        Pokemon(name: "Eelektrik", number: "603", type: ["Electric"], region: "Unova"),
        Pokemon(name: "Eelektross", number: "604", type: ["Electric"], region: "Unova"),
        Pokemon(name: "Elgyem", number: "605", type: ["Psychic"], region: "Unova"),
        Pokemon(name: "Beheeyem", number: "606", type: ["Psychic"], region: "Unova"),
        Pokemon(name: "Litwick", number: "607", type: ["Ghost", "Fire"], region: "Unova"),
        Pokemon(name: "Lampent", number: "608", type: ["Ghost", "Fire"], region: "Unova"),
        Pokemon(name: "Chandelure", number: "609", type: ["Ghost", "Fire"], region: "Unova"),
        Pokemon(name: "Axew", number: "610", type: ["Dragon"], region: "Unova"),
        Pokemon(name: "Fraxure", number: "611", type: ["Dragon"], region: "Unova"),
        Pokemon(name: "Haxorus", number: "612", type: ["Dragon"], region: "Unova"),
        Pokemon(name: "Cubchoo", number: "613", type: ["Ice"], region: "Unova"),
        Pokemon(name: "Beartic", number: "614", type: ["Ice"], region: "Unova"),
        Pokemon(name: "Cryogonal", number: "615", type: ["Ice"], region: "Unova"),
        Pokemon(name: "Shelmet", number: "616", type: ["Bug"], region: "Unova"),
        Pokemon(name: "Accelgor", number: "617", type: ["Bug"], region: "Unova"),
        Pokemon(name: "Stunfisk", number: "618", type: ["Ground", "Electric"], region: "Unova"),
        Pokemon(name: "Mienfoo", number: "619", type: ["Fighting"], region: "Unova"),
        Pokemon(name: "Mienshao", number: "620", type: ["Fighting"], region: "Unova"),
        Pokemon(name: "Druddigon", number: "621", type: ["Dragon"], region: "Unova"),
        Pokemon(name: "Golett", number: "622", type: ["Ground", "Ghost"], region: "Unova"),
        Pokemon(name: "Golurk", number: "623", type: ["Ground", "Ghost"], region: "Unova"),
        Pokemon(name: "Pawniard", number: "624", type: ["Dark", "Steel"], region: "Unova"),
        Pokemon(name: "Bisharp", number: "625", type: ["Dark", "Steel"], region: "Unova"),
        Pokemon(name: "Bouffalant", number: "626", type: ["Normal"], region: "Unova"),
        Pokemon(name: "Rufflet", number: "627", type: ["Normal", "Flying"], region: "Unova"),
        Pokemon(name: "Braviary", number: "628", type: ["Normal", "Flying"], region: "Unova"),
        Pokemon(name: "Vullaby", number: "629", type: ["Dark", "Flying"], region: "Unova"),
        Pokemon(name: "Mandibuzz", number: "630", type: ["Dark", "Flying"], region: "Unova"),
        Pokemon(name: "Heatmor", number: "631", type: ["Fire"], region: "Unova"),
        Pokemon(name: "Durant", number: "632", type: ["Bug", "Steel"], region: "Unova"),
        Pokemon(name: "Deino", number: "633", type: ["Dark", "Dragon"], region: "Unova"),
        Pokemon(name: "Zweilous", number: "634", type: ["Dark", "Dragon"], region: "Unova"),
        Pokemon(name: "Hydreigon", number: "635", type: ["Dark", "Dragon"], region: "Unova"),
        Pokemon(name: "Larvesta", number: "636", type: ["Bug", "Fire"], region: "Unova"),
        Pokemon(name: "Volcarona", number: "637", type: ["Bug", "Fire"], region: "Unova"),
        Pokemon(name: "Cobalion", number: "638", type: ["Steel", "Fighting"], region: "Unova"),
        Pokemon(name: "Terrakion", number: "639", type: ["Rock", "Fighting"], region: "Unova"),
        Pokemon(name: "Virizion", number: "640", type: ["Grass", "Fighting"], region: "Unova"),
        Pokemon(name: "Tornadus", number: "641", type: ["Flying"], region: "Unova"),
        Pokemon(name: "Thundurus", number: "642", type: ["Electric", "Flying"], region: "Unova"),
        Pokemon(name: "Reshiram", number: "643", type: ["Dragon", "Fire"], region: "Unova"),
        Pokemon(name: "Zekrom", number: "644", type: ["Dragon", "Electric"], region: "Unova"),
        Pokemon(name: "Landorus", number: "645", type: ["Ground", "Flying"], region: "Unova"),
        Pokemon(name: "Kyurem", number: "646", type: ["Dragon", "Ice"], region: "Unova"),
        Pokemon(name: "Keldeo", number: "647", type: ["Water", "Fighting"], region: "Unova"),
        Pokemon(name: "Meloetta", number: "648", type: ["Normal", "Psychic"], region: "Unova"),
        Pokemon(name: "Genesect", number: "649", type: ["Bug", "Steel"], region: "Unova"),
        Pokemon(name: "Chespin", number: "650", type: ["Grass"], region: "Kalos"),
        Pokemon(name: "Quilladin", number: "651", type: ["Grass"], region: "Kalos"),
        Pokemon(name: "Chesnaught", number: "652", type: ["Grass", "Fighting"], region: "Kalos"),
        Pokemon(name: "Fennekin", number: "653", type: ["Fire"], region: "Kalos"),
        Pokemon(name: "Braixen", number: "654", type: ["Fire"], region: "Kalos"),
        Pokemon(name: "Delphox", number: "655", type: ["Fire", "Psychic"], region: "Kalos"),
        Pokemon(name: "Froakie", number: "656", type: ["Water"], region: "Kalos"),
        Pokemon(name: "Frogadier", number: "657", type: ["Water"], region: "Kalos"),
        Pokemon(name: "Greninja", number: "658", type: ["Water", "Dark"], region: "Kalos"),
        Pokemon(name: "Bunnelby", number: "659", type: ["Normal"], region: "Kalos"),
        Pokemon(name: "Diggersby", number: "660", type: ["Normal", "Ground"], region: "Kalos"),
        Pokemon(name: "Fletchling", number: "661", type: ["Normal", "Flying"], region: "Kalos"),
        Pokemon(name: "Fletchinder", number: "662", type: ["Fire", "Flying"], region: "Kalos"),
        Pokemon(name: "Talonflame", number: "663", type: ["Fire", "Flying"], region: "Kalos"),
        Pokemon(name: "Scatterbug", number: "664", type: ["Bug"], region: "Kalos"),
        Pokemon(name: "Spewpa", number: "665", type: ["Bug"], region: "Kalos"),
        Pokemon(name: "Vivillon", number: "666", type: ["Bug", "Flying"], region: "Kalos"),
        Pokemon(name: "Litleo", number: "667", type: ["Fire", "Normal"], region: "Kalos"),
        Pokemon(name: "Pyroar", number: "668", type: ["Fire", "Normal"], region: "Kalos"),
        Pokemon(name: "Flabébé", number: "669", type: ["Fairy"], region: "Kalos"),
        Pokemon(name: "Floette", number: "670", type: ["Fairy"], region: "Kalos"),
        Pokemon(name: "Florges", number: "671", type: ["Fairy"], region: "Kalos"),
        Pokemon(name: "Skiddo", number: "672", type: ["Grass"], region: "Kalos"),
        Pokemon(name: "Gogoat", number: "673", type: ["Grass"], region: "Kalos"),
        Pokemon(name: "Pancham", number: "674", type: ["Fighting"], region: "Kalos"),
        Pokemon(name: "Pangoro", number: "675", type: ["Fighting", "Dark"], region: "Kalos"),
        Pokemon(name: "Furfrou", number: "676", type: ["Normal"], region: "Kalos"),
        Pokemon(name: "Espurr", number: "677", type: ["Psychic"], region: "Kalos"),
        Pokemon(name: "Meowstic", number: "678", type: ["Psychic"], region: "Kalos"),
        Pokemon(name: "Honedge", number: "679", type: ["Steel", "Ghost"], region: "Kalos"),
        Pokemon(name: "Doublade", number: "680", type: ["Steel", "Ghost"], region: "Kalos"),
        Pokemon(name: "Aegislash", number: "681", type: ["Steel", "Ghost"], region: "Kalos"),
        Pokemon(name: "Spritzee", number: "682", type: ["Fairy"], region: "Kalos"),
        Pokemon(name: "Aromatisse", number: "683", type: ["Fairy"], region: "Kalos"),
        Pokemon(name: "Swirlix", number: "684", type: ["Fairy"], region: "Kalos"),
        Pokemon(name: "Slurpuff", number: "685", type: ["Fairy"], region: "Kalos"),
        Pokemon(name: "Inkay", number: "686", type: ["Dark", "Psychic"], region: "Kalos"),
        Pokemon(name: "Malamar", number: "687", type: ["Dark", "Psychic"], region: "Kalos"),
        Pokemon(name: "Binacle", number: "688", type: ["Rock", "Water"], region: "Kalos"),
        Pokemon(name: "Barbaracle", number: "689", type: ["Rock", "Water"], region: "Kalos"),
        Pokemon(name: "Skrelp", number: "690", type: ["Poison", "Water"], region: "Kalos"),
        Pokemon(name: "Dragalge", number: "691", type: ["Poison", "Dragon"], region: "Kalos"),
        Pokemon(name: "Clauncher", number: "692", type: ["Water"], region: "Kalos"),
        Pokemon(name: "Clawitzer", number: "693", type: ["Water"], region: "Kalos"),
        Pokemon(name: "Helioptile", number: "694", type: ["Electric", "Normal"], region: "Kalos"),
        Pokemon(name: "Heliolisk", number: "695", type: ["Electric", "Normal"], region: "Kalos"),
        Pokemon(name: "Tyrunt", number: "696", type: ["Rock", "Dragon"], region: "Kalos"),
        Pokemon(name: "Tyrantrum", number: "697", type: ["Rock", "Dragon"], region: "Kalos"),
        Pokemon(name: "Amaura", number: "698", type: ["Rock", "Ice"], region: "Kalos"),
        Pokemon(name: "Aurorus", number: "699", type: ["Rock", "Ice"], region: "Kalos"),
        Pokemon(name: "Sylveon", number: "700", type: ["Fairy"], region: "Kalos"),
        Pokemon(name: "Hawlucha", number: "701", type: ["Fighting", "Flying"], region: "Kalos"),
        Pokemon(name: "Dedenne", number: "702", type: ["Electric", "Fairy"], region: "Kalos"),
        Pokemon(name: "Carbink", number: "703", type: ["Rock", "Fairy"], region: "Kalos"),
        Pokemon(name: "Goomy", number: "704", type: ["Dragon"], region: "Kalos"),
        Pokemon(name: "Sliggoo", number: "705", type: ["Dragon"], region: "Kalos"),
        Pokemon(name: "Goodra", number: "706", type: ["Dragon"], region: "Kalos"),
        Pokemon(name: "Klefki", number: "707", type: ["Steel", "Fairy"], region: "Kalos"),
        Pokemon(name: "Phantump", number: "708", type: ["Ghost", "Grass"], region: "Kalos"),
        Pokemon(name: "Trevenant", number: "709", type: ["Ghost", "Grass"], region: "Kalos"),
        Pokemon(name: "Pumpkaboo", number: "710", type: ["Ghost", "Grass"], region: "Kalos"),
        Pokemon(name: "Gourgeist", number: "711", type: ["Ghost", "Grass"], region: "Kalos"),
        Pokemon(name: "Bergmite", number: "712", type: ["Ice"], region: "Kalos"),
        Pokemon(name: "Avalugg", number: "713", type: ["Ice"], region: "Kalos"),
        Pokemon(name: "Noibat", number: "714", type: ["Flying", "Dragon"], region: "Kalos"),
        Pokemon(name: "Noivern", number: "715", type: ["Flying", "Dragon"], region: "Kalos"),
        Pokemon(name: "Xerneas", number: "716", type: ["Fairy"], region: "Kalos"),
        Pokemon(name: "Yveltal", number: "717", type: ["Dark", "Flying"], region: "Kalos"),
        Pokemon(name: "Zygarde", number: "718", type: ["Dragon", "Ground"], region: "Kalos"),
        Pokemon(name: "Diancie", number: "719", type: ["Rock", "Fairy"], region: "Kalos"),
        Pokemon(name: "Hoopa", number: "720", type: ["Psychic", "Ghost"], region: "Kalos"),
        Pokemon(name: "Volcanion", number: "721", type: ["Fire", "Water"], region: "Kalos"),
        Pokemon(name: "Rowlet", number: "722", type: ["Grass", "Flying"], region: "Alola"),
        Pokemon(name: "Dartrix", number: "723", type: ["Grass", "Flying"], region: "Alola"),
        Pokemon(name: "Decidueye", number: "724", type: ["Grass", "Ghost"], region: "Alola"),
        Pokemon(name: "Litten", number: "725", type: ["Fire"], region: "Alola"),
        Pokemon(name: "Torracat", number: "726", type: ["Fire"], region: "Alola"),
        Pokemon(name: "Incineroar", number: "727", type: ["Fire", "Dark"], region: "Alola"),
        Pokemon(name: "Popplio", number: "728", type: ["Water"], region: "Alola"),
        Pokemon(name: "Brionne", number: "729", type: ["Water"], region: "Alola"),
        Pokemon(name: "Primarina", number: "730", type: ["Water", "Fairy"], region: "Alola"),
        Pokemon(name: "Pikipek", number: "731", type: ["Normal", "Flying"], region: "Alola"),
        Pokemon(name: "Trumbeak", number: "732", type: ["Normal", "Flying"], region: "Alola"),
        Pokemon(name: "Toucannon", number: "733", type: ["Normal", "Flying"], region: "Alola"),
        Pokemon(name: "Yungoos", number: "734", type: ["Normal"], region: "Alola"),
        Pokemon(name: "Gumshoos", number: "735", type: ["Normal"], region: "Alola"),
        Pokemon(name: "Grubbin", number: "736", type: ["Bug"], region: "Alola"),
        Pokemon(name: "Charjabug", number: "737", type: ["Bug", "Electric"], region: "Alola"),
        Pokemon(name: "Vikavolt", number: "738", type: ["Bug", "Electric"], region: "Alola"),
        Pokemon(name: "Crabrawler", number: "739", type: ["Fighting"], region: "Alola"),
        Pokemon(name: "Crabominable", number: "740", type: ["Fighting", "Ice"], region: "Alola"),
        Pokemon(name: "Oricorio", number: "741", type: ["Fire", "Flying"], region: "Alola"),
        Pokemon(name: "Cutiefly", number: "742", type: ["Bug", "Fairy"], region: "Alola"),
        Pokemon(name: "Ribombee", number: "743", type: ["Bug", "Fairy"], region: "Alola"),
        Pokemon(name: "Rockruff", number: "744", type: ["Rock"], region: "Alola"),
        Pokemon(name: "Lycanroc", number: "745", type: ["Rock"], region: "Alola"),
        Pokemon(name: "Wishiwashi", number: "746", type: ["Water"], region: "Alola"),
        Pokemon(name: "Mareanie", number: "747", type: ["Poison", "Water"], region: "Alola"),
        Pokemon(name: "Toxapex", number: "748", type: ["Poison", "Water"], region: "Alola"),
        Pokemon(name: "Mudbray", number: "749", type: ["Ground"], region: "Alola"),
        Pokemon(name: "Mudsdale", number: "750", type: ["Ground"], region: "Alola"),
        Pokemon(name: "Dewpider", number: "751", type: ["Water", "Bug"], region: "Alola"),
        Pokemon(name: "Araquanid", number: "752", type: ["Water", "Bug"], region: "Alola"),
        Pokemon(name: "Fomantis", number: "753", type: ["Grass"], region: "Alola"),
        Pokemon(name: "Lurantis", number: "754", type: ["Grass"], region: "Alola"),
        Pokemon(name: "Morelull", number: "755", type: ["Grass", "Fairy"], region: "Alola"),
        Pokemon(name: "Shiinotic", number: "756", type: ["Grass", "Fairy"], region: "Alola"),
        Pokemon(name: "Salandit", number: "757", type: ["Poison", "Fire"], region: "Alola"),
        Pokemon(name: "Salazzle", number: "758", type: ["Poison", "Fire"], region: "Alola"),
        Pokemon(name: "Stufful", number: "759", type: ["Normal", "Fighting"], region: "Alola"),
        Pokemon(name: "Bewear", number: "760", type: ["Normal", "Fighting"], region: "Alola"),
        Pokemon(name: "Bounsweet", number: "761", type: ["Grass"], region: "Alola"),
        Pokemon(name: "Steenee", number: "762", type: ["Grass"], region: "Alola"),
        Pokemon(name: "Tsareena", number: "763", type: ["Grass"], region: "Alola"),
        Pokemon(name: "Comfey", number: "764", type: ["Fairy"], region: "Alola"),
        Pokemon(name: "Oranguru", number: "765", type: ["Normal", "Psychic"], region: "Alola"),
        Pokemon(name: "Passimian", number: "766", type: ["Fighting"], region: "Alola"),
        Pokemon(name: "Wimpod", number: "767", type: ["Bug", "Water"], region: "Alola"),
        Pokemon(name: "Golisopod", number: "768", type: ["Bug", "Water"], region: "Alola"),
        Pokemon(name: "Sandygast", number: "769", type: ["Ghost", "Ground"], region: "Alola"),
        Pokemon(name: "Palossand", number: "770", type: ["Ghost", "Ground"], region: "Alola"),
        Pokemon(name: "Pyukumuku", number: "771", type: ["Water"], region: "Alola"),
        Pokemon(name: "Type: Null", number: "772", type: ["Normal"], region: "Alola"),
        Pokemon(name: "Silvally", number: "773", type: ["Normal"], region: "Alola"),
        Pokemon(name: "Minior", number: "774", type: ["Rock", "Flying"], region: "Alola"),
        Pokemon(name: "Komala", number: "775", type: ["Normal"], region: "Alola"),
        Pokemon(name: "Turtonator", number: "776", type: ["Fire", "Dragon"], region: "Alola"),
        Pokemon(name: "Togedemaru", number: "777", type: ["Electric", "Steel"], region: "Alola"),
        Pokemon(name: "Mimikyu", number: "778", type: ["Ghost", "Fairy"], region: "Alola"),
        Pokemon(name: "Bruxish", number: "779", type: ["Water", "Psychic"], region: "Alola"),
        Pokemon(name: "Drampa", number: "780", type: ["Normal", "Dragon"], region: "Alola"),
        Pokemon(name: "Dhelmise", number: "781", type: ["Ghost", "Grass"], region: "Alola"),
        Pokemon(name: "Jangmo-o", number: "782", type: ["Dragon"], region: "Alola"),
        Pokemon(name: "Hakamo-o", number: "783", type: ["Dragon", "Fighting"], region: "Alola"),
        Pokemon(name: "Kommo-o", number: "784", type: ["Dragon", "Fighting"], region: "Alola"),
        Pokemon(name: "Tapu Koko", number: "785", type: ["Electric", "Fairy"], region: "Alola"),
        Pokemon(name: "Tapu Lele", number: "786", type: ["Psychic", "Fairy"], region: "Alola"),
        Pokemon(name: "Tapu Bulu", number: "787", type: ["Grass", "Fairy"], region: "Alola"),
        Pokemon(name: "Tapu Fini", number: "788", type: ["Water", "Fairy"], region: "Alola"),
        Pokemon(name: "Cosmog", number: "789", type: ["Psychic"], region: "Alola"),
        Pokemon(name: "Cosmoem", number: "790", type: ["Psychic"], region: "Alola"),
        Pokemon(name: "Solgaleo", number: "791", type: ["Psychic", "Steel"], region: "Alola"),
        Pokemon(name: "Lunala", number: "792", type: ["Psychic", "Ghost"], region: "Alola"),
        Pokemon(name: "Nihilego", number: "793", type: ["Rock", "Poison"], region: "Alola"),
        Pokemon(name: "Buzzwole", number: "794", type: ["Bug", "Fighting"], region: "Alola"),
        Pokemon(name: "Pheromosa", number: "795", type: ["Bug", "Fighting"], region: "Alola"),
        Pokemon(name: "Xurkitree", number: "796", type: ["Electric"], region: "Alola"),
        Pokemon(name: "Celesteela", number: "797", type: ["Steel", "Flying"], region: "Alola"),
        Pokemon(name: "Kartana", number: "798", type: ["Grass", "Steel"], region: "Alola"),
        Pokemon(name: "Guzzlord", number: "799", type: ["Dark", "Dragon"], region: "Alola"),
        Pokemon(name: "Necrozma", number: "800", type: ["Psychic"], region: "Alola"),
        Pokemon(name: "Magearna", number: "801", type: ["Steel", "Fairy"], region: "Alola"),
        Pokemon(name: "Marshadow", number: "802", type: ["Fighting", "Ghost"], region: "Alola"),
        Pokemon(name: "Poipole", number: "803", type: ["Poison"], region: "Alola"),
        Pokemon(name: "Naganadel", number: "804", type: ["Poison", "Dragon"], region: "Alola"),
        Pokemon(name: "Stakataka", number: "805", type: ["Rock", "Steel"], region: "Alola"),
        Pokemon(name: "Blacephalon", number: "806", type: ["Fire", "Ghost"], region: "Alola"),
        Pokemon(name: "Zeraora", number: "807", type: ["Electric"], region: "Alola"),
        Pokemon(name: "Meltan", number: "808", type: ["Steel"], region: "Alola"),
        Pokemon(name: "Melmetal", number: "809", type: ["Steel"], region: "Alola")
        ]
    
    
    func generateWeaknessResistanceArraysModel(typesArr: [String]) -> [[String]] {
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
        return [weaknessesArr, superWeaknesses, resistanceArr, superResistance]
    }

}

