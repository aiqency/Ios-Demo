//
//  Contact.swift
//  IosDemo
//
//  Created by huissoudyann on 4/8/19.
//  Copyright © 2019 aiqency. All rights reserved.
//

import Foundation


class Contact {
    var gender: String?
    var name: ContactDetail?
    var picture: ContactPicture?
    
    var description: String {
        return "\(gender!) \(name!)"
    }
}

class ContactPicture {
    var large: String?
    var medium: String?
    var thumbnail: String?
}

class ContactDetail {
    var title: String?
    var first: String?
    var last: String?
    
    var description: String {
        return "\(title!) \(first!) \(last!)"
    }
}
