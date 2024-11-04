//
//  ContactDetailView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//

import SwiftUI

struct ContactDetailView: View {
    @Binding var contact: Contact
    var body: some View {
        VStack{
            Image(contact.image)
                .resizable()
                .scaledToFit()
            List(){
                Section("About"){
                    Text("Birthday: \(contact.birthday)")
                    VStack{
                        Text("Other").headerProminence(.increased)
                        Text(contact.other)
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
}

#Preview{
    @Previewable var contact = Contact(name: "e", image: "placeholder1", birthday: Date(), phonenumber: "9999999", other: "", notes: "", reminders: [])
    ContactDetailView(contact: .constant(contact))
}
