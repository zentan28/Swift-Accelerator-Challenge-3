//
//  ReminderCreateViewTest.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 15/11/24.
//

import SwiftUI

struct ReminderCreateViewTest: View {
    
    @Binding var contact: Contact
    @Environment(\.dismiss) var dismiss
    
    @State private var text = ""
    @State private var date: Date = .now
    
    var body: some View {
        Form {
            Section {
                TextField("Reminder", text: $text)
                DatePicker("Date", selection: $date)
            }
            
            Button("Done") {
                contact.reminders.append(Reminder(text: text, date: .now))
                dismiss()
            }
        }
        .navigationTitle("Create Reminder")
    }
}
