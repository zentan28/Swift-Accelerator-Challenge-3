//
//  SectionEditView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 17/11/24.
//

import SwiftUI

struct SectionOverallView: View {
    @Binding var categoryList: [ContactCategory]
    @State var renameCategory = false
    var body: some View {
        NavigationStack {
            List{
                ForEach($categoryList, editActions: [.all]){$category in
                    NavigationLink{
                        SectionEditView(category: $category)
                    }label:{
                        Text(category.name)
                    }
                }
                .onDelete{indexSet in
                    categoryList.remove(atOffsets: indexSet)
                }
                .onMove{indices, newOffset in
                    categoryList.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
            .toolbar{
                EditButton()
            }
        }
    }
}

