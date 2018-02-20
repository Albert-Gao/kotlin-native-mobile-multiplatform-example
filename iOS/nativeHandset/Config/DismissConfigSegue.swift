//
//  DismissController.swift
//  nativeHandset
//
//  Created by Albert Gao on 10/01/18.
//  Copyright © 2018 salect. All rights reserved.
//

import Foundation
import UIKit

class DismissConfigSegue: UIStoryboardSegue {
    override func perform() {
        self.source.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
