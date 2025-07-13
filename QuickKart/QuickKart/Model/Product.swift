//
//  Product.swift
//  QuickKart
//
//  Created by Sumanth Maddela on 26/06/25.
//
import Foundation

struct Product: Identifiable, Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
}
