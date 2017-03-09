//
//  SecondDetailVC.swift
//  Testonator
//
//  Created by Kostadin Zamanov on 3/9/17.
//  Copyright © 2017 Zamanisher. All rights reserved.
//

import UIKit

class SecondDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView:UITableView!
    @IBOutlet var selectionLabel:UILabel!
    var items:[String] = []
    
    override func viewDidLoad() {
        items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
        self.title = "List Details"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CheckboxTableViewCell
        cell.textLabel?.text = items[indexPath.last!]
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CheckboxTableViewCell
        selectionLabel.text = cell.textLabel?.text
    }
    
    @IBAction func deleteRow(sender: UIButton) {
        let cell = sender.superview?.superview as! CheckboxTableViewCell
        items.remove(at: tableView.indexPath(for: cell)!.last!)
        tableView.reloadData()
    }
    
    @IBAction func newItemPressed(sender:UIButton) {
        items.append("New Item")
        tableView.reloadData()
    }
}
