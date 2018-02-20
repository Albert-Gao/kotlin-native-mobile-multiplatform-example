//
//  FirstViewController.swift
//  nativeHandset
//
//  Created by Albert Gao on 9/01/18.
//  Copyright © 2018 salect. All rights reserved.
//

import UIKit
import nativeLibs

class FirstViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var myLabel:UILabel?
    
    //MARK: Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel?.text = "haha"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

