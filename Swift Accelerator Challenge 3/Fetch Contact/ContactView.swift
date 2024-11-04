//
//  ContactView.swift
//  Swift Accelerator Challenge 3
//
//  Created by T Krobot on 4/11/24.
//

import SwiftUI
import Contacts
import ContactsUI

struct ContactView: View {
    @State var contacts  = [CNContact]()
    
    var body: some View {
        NavigationView {
            List(contacts, id: \.identifier) { contactDetail in
                Text("\(contactDetail.givenName) \(contactDetail.familyName)")
            }
            .transition(.slide)
            .onAppear(perform: getContactList)
            .navigationTitle("Contact List")
        }
    }
    
    func getContactList() {
        let CNStore = CNContactStore()
        
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            do {
                let keys = [CNContactGivenNameKey as CNKeyDescriptor, CNContactFamilyNameKey as CNKeyDescriptor]
                let request = CNContactFetchRequest(keysToFetch: keys)
                try CNStore.enumerateContacts(with: request, usingBlock: { contact, _ in
                    contacts.append(contact)
                })
            } catch {
                print("Error on contact fetch: \(error.localizedDescription)")
            }

        case .notDetermined:
            print("notDetermined")
            CNStore.requestAccess(for: .contacts) { granted, error in
                if granted {
                    getContactList()
                } else if let error = error {
                    print("Error requesting contact access: \(error.localizedDescription)")
                }
            }
            
        case .restricted:
            print("restricted")
            
        case .denied:
            print("denied")
            
        case .limited:
            print("limited")
            
        @unknown default:
            print("")
        }
        
    }
}
