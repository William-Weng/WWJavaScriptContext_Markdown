//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2022/12/15.
//  ~/Library/Caches/org.swift.swiftpm/
//  file:///Users/william/Desktop/WWJavaScriptContext+Markdown

import UIKit
import WebKit
import WWPrint
import WWJavaScriptContext
import WWJavaScriptContext_Markdown

final class ViewController: UIViewController {
    
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func convertHTML(_ sender: UIButton) {
        
        defer { view.endEditing(true) }
        
        guard let text = myTextView.text,
              let htmlString = WWJavaScriptContext.MarkDown.shared.convertHTML(source: text)
        else {
            return
        }
        
        wwPrint(htmlString)
        myWebView.loadHTMLString("\(htmlString)", baseURL: nil)
    }
}

