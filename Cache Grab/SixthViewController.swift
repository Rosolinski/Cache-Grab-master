//
//  FourthViewController.swift
//  Cache Grab
//
//  Created by Robin Osolinski on 22/12/2015.
//  Copyright © 2015 Robin Osolinski. All rights reserved.
//

import UIKit
import MapKit
import Foundation

class SixthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.hidden = false
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }
    
}
