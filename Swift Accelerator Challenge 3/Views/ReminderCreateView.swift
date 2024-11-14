//
//  ReminderCreateView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//

import SwiftUI

struct ReminderCreateView: View {
    @State var reminderDescription = ""
    @State var reminderDate = Date()
    @Binding var contact: Contact
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Form{
            TextField("Description...", text: $reminderDescription)
            DatePicker("Reminder Date", selection: $reminderDate, in: Date.init()...)
            Button{
                contact.reminders.append(Reminder(text: reminderDescription, date: reminderDate))
                print(contact)
                presentationMode.wrappedValue.dismiss()
            }label:{
                Text("Save...")
            }.disabled(reminderDescription.isEmpty)
        }
    }
}

//#Preview {
//    @Previewable @State var contact = Contact(name: "e", image: "e", birthday: Date(), phonenumber: "e", other: "e", notes: "e", reminders: [])
//    ReminderCreateView(contact: $contact)
//}
