//
//  PhotoViewController.swift
//  SampleFabric
//
//  Created by Leonardo Mendes on 13/03/2018.
//  Copyright © 2018 Leonardo Mendes. All rights reserved.
//

import UIKit

class PhotoViewController: ViewControllerAnalytics {
    @IBOutlet weak var imgUserPhoto: UIImageView!
    
    var mockUser: MockItem?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let user = self.mockUser {
            self.imgUserPhoto.image = UIImage(imageLiteralResourceName: user.name)
        }
    }
}
