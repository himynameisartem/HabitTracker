//
//  ContactsTableViewCellViewModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 03.05.2023.
//

import Foundation

class ContactsTableViewCellViewModel: ContactsTableViewCellViewModelProtocol {
    
    var contacts: Contacts
    
    var phoneNumber: String? {
        return contacts.phoneNumber
    }
    
    var email: String? {
        return contacts.email
    }
    
    required init(contacts: Contacts) {
        self.contacts = contacts
    }
    
    
}
