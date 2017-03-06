//
//  DetailViewController.swift
//  Testonator
//
//  Created by Kostadin Zamanov on 3/6/17.
//  Copyright © 2017 Zamanisher. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var image:UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        imageView.image = image
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
