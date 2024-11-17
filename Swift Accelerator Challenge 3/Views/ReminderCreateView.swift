//
//  ReminderCreateView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//

import SwiftUI

struct ReminderCreateView: View {
    @State var reminderDescription = ""
    @State var reminderDate = Date()
    @Binding var contact: Contact
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form{
            TextField("Description...", text: $reminderDescription)
            DatePicker("Reminder Date", selection: $reminderDate, in: Date.init()...)
            Button{
                let id = scheduleNotifications(title: reminderDescription, body: "Do what you need to do", date: reminderDate)
                contact.reminders.append(Reminder(text: reminderDescription, date: reminderDate, notificationId: id))
                print(contact)
                presentationMode.wrappedValue.dismiss()
            }label:{
                Text("Save...")
            }.disabled(reminderDescription.isEmpty)
        }
    }
}

func scheduleNotifications(title: String, body: String, date: Date) -> String {
    
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .default
    
    let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
    let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
    //let repeatedTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
    let notificationId = UUID().uuidString
    
    let request = UNNotificationRequest(identifier: notificationId, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error)")
        } else {
            print("Notification scheduled successfully.")
        }
    }
    
    return notificationId
    //return request
}
