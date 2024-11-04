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
                Image(contact.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(200)
                List(){
                    Section("About"){
                        Text("Birthday: \(contact.birthday)")
                        VStack{
                            Text("Other info: \(contact.other)")
                        }
                    }
                    Section("Reminders"){
                        ForEach($contact.reminders){$reminder in
                            Text("reminder")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $addNewReminder){
            ReminderCreateView(contact: $contact)
        }
    }
}

#Preview{
    @Previewable var contact = Contact(name: "e", image: "placeholder1", birthday: Date(), phonenumber: "9999999", other: "Suffering from exam stress", notes: "", reminders: [])
    ContactDetailView(contact: .constant(contact))
}
