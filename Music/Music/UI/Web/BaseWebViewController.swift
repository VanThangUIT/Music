//
//  BaseWebViewController.swift
//  Music
//
//  Created by Nguyen Van Thang on 24/02/2022.
//

import UIKit
import WebKit

class BaseWebViewController: UIViewController, WKUIDelegate {
    
    private(set) lazy var webView = self.view as! WKWebView

    override func loadView() {
        let wv = WKWebView()
        wv.allowsBackForwardNavigationGestures = true
        wv.uiDelegate = self
        
        self.view = wv
    }

    /// Extract query parameters from URL string
    ///
    ///  - Parameter string: URL string
    ///  - Returns: Returns the result as Dictionary
    static func toParameters(string: String) -> [String: String] {
        var result = [String: String]()
        
        for item in URLComponents(string: string)?.queryItems ?? [] {
            result[item.name] = item.value ?? ""
        }
        
        return result
    }
    
    // MARK: - WKUIDelegate
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completionHandler()
        })

        self.present(alert, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            completionHandler(false)
        })

        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completionHandler(true)
        })

        self.present(alert, animated: true, completion: nil)
    }
    
    
}
