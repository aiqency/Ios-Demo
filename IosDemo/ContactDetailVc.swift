//
//  ContactDetailVc.swift
//  IosDemo
//
//  Created by yannhuissoud on 13/12/20.
//  Copyright © 2020 aiqency. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ContactDetailVc: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var bg: UIView!
    
    var contact: Contact?
    var originalPosition: CGPoint?
    var originalSize: CGSize?
    var imgv: UIImageView?
    
    override func viewDidLoad() {
        let imgv = UIImageView()
        imgv.backgroundColor = .red
        imgv.center = self.originalPosition!
        imgv.frame.size.width = 50
        imgv.frame.size.height = 50
        
        let thumbnail = contact?.picture.thumbnail ?? ""
        let large = contact?.picture.large ?? ""
        ImageCache.default.retrieveImage(forKey: thumbnail) {(result) in
            switch result {
            case .success(let value):
                if let image = value.image {
                    imgv.kf.setImage(with: URL(string: large), placeholder: image)
                }
            case .failure(let error):
                print(error)
            }
        }
        
        imgv.round()
        view.addSubview(imgv)
        self.imgv = imgv
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.bgTap))
        bg.addGestureRecognizer(tap)
    }
    
   @objc func bgTap(){
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: { [weak self] in
             if let v = self?.imgv {
                v.center.x = self!.originalPosition!.x+(self!.originalSize!.width/2)
                v.center.y = self!.originalPosition!.y+(self!.originalSize!.height/2)
                v.bounds.size = self!.originalSize!
                v.round()
            }
        }) { b in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: { [weak self] in
            if let v = self?.imgv {
                v.center = self!.view!.center
                v.layer.cornerRadius = 0
                let size = CGSize(width: self!.view.frame.width/1.5, height: self!.view.frame.height/1.5)
                let minSize = min(size.width, size.height)
                v.bounds.size = CGSize(width: minSize, height: minSize)
            }
        }, completion: nil)
    }
}

