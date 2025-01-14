//
//  RemindersSectionView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 15/11/24.
//



import SwiftUI

struct RemindersSectionView: View {
    
    @Binding var contact: Contact
    @State var addNewReminder = false
    @Environment(\.editMode) var editMode
    
    var body: some View {
        Section {
            if (editMode?.wrappedValue == EditMode.active) {
                ForEach($contact.reminders, editActions: .all) { $reminder in
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
            } else { //this part is GPTed, idk if the code is actually correct
                ForEach(contact.reminders) { reminder in
                    HStack {
                        Button {
                            if let index = contact.reminders.firstIndex(where: { $0.id == reminder.id }) {
                                // move reminder to discardedReminders
                                withAnimation {
                                    contact.discardedReminders.append(contact.reminders[index])
                                    contact.reminders.remove(at: index)
                                }
                            }
                        } label: {
                            Image(systemName: contact.discardedReminders.contains(where: { $0.id == reminder.id }) ? "circle.fill" : "circle")
                                .foregroundColor(.blue)
                        }
                        
                        Text(reminder.text)
                            .strikethrough(contact.discardedReminders.contains(where: { $0.id == reminder.id }), color: .gray)
                            .opacity(contact.discardedReminders.contains(where: { $0.id == reminder.id }) ? 0.5 : 1.0)
                    }
                    .animation(.default, value: contact.discardedReminders.firstIndex(where: { $0.id == reminder.id }))
                }
            }
        } header: {
            HStack {
                Text("Reminders")
                Spacer()
                Button{
                    addNewReminder = true
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .sheet(isPresented: $addNewReminder) {
            ReminderCreateView(contact: $contact)
        }
    }
}
