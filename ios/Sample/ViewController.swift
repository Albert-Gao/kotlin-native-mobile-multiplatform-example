//
//  ViewController.swift
//  Sample
//
//  Created by Albert Gao on 22/02/18.
//  Copyright © 2018 albertgao. All rights reserved.
//

import UIKit
import SharediOS

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = SharediOS.SOSSample().checkPlatform()
        label.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

