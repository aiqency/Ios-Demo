//
//  ViewController.swift
//  IosDemo
//
//  Created by huissoudyann on 4/6/19.
//  Copyright © 2019 aiqency. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contacts = [Contact]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO - Call rest service
        callContactAsync { [weak self] (contacts) in
            self?.contacts = contacts
            self?.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tbCell", for: indexPath) as! TableViewCell;
        let contact = contacts[indexPath.row]
        if let name = contact.name {
            cell.label.text = "\(name.first!) \(name.last!)"
        }
        cell.img.kf.setImage(with: URL(string: contact.picture!.thumbnail!))
        cell.img.round()
        cell.setSelected(false, animated: true)
        addTapGesture(toCell: cell, forContact: contact)
        return cell
    }
    
    func addTapGesture(toCell cell: TableViewCell, forContact contact: Contact){
        let tap = GenericTapGesture(target: self, action: #selector(self.rowTap))
        let contacBundle = ContactBundle()
        contacBundle.position = cell.img.positionOnScreen
        contacBundle.contact = contact
        tap.object = contacBundle
        cell.addGestureRecognizer(tap)
    }
    
    @objc func rowTap(tap: GenericTapGesture){
        if let contact = tap.object as! ContactBundle? {
            performSegue(withIdentifier: "contactSegue", sender: contact)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath \(indexPath)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            switch id {
                case "contactSegue" :
                    if let vc = segue.destination as? DetailController {
                        vc.modalTransitionStyle = .crossDissolve
                        let bundle = sender as! ContactBundle
                        vc.contact = bundle.contact
                        vc.originalPosition = bundle.position
                    }
                default: break
            }
            
        }
    }

}

class DetailController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var contact: Contact?
    var originalPosition: CGPoint?
    
    override func viewDidLoad() {
        
    }
}

class ContactBundle {
    var contact: Contact?
    var position: CGPoint?
}

