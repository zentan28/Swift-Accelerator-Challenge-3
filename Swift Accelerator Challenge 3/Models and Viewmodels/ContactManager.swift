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
        let keys = [CNContactIdentifierKey, CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey, CNContactBirthdayKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: keys)

        do {
            try store.enumerateContacts(with: request) { cnContact, _ in
                let newContact = self.convertCNContactToContact(cnContact)

                // Find existing contact by identifier
                if let existingContactIndex = self.contacts.firstIndex(where: { $0.identifier == newContact.identifier }) {
                    let existingContact = self.contacts[existingContactIndex]
                    
                    // Only update if fields have actually changed
                    if existingContact.name != newContact.name ||
                        existingContact.phonenumber != newContact.phonenumber ||
                        existingContact.image != newContact.image ||
                        existingContact.birthday != newContact.birthday {
                        self.contacts[existingContactIndex] = newContact
                        self.saveContacts()
                    }
                } else {
                    // Contact not found, add as new
                    self.contacts.append(newContact)
                    self.saveContacts()
                }
            }
        } catch {
            print("Failed to sync contacts: \(error)")
        }
    }
    
    // Convert CNContact to custom Contact object
    func convertCNContactToContact(_ cnContact: CNContact) -> Contact {
        return Contact(
            identifier: cnContact.identifier,
            name: "\(cnContact.givenName) \(cnContact.familyName)", // Might need optional cus no familyName
            image: cnContact.imageData ?? Data(), // Set-up default image
            birthday: cnContact.birthday?.date ?? Date(), // Use a default if birthday is missing
            phonenumber: cnContact.phoneNumbers.first?.value.stringValue ?? "",
            other: "",
            notes: "",
            reminders: [],
            discardedReminders: []
        )
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
