//
//  DebugMenuView.swift
//  Swift Accelerator Challenge 3
//
//  Created by Calvin Abad on 9/11/24.
//

import SwiftUI

struct DebugMenuView: View {
    var body: some View {
        VStack{
            Text("Debug Menu")
            Button{
                ContactCategoryManager().loadSampleData()
            }label:{
                Text("Load Sample Data")
                    .padding()
                    .foregroundStyle(Color.gray)
            }
        }
    }
}
#Preview {
    DebugMenuView()
}
