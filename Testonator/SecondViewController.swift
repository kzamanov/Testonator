//
//  SecondViewController.swift
//  Testonator
//
//  Created by Kostadin Zamanov on 2/26/17.
//  Copyright © 2017 Zamanisher. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        switch indexPath.last! {
        case 0:
            cell?.textLabel?.text = "List 1"
        case 1:
            cell?.textLabel?.text = "List 2"
        case 2:
            cell?.textLabel?.text = "List 3"
        default:
            break
        }
        
        return cell!
    }
}

