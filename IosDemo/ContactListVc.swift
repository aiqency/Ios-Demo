//
//  ViewController.swift
//  IosDemo
//
//  Created by huissoudyann on 4/6/19.
//  Copyright © 2019 aiqency. All rights reserved.
//

import UIKit
import Kingfisher

class ContactListVc: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Instance variables
    
    var contacts = [Contact]()
    
    // MARK: - Class functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callContactsAsync { [weak self] (contacts) in
            self?.contacts = contacts
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            switch id {
                case "contactSegue" :
                    if let vc = segue.destination as? ContactDetailVc {
                        vc.modalTransitionStyle = .crossDissolve
                        let bundle = sender as! ContactBundle
                        vc.contact = bundle.contact
                        vc.originalPosition = bundle.position
                        vc.originalSize = bundle.size
                    }
                default: break
            }
            
        }
    }
}

extension ContactListVc: UITableViewDataSource {
    
    // MARK: - Table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tbCell", for: indexPath) as! TableViewCell;
        let contact = contacts[indexPath.row]
        cell.label.text = "\( contact.name.first ?? "") \( contact.name.last ?? "")"
        cell.img.round()
        cell.img.kf.setImage(with: URL(string: contact.picture.thumbnail ?? ""))
        cell.setSelected(false, animated: true)
        addTapGesture(toImageView: cell.img, forRow: indexPath)
        return cell
    }
    
    // MARK: - TapGesture
    
    func addTapGesture(toImageView img: UIImageView, forRow indexPath: IndexPath){
        let tap = GenericTapGesture(target: self, action: #selector(self.rowTap))
        tap.object = indexPath
        img.isUserInteractionEnabled = true;
        img.addGestureRecognizer(tap)
    }
    
    @objc func rowTap(tap: GenericTapGesture){
        if let indexPath = tap.object as? IndexPath {
            if let cell = tableView?.cellForRow(at: indexPath) as? TableViewCell,
                let img = cell.img {
                let contact = contacts[indexPath.row]
                let contacBundle = ContactBundle()
                contacBundle.position = img.positionOnScreen
                contacBundle.contact = contact
                contacBundle.size = img.frame.size
                performSegue(withIdentifier: "contactSegue", sender: contacBundle)
                
            }
        }
    }
}
