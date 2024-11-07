//
//  ContactView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//

import SwiftUI

struct ContactListView: View {
    @State private var searchText = ""
    @Environment(ContactCategoryManager.self) var contactCategoryManager
    var body: some View {
        @Bindable var contactCategoryManager = contactCategoryManager
        NavigationStack{
            if !contactCategoryManager.contactCategories.isEmpty{
                List($contactCategoryManager.contactCategories, editActions: [.all]){$category in
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
            }else{
                ContentUnavailableView{
                    Label("No contacts found.", systemImage: "person.crop.circle.badge.questionmark.fill")
                }description:{
                    Text("Add your first contact")
                    NavigationLink{
                        CategoryCreatorView()
                    }label:{
                        Text("Create a new category")
                            .padding()
                            .foregroundStyle(Color.white)
                            .background(Color.blue)
                            .cornerRadius(100)
                    }
                }
                
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("Important Contacts")
    }
}

#Preview {
    ContactListView()
        .environment(ContactCategoryManager())
}
