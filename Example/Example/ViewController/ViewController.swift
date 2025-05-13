//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2022/12/15.
//  ~/Library/Caches/org.swift.swiftpm/
//  file:///Users/william/Desktop/WWJavaScriptContext+Markdown

import UIKit
import WebKit
import WWJavaScriptContext
import WWJavaScriptContext_Markdown

final class ViewController: UIViewController {
    
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func convertMarkdown(_ sender: UIButton) {
        
        defer { view.endEditing(true) }
        
        guard let markdown = myTextView.text,
              let htmlString = WWJavaScriptContext.Markdown.shared.parse(markdown: markdown)
        else {
            return
        }
                
        myWebView.loadHTMLString(htmlString.toString(), baseURL: nil)
    }
}

