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
    
    @State var text = ""
    @State var date: Date = .init()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Reminder", text: $text)
                    DatePicker("Date", selection: $date)
                }
                
                Button("Done") {
                    dismiss()
                    contact.reminders.append(Reminder(text: text, date: date))
                }
            }
            .navigationTitle("Create Reminder")
        }
    }
}
