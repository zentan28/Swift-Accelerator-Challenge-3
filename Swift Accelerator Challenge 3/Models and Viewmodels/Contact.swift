//
//  Contact.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//
import Foundation
struct Contact: Identifiable, Codable{
    let id = UUID()
    var identifier: String
    var contactCategory: String
    var name: String
    var image: Data
    var birthday: Date
    var phonenumber: String
    var other: String
    var notes: String
    var reminders: [Reminder]
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
//    static func == (lhs: Contact, rhs: Contact) -> Bool {
//            return lhs.id == rhs.id &&
//                   lhs.name == rhs.name &&
//                   lhs.image == rhs.image &&
//                   lhs.birthday == rhs.birthday &&
//                   lhs.phonenumber == rhs.phonenumber
//        }
    var discardedReminders: [Reminder]
        //    var contactCategory: ContactCategory
}
