//
//  Contact.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//
import Foundation
import Contacts
import SwiftUICore

struct Contact: Codable, Identifiable {
    var id = UUID()
    var name: String
    var phoneNumber: String
    var birthday: Date?
    var profileImage: Data?
    var other: String
    var notes: String
    var reminders: [Reminder]
    var discardedReminders: [Reminder]
    
//    var initials {
//        return name.split(separator: .whitespaces).first?.uppercased() ?? ""
//    }
}
