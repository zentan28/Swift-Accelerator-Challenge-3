//
//  CategoryCreatorView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 13/11/24.
//

import SwiftUI

struct CategoryCreatorView: View {
    @State private var categoryName = ""
    @Environment(\.presentationMode) var presentationMode
    @Environment(ContactCategoryManager.self) var contactCategoryManager

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Category Information")) {
                    TextField("New Category Name", text: $categoryName)
                }

                Section {
                    Button("Create Category") {
                        let newCategory = ContactCategory(name: categoryName, contacts: [])
                        contactCategoryManager.contactCategories.append(newCategory)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(categoryName.isEmpty)
                }
            }
            .navigationTitle("Create Category")
        }
    }
}
