//
//  PetsDetailVC.swift
//  PetCare Connect
//
//  Created by Dasharath Naik on 22/04/24.
//

import UIKit
import WebKit

class PetsDetailVC: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var urlToLoad: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.navigationDelegate = self
        setupURL(url: urlToLoad ?? "")
    }

    private func setupURL(url: String) {
        guard let url = urlToLoad else {
            print("URL is nil")
            return
        }

        loadUrl(url: url)
    }

    private func loadUrl(url: String) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webview.load(request)
            activityIndicator.startAnimating()
        }
    }

    // MARK: - WKNavigationDelegate

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}
