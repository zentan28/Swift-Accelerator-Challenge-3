//
//  ContactManager.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 8/11/24.
//

import Foundation
import Contacts
import SwiftUI

class ContactManager: ObservableObject {
    @Published var contacts: [Contact] = []

    init() {
        loadContacts()
    }

    func requestAccess() {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { granted, error in
            if granted {
                self.syncContacts()
            } else {
                print("Access denied")
            }
        }
    }

    // Load contacts from Contacts app and sync with locally stored contacts
    func syncContacts() {
        let store = CNContactStore()
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: keys)

        do {
            try store.enumerateContacts(with: request) { cnContact, _ in
                let contact = self.convertCNContactToContact(cnContact)

                if let existingContactIndex = self.contacts.firstIndex(where: { existingContact in
                    existingContact == contact
                }) {
                    // Contact found, update if necessary
                    if self.contacts[existingContactIndex] != contact {
                        self.contacts[existingContactIndex] = contact
                        self.saveContacts() // Update local storage
                    }
                } else {
                    // Contact not found, add it
                    self.contacts.append(contact)
                    self.saveContacts() // Update local storage
                }
            }
        } catch {
            print("Failed to sync contacts: \(error)")
        }
    }
    
    // Convert CNContact to custom Contact object
    func convertCNContactToContact(_ cnContact: CNContact) -> Contact {
        return Contact(
            name: "\(cnContact.givenName) \(cnContact.familyName)",
            image: "placeholder",
            birthday: Date(), // Add image handling as needed
            phonenumber: cnContact.phoneNumbers.first?.value.stringValue ?? "",
            other: "",
            notes: "",
            reminders: []
        )
    }

    // Convert custom Contact object to CNContact (if needed)
    func convertContactToCNContact(_ contact: Contact) -> CNContact {
        let cnContact = CNMutableContact()
        cnContact.givenName = contact.name
        cnContact.phoneNumbers = [CNLabeledValue(label: CNLabelPhoneNumberMain, value: CNPhoneNumber(stringValue: contact.phonenumber))]
        // Add other properties as needed
        return cnContact
    }

    // Local storage functions
    private func saveContacts() {
        let archiveURL = URL.documentsDirectory.appendingPathComponent("contacts.json")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let data = try encoder.encode(contacts)
            try data.write(to: archiveURL)
        } catch {
            print("Failed to save contacts: \(error)")
        }
    }

    private func loadContacts() {
        let archiveURL = URL.documentsDirectory.appendingPathComponent("contacts.json")
        let decoder = JSONDecoder()

        do {
            let data = try Data(contentsOf: archiveURL)
            contacts = try decoder.decode([Contact].self, from: data)
        } catch {
            print("Failed to load contacts: \(error)")
        }
    }
}
