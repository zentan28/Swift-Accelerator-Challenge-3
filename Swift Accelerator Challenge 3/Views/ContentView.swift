//
//  ContentView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 2/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        TabView {
            Tab("Contacts", systemImage: "person.crop.circle.fill") {
                ContactListView()
            }
        }
    }
}
#Preview {
    ContentView()
        .environment(ContactCategoryManager())
}
