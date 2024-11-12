//
//  ContactCategory.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//

import Foundation
struct ContactCategory: Codable, Identifiable {
    var id = UUID()
    var name: String
    var contacts: [Contact]
}

