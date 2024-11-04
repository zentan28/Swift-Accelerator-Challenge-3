//
//  Reminder.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//
import Foundation
struct Reminder: Identifiable, Codable{
    let id = UUID()
    var text: String
    var date: Date
}
