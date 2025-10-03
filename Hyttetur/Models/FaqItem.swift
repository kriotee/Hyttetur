//
//  FaqItem.swift
//  Hyttetur
//
//  Created by Kristin Ottesen-Næss on 02/10/2025.
//

import Foundation

struct FaqItem: Identifiable {
    let id = UUID()
    let emoji: String
    let question: String
    let answer: String
}
