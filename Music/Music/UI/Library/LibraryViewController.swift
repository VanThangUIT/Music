//
//  LibraryViewController.swift
//  Music
//
//  Created by Nguyen Van Thang on 23/02/2022.
//

import UIKit

class LibraryViewController: UIViewController {
    
    class func fromStoryboard() -> LibraryViewController {
        return UIStoryboard(name: "Library", bundle: nil).instantiateInitialViewController() as! LibraryViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
