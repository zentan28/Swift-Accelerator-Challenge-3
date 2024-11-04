//
//  ContentView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 2/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            
            
            
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ContentView()
}
