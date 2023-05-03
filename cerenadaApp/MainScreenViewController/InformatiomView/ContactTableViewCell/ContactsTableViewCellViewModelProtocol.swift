//
//  ContactsTableViewCellViewModelProtocol.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 03.05.2023.
//

import Foundation

protocol ContactsTableViewCellViewModelProtocol {
    var phoneNumber: String? { get }
    var email: String? { get }
    init(contacts: Contacts)
}
