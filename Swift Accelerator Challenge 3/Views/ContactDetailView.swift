//
//  ContactDetailView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//

import SwiftUI


struct ContactDetailView: View {
    
    @Binding var contact: Contact
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
                    RemindersSectionViewTest(contact: $contact) //problem starts here
                    
                    /// either show first 3 discarded reminders or nothing if it's empty
                    DiscardedRemindersSectionView(contact: $contact) //problem here as well, but i'll ignore it first (likely same problem as the one above)
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

