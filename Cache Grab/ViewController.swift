//  Cache Grab
//
//  Created by Robin Osolinski on 23/11/2015.
//  Copyright © 2015 Robin Osolinski. All rights reserved.
//

import UIKit
import MapKit
import Foundation

    //Make sure to set the app to run on iPhone 5 and the simulation is set to "Location" if it's not already set.

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
    }

}

