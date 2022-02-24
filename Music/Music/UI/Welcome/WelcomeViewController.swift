//
//  WelcomeViewController.swift
//  Music
//
//  Created by Nguyen Van Thang on 24/02/2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    class func fromStoryboard() -> WelcomeViewController {
        return UIStoryboard(name: "Welcome", bundle: nil).instantiateInitialViewController() as! WelcomeViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Spotify"
        // Do any additional setup after loading the view.
    }
}
