//
//  ContactCreatorView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 9/11/24.
//

import SwiftUI

struct ContactCreatorView: View {
    @State private var name = ""
    @State private var phoneNumber = ""
    @State private var otherInfo = ""
    @Environment(\.presentationMode) var presentationMode
    @Environment(ContactCategoryManager.self) var contactCategoryManager
    @Binding var selectedCategory: ContactCategory

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Contact Information")) {
                    TextField("Name", text: $name)
                    TextField("Phone Number", text: $phoneNumber)
                    TextField("Other Information", text: $otherInfo)
                }

                Section {
                    Button("Create Contact") {
                        let newContact = Contact(
                            name: name,
                            phoneNumber: phoneNumber,
                            birthday: nil,
                            profileImage: nil,
                            other: otherInfo,
                            notes: "",
                            reminders: [],
                            discardedReminders: []
                        )
                        selectedCategory.contacts.append(newContact)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(name.isEmpty || phoneNumber.isEmpty)
                }
            }
            .navigationTitle("Create Contact")
        }
    }
}
