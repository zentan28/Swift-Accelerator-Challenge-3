//
//  ContactSectionView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 9/11/24.
//

import SwiftUI
struct ContactSectionView: View {
    @Binding var category: ContactCategory
    var body: some View {
        Section(category.name){
            ForEach($category.contacts){$contact in
                NavigationLink{
                    ContactDetailView(contact: $contact)
                }label:{
                    HStack{
                        Image(contact.image)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(200)
                        Spacer()
                        VStack{
                            Text(contact.name)
                            Text(contact.other)
                        }
                        Spacer()
                    }
                }
            }
            
            .onDelete{indexSet in
                category.contacts.remove(atOffsets: indexSet)
            }
            .onMove{indices, newOffset in
                category.contacts.move(fromOffsets: indices, toOffset: newOffset)
            }
        }

    }
}
