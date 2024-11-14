//
//  ReminderListView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 13/11/24.
//

import SwiftUI

struct ReminderListView: View {
    @Environment(ContactCategoryManager.self) var contactCategoryManager

    var body: some View {
        @Bindable var contactCategoryManager = contactCategoryManager
        NavigationView {
            List {
                ForEach($contactCategoryManager.contactCategories) { $category in
                    ForEach($category.contacts) { $contact in
                        ForEach($contact.reminders) { $reminder in
                            
                            NavigationLink {
                                ReminderEditView(reminder: $reminder)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(reminder.text)
                                    Text(reminder.date.formatted(date: .abbreviated, time: .shortened))
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Reminders")
        }
    }
}
