//
//  ContactSectionView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 9/11/24.
//

import SwiftUI
struct ContactSectionView: View {
    @Binding var contactCategory: ContactCategory
    
    var body: some View {
        Section {
            ForEach($contactCategory.contacts){$contact in
                NavigationLink{
                    ContactDetailView(contact: $contact)
                } label: {
                    VStack(alignment: .leading) {
                        Text(contact.name)
                        Text(contact.other)
                            .frame(maxWidth: .infinity, maxHeight: 10, alignment: .leading)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            
            .onDelete{indexSet in
                contactCategory.contacts.remove(atOffsets: indexSet)
            }
            .onMove{indices, newOffset in
                contactCategory.contacts.move(fromOffsets: indices, toOffset: newOffset)
            }
        } header:{
            HStack{
                Text("\(contactCategory.name)")
                NavigationLink{
                    ContactCreatorView(selectedCategory: $contactCategory)
                } label:{
                    Image(systemName: "plus")
                }
            }
        }

    }
}
