//
//  SectionEditView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 17/11/24.
//

import SwiftUI

struct SectionEditView: View {
    @Binding var category: ContactCategory
    @State var newCatName = ""
    var body: some View {
        Form{
            TextField("New Name", text: $newCatName)
            Button{
                category.name = newCatName
            }label:{
                Text("Rename")
            }
        }
    }
}

