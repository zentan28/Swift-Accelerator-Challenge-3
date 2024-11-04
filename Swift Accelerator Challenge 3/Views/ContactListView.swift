//
//  ContactView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 4/11/24.
//

import SwiftUI

struct ContactListView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            List($sampleContactList, editActions: [.all]){$category in
                Section(category.name){
                    ForEach(category.contacts){contact in
                        NavigationLink{
                            Text("placeholder")
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
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ContactListView()
}
