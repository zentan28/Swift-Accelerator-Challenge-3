//
//  Contact.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//
import Foundation
<<<<<<< HEAD
struct Contact: Identifiable {
=======
struct Contact: Identifiable, Codable{
>>>>>>> main
    let id = UUID()
    var name: String
    var image: String
    var birthday: Date
    var phonenumber: String
    var other: String
    var notes: String
    var reminders: [Reminder]
}
