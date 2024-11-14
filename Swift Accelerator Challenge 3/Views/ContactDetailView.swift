//
//  ContactDetailView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//

import SwiftUI


struct ContactDetailView: View {
    
    @Binding var contact: Contact
    @State var addNewReminder = false
    @State private var isEditing = false
    @State private var completedReminders: Set<String> = []
    @State private var reminders = ["Add a reminder"]
    
    var body: some View {
        NavigationStack {
            VStack {

                // Image(contact.image)
                //     .resizable()
                //     .scaledToFit()
                //     .cornerRadius(200)

                List {
                    Section(header: Text("About: \(contact.name)")) {
                        Text("Phone number: \(contact.phoneNumber)")
                        HStack {
                            Text("Birthday:")
                                .bold()
                                .frame(width: 100, alignment: .leading)
                            Text(contact.birthday != nil ? formattedDate(contact.birthday!) : "N/A")
                        }
                        Text("Other info: \(contact.other)")
                    }
                    
                    Section(header: Text("Reminders")) {
                        ForEach($contact.reminders, id: \.id, editActions: .all) { $reminder in
                            Text("\(reminder.text) at \(formattedDate(reminder.date))")
                        }
                        .onDelete { indexSet in
                            contact.reminders.remove(atOffsets: indexSet)
                        }
                        .onMove { indices, newOffset in
                            contact.reminders.move(fromOffsets: indices, toOffset: newOffset)
                        }

                        ForEach(reminders, id: \.self) { reminder in
                            HStack {
                                Button(action: {
                                    toggleReminder(reminder)
                                }) {
                                    Image(systemName: completedReminders.contains(reminder) ? "circle.fill" : "circle")
                                        .foregroundColor(.blue)
                                }
                                Text(reminder)
                                    .strikethrough(completedReminders.contains(reminder), color: .gray)
                                    .opacity(completedReminders.contains(reminder) ? 0.5 : 1.0)
                            }
                        }
                        .onDelete(perform: delete)
                    }
                    
                    Section() {
                        if viewAllDiscardedReminders {
                            ForEach($contact.discardedReminders, editActions: .all){ $reminder in
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
                        } else {
                            ForEach(contact.discardedReminders.sorted(by: { $0.date > $1.date })[0..<0]) { reminder in
                                NavigationLink {
                                    let reminderBinding = Binding {
                                        return reminder
                                    } set: { newReminder in
                                        let index = contact.discardedReminders.firstIndex {
                                            $0.id == newReminder.id
                                        }
                                        
                                        contact.discardedReminders[index!] = newReminder
                                    }

                                    ReminderEditView(reminder: reminderBinding)
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text(reminder.text)
                                        Text(reminder.date.formatted(date: .abbreviated, time: .shortened))
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                        }
                    } header: {
                        HStack {
                            Text("Discarded reminders")
                            Spacer()
                            if viewAllDiscardedReminders {
                                Button{
                                    viewAllDiscardedReminders = false
                                } label:{
                                    Text("Hide all")
                                }
                            } else {
                                Button{
                                    viewAllDiscardedReminders = true
                                } label:{
                                    Text("Show all")
                                }
                            }
                         }
                    }
                }
                .toolbar {
                    EditButton()
                }
            }
        }
        .sheet(isPresented: $addNewReminder) {
            ReminderCreateView(contact: $contact)
        }
    }
    
    // Helper function to format dates
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    // Helper function to toggle reminders
    private func toggleReminder(_ reminder: String) {
        if completedReminders.contains(reminder) {
            completedReminders.remove(reminder)
        } else {
            completedReminders.insert(reminder)
        }
    }
    
    // Helper function to delete reminders from the list
    private func delete(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets)
    }
}

// Preview provider for testing
struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let contact = Contact(
            name: "Alice Smith",
            phoneNumber: "+1 (555) 555-5555",
            birthday: DateFormatter().date(from: "1990-01-01"),
            profileImage: nil,
            other: "Loves long walks on the beach and coding challenges",
            notes: "Don't forget to send a birthday wish!",
            reminders: [
                Reminder(text: "Buy groceries", date: Date().addingTimeInterval(60 * 60 * 24)),
                Reminder(text: "Finish Swift project", date: Date().addingTimeInterval(60 * 60 * 24 * 3))
            ],
            discardedReminders: []
        )
        
        ContactDetailView(contact: .constant(contact))
    }
}

