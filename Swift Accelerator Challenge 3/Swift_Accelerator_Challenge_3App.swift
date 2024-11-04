//
//  Swift_Accelerator_Challenge_3App.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 2/11/24.
//

import SwiftUI

@main
struct Swift_Accelerator_Challenge_3App: App {
    @State var contactCategoryManager = ContactCategoryManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(contactCategoryManager)
    }
}
