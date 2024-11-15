//
//  NotesSectionView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 15/11/24.
//

import SwiftUI

struct NotesSectionView: View {
    
    @Binding var contact: Contact
    @Environment(\.editMode) var editMode
    
    var body: some View {
        Section("Notes") {
            if editMode?.wrappedValue == EditMode.active {
                TextEditor(text: $contact.other)
                    .frame(minHeight: 50)
                    .fixedSize(horizontal: false, vertical: true)
            } else {
                Text(contact.other)
            }
        }
    }
}
