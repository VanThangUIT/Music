//
//  TabBarController.swift
//  Music
//
//  Created by Nguyen Van Thang on 23/02/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        
        let home = HomeViewController.fromStoryboard()
        home.title = "Home"
        home.navigationItem.largeTitleDisplayMode = .always
        
        let search = SearchViewController.fromStoryboard()
        search.title = "Search"
        search.navigationItem.largeTitleDisplayMode = .always
        
        let libary = LibraryViewController.fromStoryboard()
        libary.title = "Library"
        libary.navigationItem.largeTitleDisplayMode = .always
        
        let navHome = UINavigationController(rootViewController: home)
        navHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        navHome.navigationBar.prefersLargeTitles = true
        
        let navSearch = UINavigationController(rootViewController: search)
        navSearch.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        navSearch.navigationBar.prefersLargeTitles = true
        
        let navLibrary = UINavigationController(rootViewController: libary)
        navLibrary.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 1)
        navLibrary.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navHome, navSearch, navLibrary], animated: true)
    }
}
