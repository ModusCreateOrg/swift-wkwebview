//
//  ViewController.swift
//  swift-wkwebview
//
//  Created by Michael Schwartz on 1/15/16.
//  Copyright (c) 2016 Modus Create. All rights reserved.
//


import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let frameRect: CGRect = CGRect(x: 0, y: 20, width: screenSize.width, height: screenSize.height)

        self.webView = WKWebView(frame: frameRect)

        // tell webview that we are the UIDelegate to handle alert(), confirm(), etc.
        self.webView.UIDelegate = self

        self.webView.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
        self.view.addSubview(self.webView)

        let url: NSURL! = NSBundle.mainBundle().URLForResource("dist/index", withExtension: "html")
        webView.loadRequest(NSURLRequest(URL: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: (() -> Void)) {
        print("webView:\(webView) runJavaScriptAlertPanelWithMessage:\(message) initiatedByFrame:\(frame) completionHandler:\(completionHandler)")

        let alertController = UIAlertController(title: frame.request.URL?.host, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            completionHandler()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
