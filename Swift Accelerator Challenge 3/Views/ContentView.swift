//
//  ContentView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 2/11/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    init() {
        requestNotificationAuthorization()

    }
    
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
        .onAppear() {
            scheduleNotification(title: "Reminder Alert", body: "Don't forget to check your reminders!", timeInterval: 5)
                    
        }
                
    }
}
func requestNotificationAuthorization() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error)")
            } else if granted {
                print("Notification authorization granted.")
            } else {
                print("Notification authorization denied.")
            }
        }
    }

func scheduleNotification(title: String, body: String, timeInterval: TimeInterval) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
    
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error)")
        } else {
            print("Notification scheduled successfully.")
        }
    }
    #Preview {
        ContentView()
            .environment(ContactCategoryManager())
    }
}
