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
                    }
                }
            }else{
                ContentUnavailableView("No contacts found.", image: "person.crop.circle.badge.questionmark.fill", description: Text("Add your first contact"))
            }
        }
    .searchable(text: $searchText)
    .toolbar {
        ToolbarItem(placement: .bottomBar) {
            Button("Press Me") {
                print("Pressed")
                }
            }
        }
    }
}

#Preview {
    ContactListView()
}
