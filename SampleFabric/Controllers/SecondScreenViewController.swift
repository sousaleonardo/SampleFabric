//
//  SecondScreenViewController.swift
//  SampleFabric
//
//  Created by Leonardo Mendes on 12/03/2018.
//  Copyright © 2018 Leonardo Mendes. All rights reserved.
//

import UIKit
import Crashlytics

class SecondScreenViewController: TableViewControllerAnalytics {
    override func viewDidAppear(_ animated: Bool) {
        Crashlytics.sharedInstance().crash()
    }
}

