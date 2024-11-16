//
//  AboutSectionView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 15/11/24.
//

import SwiftUI

struct AboutSectionView: View {
    
    @Binding var contact: Contact
    @Environment(\.editMode) var editMode
    @State var changeDate = Date.now
    var body: some View {
        Section(header: Text("About")) {
            if editMode?.wrappedValue == EditMode.active {
                TextField("Name: ", text: $contact.name)
                    .fixedSize(horizontal: false, vertical: true)
                TextField("Phone Number: ", text: $contact.phoneNumber)
                    .fixedSize(horizontal: false, vertical: true)
                DatePicker("Birthday", selection: $changeDate)
                    .onChange(of: changeDate){
                        contact.birthday = changeDate
                    }
            } else {
                Text("Name: \(contact.name)")
                Text("Phone number: \(contact.phoneNumber)")
                contact.birthday == nil ? Text("Birthday: N/A") : Text("Birthday: \((contact.birthday!).formatted(date: .abbreviated, time: .omitted))")
            }
        }
    }
}
