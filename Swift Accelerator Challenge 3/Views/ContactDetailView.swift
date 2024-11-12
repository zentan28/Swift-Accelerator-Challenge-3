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
    var body: some View {
        NavigationStack{
            VStack{
//                Image(contact.image)
//                    .resizable()
//                    .scaledToFit()
//                    .cornerRadius(200)
                List{
                    
                    Section(header: Text("About: \(contact.name)")) {
                        Text("Phone number: \(contact.phoneNumber)")
                        Text("Birthday: ")
                        Text("Other info: \(contact.other)")
                    }
                    
                    Section() {
                        ForEach($contact.reminders, editActions: .all){$reminder in
                            Text("\(reminder.text) at \(reminder.date)")
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
