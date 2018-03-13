//
//  SecondScreenViewController.swift
//  SampleFabric
//
//  Created by Leonardo Mendes on 12/03/2018.
//  Copyright © 2018 Leonardo Mendes. All rights reserved.
//

import UIKit
import Crashlytics

class SecondScreenViewController: ViewControllerAnalytics {
    var viewItens = [MockItem]()
    
    override func viewDidLoad() {
        self.viewItens.append(MockItem(name: "Jose", age: 20, birthDate: nil))
        self.viewItens.append(MockItem(name: "Maria", age: 50, birthDate: Date.init(timeIntervalSinceReferenceDate: 1500)))
        self.viewItens.append(MockItem(name: "Pedro", age: 13, birthDate: Date.init(timeIntervalSinceNow: -90082)))
    }
}

extension SecondScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertView = UIAlertController(title: "\(self.viewItens[indexPath.row].name)", message: "O que deseja fazer?", preferredStyle: .alert)
        
        alertView.addAction(UIAlertAction(title: "Exibir foto", style: .default, handler: { (_) in
            self.performSegue(withIdentifier: "showUserPhoto", sender: self.viewItens[indexPath.row])
        }))
        
        alertView.addAction(UIAlertAction(title: "Exibir data de nascimento", style: .default, handler: { (_) in
            let birthDateAlert = UIAlertController(title: "Data de Nascimento", message: "\(self.viewItens[indexPath.row].birthDate!)", preferredStyle: .alert)
            birthDateAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            Crashlytics.sharedInstance().setIntValue(42, forKey: "MeaningOfLife")
            
            self.present(birthDateAlert, animated: true, completion: nil)
        }))
        
        self.present(alertView, animated: true) {
            if (indexPath.row == 2) {
                Crashlytics.sharedInstance().setIntValue(100, forKey: "MeaningOfLife")
                
                let testVar = self.viewItens[0].birthDate!
                print(testVar)
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? PhotoViewController, let user = sender as? MockItem {
            nextViewController.mockUser = user
        }
    }
}

extension SecondScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewItens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "mockCell") as! MockTableViewCell
    
        tableCell.lblName.text = self.viewItens[indexPath.row].name
        tableCell.lblAge.text = "Idade \(self.viewItens[indexPath.row].age)"
        
        return tableCell
    }
}
