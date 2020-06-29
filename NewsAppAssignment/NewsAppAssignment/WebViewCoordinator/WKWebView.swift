//
//  WKWebView.swift
//  NewsAppAssignment

import Foundation
import WebKit

class MyWkWebView: WKWebView, WKNavigationDelegate {
    
  
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
}

