//
//  InstagramLoginViewController.swift
//  kindPoints
//
//  Created by Deekshith Maram on 10/24/18.
//  Copyright © 2018 Deekshith Maram. All rights reserved.
//

import UIKit
import WebKit

class InstagramLoginViewController: UIViewController,UIWebViewDelegate {

    
    @IBOutlet weak var IgLoginWebView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authURL = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments: [API.INSTAGRAM_AUTHURL,API.INSTAGRAM_CLIENT_ID,API.INSTAGRAM_REDIRECT_URI, API.INSTAGRAM_SCOPE])
        let urlRequest = URLRequest.init(url: URL.init(string: authURL)!)
        IgLoginWebView.loadRequest(urlRequest)
        
        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request:URLRequest, navigationType: UIWebView.NavigationType) -> Bool{
       
        return checkRequestForCallbackURL(request: request)
    }

    
    func checkRequestForCallbackURL(request: URLRequest) -> Bool {
       
        let requestURLString = (request.url?.absoluteString)! as String
        if requestURLString.hasPrefix(API.INSTAGRAM_REDIRECT_URI) {
            let range: Range<String.Index> = requestURLString.range(of: "#access_token=")!
            handleAuth(authToken: requestURLString.substring(from: range.upperBound))
           
            return false
        }
       
        return true
    }
    
    func handleAuth(authToken: String) {
     
        print("Instagram authentication token ==", authToken)
       
    }

}
