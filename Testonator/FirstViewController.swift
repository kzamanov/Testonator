//
//  FirstViewController.swift
//  Testonator
//
//  Created by Kostadin Zamanov on 2/26/17.
//  Copyright © 2017 Zamanisher. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var animals:[String] {
        get {
            let path = Bundle.main.path(forResource: "animals", ofType: "plist")
            if let _ = path {
                return NSArray(contentsOfFile: path!) as! [String]
            }
            
            return []
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("Warning")
    }

    //MARK: Tableview methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstVCTableviewCell")!
        cell.textLabel?.text = animals[indexPath.last!] as String
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetails") {
            let destination = segue.destination as! DetailViewController
            let index = tableView.indexPath(for: sender as! UITableViewCell)?.last!
            let animalName  = animals[index! + 1]
            destination.image = UIImage(named: animalName)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            
        }
    }
}
