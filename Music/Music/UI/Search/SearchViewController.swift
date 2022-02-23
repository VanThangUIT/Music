//
//  SearchViewController.swift
//  Music
//
//  Created by Nguyen Van Thang on 23/02/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    class func fromStoryboard() -> SearchViewController {
        return UIStoryboard(name: "Search", bundle: nil).instantiateInitialViewController() as! SearchViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
