//
//  ContactStore.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//

import Foundation
<<<<<<< HEAD:Swift Accelerator Challenge 3/Models and Viewmodels/ContactStore.swift
struct ContactStore {
=======
struct ContactCategory: Codable, Identifiable{
>>>>>>> main:Swift Accelerator Challenge 3/Models and Viewmodels/ContactCategory.swift
    let id = UUID()
    var name: String
    var contacts: [Contact]
}

