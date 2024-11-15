//
//  AboutSectionView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 15/11/24.
//

import SwiftUI

struct AboutSectionView: View {
    
    @Binding var contact: Contact
    
    var body: some View {
        Section(header: Text("About")) {
            Text("Name: \(contact.name)")
            Text("Phone number: \(contact.phoneNumber)")
            contact.birthday == nil ? Text("Birthday: N/A") : Text("Birthday: \((contact.birthday!).formatted(date: .abbreviated, time: .omitted))")
        }
    }
}
