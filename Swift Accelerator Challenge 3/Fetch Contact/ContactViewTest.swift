//
//  ContactViewTest.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 8/11/24.
//

import SwiftUI
import Contacts

struct ContactViewTest: View {
    @StateObject private var contactManager = ContactManager()

    var body: some View {
        NavigationView {
            List(contactManager.contacts, id: \.id) { contact in
                VStack(alignment: .leading) {
                    Text(contact.name)
                    Text(contact.phonenumber).font(.subheadline).foregroundColor(.gray)
                }
            }
            .onAppear {
                contactManager.requestAccess()
            }
            .navigationTitle("Contact List")
            .toolbar {
                Button("Save Locally") {
                    contactManager.syncContacts()
                }
            }
        }
    }
}

