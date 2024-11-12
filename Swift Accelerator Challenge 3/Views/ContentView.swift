//
//  ContentView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 2/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        TabView {
            Tab("Contacts", systemImage: "person.crop.circle.fill") {
                ContactListView()
            }
//            Tab("Detail", systemImage: "person.crop.circle.fill") {
//                ContactDetailView(contact: $)
//            }
//            Tab("List", systemImage: "person.crop.circle.fill") {
//                ContactListView()
//            }
//            Tab("Section", systemImage: "person.crop.circle.fill") {
//                ContactSectionView()
//            }
//            Tab("ReminderCreate", systemImage: "person.crop.circle.fill") {
//                ReminderCreateView()
//            }
        }
    }
}
#Preview {
    ContentView()
        .environment(ContactCategoryManager())
}
