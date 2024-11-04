//
//  Contact.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//
import Foundation
struct Contact{
    let id = UUID()
    var name: String
    var birthday: Date
    var phonenumber: String
    var email: String
    var notes: String
    var reminders: [String]
}
