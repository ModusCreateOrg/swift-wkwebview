//
//  ViewController.swift
//  swift-wkwebview
//
//  Created by Michael Schwartz on 1/15/16.
//  Copyright (c) 2016 Modus Create. All rights reserved.
//


import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // create a WKWebView full size of the screen, minus 20 pixels for the top status bar
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let frameRect: CGRect = CGRect(x: 0, y: 20, width: screenSize.width, height: screenSize.height)
        self.webView = WKWebView(frame: frameRect)

        // add WKWebView to the display
        self.view.addSubview(self.webView)

        // load dist/index.html into the WKWebView
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
}
