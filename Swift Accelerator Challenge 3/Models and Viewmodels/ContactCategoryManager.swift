//
//  ContactManager.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//

import Foundation
import Observation

@Observable class ContactCategoryManager {
    var contactCategories: [ContactCategory] = []{
        didSet {
            save()
        }
    }
        
    init() {
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
    func loadSampleData(){
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
