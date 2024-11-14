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
    
    @State var viewAllDiscardedReminders = false
    
    @Environment(\.editMode) var editMode
    
    var body: some View {
        NavigationStack{
            VStack{
//                Image(contact.image)
//                    .resizable()
//                    .scaledToFit()
//                    .cornerRadius(200)
//                  when edit button is pressed, allow to change pfp
                List{
                    
                    Section(header: Text("About")) {
                        Text("Name: \(contact.name)")
                        Text("Phone number: \(contact.phoneNumber)")
                        Text("Birthday: ")
                    }
                    
                    Section("Other Information") {
                        TextEditor(text: $contact.other)
                            .frame(minHeight: 50)
                            .fixedSize(horizontal: false, vertical: true)
//                        if editMode?.wrappedValue == EditMode.active {
//                            TextEditor(text: $contact.other)
//                                .frame(minHeight: 50)
//                                .fixedSize(horizontal: false, vertical: true)
//                        } else {
//                            Text(contact.other)
//                        }
                    }
                    
                    Section() {
                        ForEach($contact.reminders, editActions: .all){$reminder in
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
                        .onDelete{indexSet in
                            contact.reminders.remove(atOffsets: indexSet)
                        }
                        .onMove{indices, newOffset in
                            contact.reminders.move(fromOffsets: indices, toOffset: newOffset)
                        }
                    } header: {
                        HStack {
                            Text("Reminders")
                             Spacer()
                            Button{
                                addNewReminder = true
                            }label:{
                                Image(systemName:"plus")
                            }
                            //add reminders
                         }
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
                .toolbar{
                    EditButton()
                }
            }
        }
        .sheet(isPresented: $addNewReminder){
            ReminderCreateView(contact: $contact)
        }
    }
}


#Preview {
  @Previewable var contact = Contact(
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
