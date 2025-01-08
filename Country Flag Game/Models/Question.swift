//
//  Question.swift
//  Country Flag Game
//
//  Created by Tyler Berlin on 1/7/25.
//

import Foundation

struct Awnser: Identifiable {
    var id = UUID()
    var text: String
    var incorrect: Bool
}

struct Question: Identifiable {
    var id = UUID()
    var correctAwnser: Awnser
    var incorrect: [Awnser]
}

