//
//  Restclient.swift
//  IosDemo
//
//  Created by huissoudyann on 4/6/19.
//  Copyright © 2019 aiqency. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

func callContactAsync(completion: @escaping ([Contact]) -> Void){
    Alamofire.request("https://randomuser.me/api/?gender=male&nat=us&inc=gender,name,picture&results=50&noinfo")
        .responseJSON { response in
            let json = JSON(data: response.data!)
            var contacts = [Contact]()
            for (_, subJson):(String, JSON) in json {
                for (_, obj):(String, JSON) in subJson {
                    let contact = Contact()
                    contact.gender = obj["gender"].stringValue
                    let name = obj["name"]
                    
                    let detail = ContactDetail()
                    detail.title  = name["title"].stringValue
                    detail.first  = name["first"].stringValue
                    detail.last = name["last"].stringValue
                    contact.name = detail
                    
                    let objPic = obj["picture"]
                    let picture = ContactPicture()
                    picture.large = objPic["large"].stringValue
                    picture.medium = objPic["medium"].stringValue
                    picture.thumbnail = objPic["thumbnail"].stringValue
                    contact.picture = picture
                    contacts.append(contact)
                }
            }
            for element in contacts {
                print(element, terminator: " ")
            }
            completion(contacts)
    }
}
