//
//  ContactSectionView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 9/11/24.
//

import SwiftUI
struct ContactSectionView: View {
    @Binding var contact: Contact
    var body: some View {
        Section{
            //ForEach(contact){$contact in
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
            //}
//            
//            .onDelete{indexSet in
//                contact.remove(atOffsets: indexSet)
//            }
//            .onMove{indices, newOffset in
//                contact.move(fromOffsets: indices, toOffset: newOffset)
//            }
        }header:{
            HStack{
                NavigationLink{
                    
                }label:{
                    Image(systemName: "plus")
                }
            }
        }

    }
}
