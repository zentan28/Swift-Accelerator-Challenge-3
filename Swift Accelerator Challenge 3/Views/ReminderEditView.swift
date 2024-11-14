//
//  ReminderEditView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 13/11/24.
//

import SwiftUI

struct ReminderEditView: View {
    @Binding var reminder: Reminder
    @Environment(ContactCategoryManager.self) var contactCategoryManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Reminder", text: $reminder.text)
                    DatePicker("Date", selection: $reminder.date)
                }
                
                Button("Done") {
                    dismiss()
                }
            }
            .navigationTitle("Edit Reminder")
        }
    }
}
