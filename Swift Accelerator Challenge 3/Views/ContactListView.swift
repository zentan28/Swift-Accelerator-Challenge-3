//
//  ContactListView.swift
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
        NavigationStack {
            if !contactCategoryManager.contactCategories.isEmpty {
                List($contactCategoryManager.contactCategories, editActions: [.all]){$category in
                    ContactSectionView(contactCategory: $category)
                }
                .navigationTitle("Contacts")
                .toolbar{
                    EditButton()
                    NavigationLink {
                        CategoryCreatorView()
                    } label: {
                        Image(systemName: "plus")
                    }
                    NavigationLink{
                        SectionOverallView(categoryList: $contactCategoryManager.contactCategories)
                    }label:{
                        Text("Overview")
                    }
                }
                
            } else {
                ContentUnavailableView{
                    Label("No contact category found.", systemImage: "person.crop.circle.badge.questionmark.fill")
                } description: {
                    Text("Add your first contact category")
                    NavigationLink {
                        CategoryCreatorView()
                    } label: {
                        Text("Create a new category")
                            .padding()
                            .foregroundStyle(Color.white)
                            .background(Color.blue)
                            .cornerRadius(100)
                    }
                }
            }
        }
//        .searchable(text: $searchText)
    }
//    var searchResults: [String] {
//        if searchText.isEmpty {
//            return names
//        } else {
//            return names.filter { $0.contains(searchText) }
//        }
//    }
}

#Preview {
    ContactListView()
        .environment(ContactCategoryManager())
}
