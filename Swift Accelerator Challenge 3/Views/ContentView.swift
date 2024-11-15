//
//  ContentView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 2/11/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
//    @Environment(ContactCategoryManager.self) var $contactCategoryManager
//    @Bindable var contactCategoryManager = contactCategoryManager
    
    var body: some View {
        TabView {
            Tab("Contacts", systemImage: "person.crop.circle.fill") {
                ContactListView()
            }
            Tab("Reminders", systemImage: "clock") {
                ReminderListView()
            }
//            Tab("Create Reminders", systemImage: "clock") {
//                ReminderCreateViewTest(contact: $contactCategoryManager.contactCategories[0])
//            }
        }
    }
}
#Preview {
    ContentView()
        .environment(ContactCategoryManager())
}
