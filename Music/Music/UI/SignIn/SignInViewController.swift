//
//  SignInViewController.swift
//  Music
//
//  Created by Nguyen Van Thang on 25/02/2022.
//

import UIKit
import WebKit
import RxSwift

class SignInViewController: BaseWebViewController, WKNavigationDelegate {
    
    class func fromStoryboard() -> SignInViewController {
        return UIStoryboard(name: "SignIn", bundle: nil).instantiateInitialViewController() as! SignInViewController
    }
    
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Sign In"
        
        self.webView.navigationDelegate = self
        guard let url = Constant.signInURL else {
            return
        }
        let urlRequest = createStartRequest(url: url)
        self.webView.load(urlRequest)
        
    }
    
    private func createStartRequest(url: URL) -> URLRequest {
        let request = URLRequest(url: url)
        return request
    }
    
    // MARK: - WKNavigationDelegate
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.targetFrame == nil, let url = navigationAction.request.url {
            decisionHandler(.cancel)

            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else {
            decisionHandler(.allow)
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else { return }
        
        guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: { $0.name == "code" })?.value else {
            return
        }
        print("code \(code)")
        
        AppDefault.share.code = code
        
        let params = FetchTokenParam()
        APIClient.shared.fetchTokenAccessId(params: params)
            .subscribe(onNext: { data in
                print("Token \(data)")
            })
            .disposed(by: disposeBag)
    }
    
}
