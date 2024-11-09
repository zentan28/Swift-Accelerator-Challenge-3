//
//  Contact.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//
import Foundation
import Contacts
struct Contact: Codable {
    var identifier: UUID
    var other: String
    var notes: String
    var reminders: [Reminder]
    var discardedReminders: [Reminder]
}
