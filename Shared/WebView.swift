//
//  InformationView.swift
//  firedanger-sui
//
//  Created by Kemal Enver on 21/8/2023.
//

import SwiftUI

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
