//
//  ViewControllerAnalitics.swift
//  SampleFabric
//
//  Created by Leonardo Mendes on 12/03/2018.
//  Copyright © 2018 Leonardo Mendes. All rights reserved.
//

import UIKit
import Crashlytics

class ViewControllerAnalytics: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let title = self.title {
            Answers.logCustomEvent(withName: "Will show screen " + title, customAttributes: nil)
        }
    }
}
