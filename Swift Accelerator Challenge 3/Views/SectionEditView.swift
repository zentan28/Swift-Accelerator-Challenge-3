//
//  SectionEditView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 17/11/24.
//

import SwiftUI

struct SectionEditView: View {
    @Binding var categoryList: [ContactCategory]
    var body: some View {
        NavigationStack {
            List{
                ForEach($categoryList, editActions: [.all]){$category in
                    Text(category.name)
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

