//
//  Contact.swift
//  IosDemo
//
//  Created by huissoudyann on 4/8/19.
//  Copyright © 2019 aiqency. All rights reserved.
//

import Foundation
import UIKit

class ContactBundle {
    var contact: Contact?
    var position: CGPoint?
    var size: CGSize?
}

struct Contacts: Decodable {
    var results: [Contact]
}

struct Contact: Decodable {
    var gender: String?
    var name: ContactDetail
    var picture: ContactPicture
    
    var description: String {
        return "\(gender ?? "") \(name)"
    }
}

struct ContactPicture: Decodable  {
    var large: String?
    var medium: String?
    var thumbnail: String?
}

struct ContactDetail: Decodable  {
    var title: String?
    var first: String?
    var last: String?
    
    var description: String {
        return "\(title ?? "") \(first ?? "") \(last ?? "")"
    }
}
