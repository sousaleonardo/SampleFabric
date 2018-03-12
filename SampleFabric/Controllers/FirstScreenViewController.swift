//
//  FirstScreenViewController.swift
//  SampleFabric
//
//  Created by Leonardo Mendes on 12/03/2018.
//  Copyright © 2018 Leonardo Mendes. All rights reserved.
//

import UIKit

class FirstScreenViewController: ViewControllerAnalytics {

    @IBOutlet weak var btnFirst: UIButton!
    @IBOutlet weak var btnSecond: UIButton!
    @IBOutlet weak var btnThird: UIButton!
    @IBOutlet weak var btnFinish: UIButton!
    
    @IBOutlet weak var imgPhoto: UIImageView!
    
    
    @IBAction func clicketButton(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text,
            let title = self.title else {
            
            return
        }
    }
}
