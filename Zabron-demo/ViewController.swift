//
//  ViewController.swift
//  Zabron-demo
//
//  Created by Jahanvi Vyas on 11/11/2020.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    let webView = WKWebView()
    
    override func loadView() {
        self.view = webView
        self.webView.navigationDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "http://zabrone.com") {
            let request = URLRequest(url: url)
            webView.load(request)
            webView.allowsBackForwardNavigationGestures = true
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host {
            if host == "zabrone.com" {
                decisionHandler(.allow)
                return
            }
        }

        decisionHandler(.cancel)
    }
}

