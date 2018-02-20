//
//  AuthViewController.swift
//  nativeHandset
//
//  Created by Albert Gao on 29/01/18.
//  Copyright © 2018 salect. All rights reserved.
//

import UIKit

class LetMeJoinViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var AUSwitch: UISwitch!
    @IBOutlet weak var NZSwitch: UISwitch!
    @IBOutlet weak var DoneButton: UIBarButtonItem!
    
    // MARK: Private properties
    var selectedCountry:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupSwitchAction(mySwitch:AUSwitch)
        setupSwitchAction(mySwitch:NZSwitch)
        runTest()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARKS: Actions
    @objc func switchChanged(mySwitch: UISwitch) {
        guard let id = mySwitch.restorationIdentifier else {
            fatalError("The view needs to have a restoration Id")
        }
        let value = mySwitch.isOn
        
        if id == "AUSwitch" {
            self.NZSwitch.isOn = !value
        } else {
            self.AUSwitch.isOn = !value
        }
        
        if self.NZSwitch.isOn {
            self.selectedCountry = "NZSwitch"
        } else {
            self.selectedCountry = "AUSwitch"
        }
    }
    
    // MARKS: private utils
    private func setupSwitchAction(mySwitch:UISwitch) {
        mySwitch.addTarget(
            self,
            action: #selector(switchChanged(mySwitch:)),
            for: UIControlEvents.valueChanged
        )
    }

    private func runTest() {
        let sCallback: (_ result: String) -> Void = { result in
            print("Http result: ", result)
        }

        let eCallback: (_ result: String) -> Void = { result in
            if Thread.current.isMainThread {
                print("In main thread--completion handler")
            } else {
                print("Not in main thread--completion handler")
            }
            
            print("Http error: ", result)
        }

        let http1 = Http(
            url:"http://127.0.0.1:8080/m/register",
            shouldDispatch: true,
            successCallback: sCallback,
            errorCallback: eCallback
        )
        
        let query = [
            "tt": "fc",
            "devid": "",
            "pc": "064"
        ]
        
        http1.get(queryString:query)
        
        let http = Http(
                url:"http://127.0.0.1:8080/Login/",
                shouldDispatch: false,
                successCallback: sCallback,
                errorCallback: eCallback
        )

        let postBody = [
            "asd":"123",
            "age": "16"
        ]
        
        http.post(postBody:postBody)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
