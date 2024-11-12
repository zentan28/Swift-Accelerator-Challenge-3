//
//  ContactCategoryManager.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//

import Foundation
import Observation

@Observable class ContactCategoryManager {
    var contactCategories: [ContactCategory] = [] {
        didSet {
            save()
        }
    }
    
        
    init() {
        contactCategories.append(ContactCategory(name: "Family", contacts: [Contact(
            name: "Alice Smith", // Changed name
            phoneNumber: "+1 (555) 555-5555", // Changed phone number
            birthday: DateFormatter().date(from: "1990-01-01"), // Set birthday
            profileImage: nil, // No profile image provided
            other: "Loves long walks on the beach and coding challenges", // Added other info
            notes: "Don't forget to send a birthday wish!", // Added notes
            reminders: [
              Reminder(text: "Buy groceries", date: Date().addingTimeInterval(60 * 60 * 24)), // Reminder in 1 day
              Reminder(text: "Finish Swift project", date: Date().addingTimeInterval(60 * 60 * 24 * 3)) // Reminder in 3 days
            ],
            discardedReminders: []
          )]))
        
        load()
    }
    
    private func getArchiveURL() -> URL {
        URL.documentsDirectory.appending(path: "contactCategories.json")
    }
    
    private func save() {
        let archiveURL = getArchiveURL()
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        let encodedContactCategorys = try? jsonEncoder.encode(contactCategories)
        try? encodedContactCategorys?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func loadSampleData() {
        //contactCategories = sampleContactList
    }
    
    private func load() {
        let archiveURL = getArchiveURL()
        let jsonDecoder = JSONDecoder()
                
        if let retrievedContactCategoryData = try? Data(contentsOf: archiveURL),
           let contactCategoriesDecoded = try? jsonDecoder.decode([ContactCategory].self, from: retrievedContactCategoryData) {
            contactCategories = contactCategoriesDecoded
        }
    }
}
