//
//  DiscardedRemindersSectionView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 15/11/24.
//

import SwiftUI

struct DiscardedRemindersSectionView: View {
    
    @Binding var contact: Contact
    @State var viewAllDiscardedReminders = false
    @Environment(\.editMode) var editMode
    
    var body: some View {
        Section {
            if(contact.discardedReminders.count <= 3) {
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
                ForEach(contact.discardedReminders.sorted(by: { $0.date > $1.date })[0..<3]) { reminder in
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
                        Text("Show less")
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
}
