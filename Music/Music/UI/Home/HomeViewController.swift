//
//  HomeViewController.swift
//  Music
//
//  Created by Nguyen Van Thang on 23/02/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    class func fromStoryboard() -> HomeViewController {
        return UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
