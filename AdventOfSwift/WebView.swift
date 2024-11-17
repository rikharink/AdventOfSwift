//
//  WebView.swift
//  AdventOfSwift
//
//  Created by Rik Harink on 17/11/2024.
//
import Foundation
import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    let url: URL
    let sessionCookie: String
    
    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        let cookie = HTTPCookie(properties: [
            .domain: "adventofcode.com",
            .path: "/",
            .name: "session",
            .value: sessionCookie,
            .secure: true,
            .expires: NSDate(timeIntervalSinceNow: 60 * 60 * 24 * 365) as Date // 1 year
        ])
        if let cookie = cookie {
            webView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
        }
        return webView
        
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        nsView.load(request)
    }
}
