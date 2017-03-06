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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            let animalName  = animals[index!]
            destination.image = UIImage(named: animalName)
        }
    }
}

