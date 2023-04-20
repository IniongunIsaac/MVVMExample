//
//  Product.swift
//  MVVMExample
//
//  Created by Isaac Iniongun on 19/04/2023.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
}
