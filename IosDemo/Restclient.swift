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

func callContactsAsync(completion: @escaping ([Contact]) -> Void){
    Alamofire.request("https://randomuser.me/api/?gender=male&nat=us&inc=gender,name,picture&results=50&noinfo")
        .responseJSON { response in
            guard let data = response.data else { return }
            do {
                let contacts = try JSONDecoder().decode(Contacts.self, from: data)
                completion(contacts.results)
            } catch {
                print(error)
            }
    }
}
