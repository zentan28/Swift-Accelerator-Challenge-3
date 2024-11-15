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
        NavigationStack {
            VStack {
                List {
                    /// basic information
                    AboutSectionView(contact: $contact)
                    
                    /// notes section
                    NotesSectionView(contact: $contact)
                    
                    /// reminders
                    RemindersSectionView(contact: $contact)
                    
                    /// either show first 3 discarded reminders or nothing if it's empty
                    DiscardedRemindersSectionView(contact: $contact)
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

