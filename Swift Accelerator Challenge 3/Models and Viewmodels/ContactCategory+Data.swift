//
//  ContactStore+Data.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//
import Foundation
extension ContactCategory {
    static let sampleContactList = [
        ContactCategory(name: "Family", contacts: [
            Contact(name: "Bob", image: "placeholder1", birthday: Date(), phonenumber: "92706171", other: "Currently undergoing severe hypertension", notes: "", reminders: []),
            Contact(name: "Lucas", image: "placeholder1", birthday: Date(), phonenumber: "92706171", other: "Currently undergoing severe depression", notes: "", reminders: [])]
                       ),
 ContactCategory(name: "Friends", contacts: [Contact(name: "Jane", image: "placeholder1", birthday: Date(), phonenumber: "92706171", other: "Currently suffering from cancer", notes: "", reminders: [])])]
}
