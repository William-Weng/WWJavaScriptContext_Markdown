//
//  WWJavaScriptContext_Markdown.swift
//  WWJavaScriptContext_Markdown
//
//  Created by William.Weng on 2025/03/16.
//
//

import UIKit
import JavaScriptCore
import WWJavaScriptContext

// MARK: - WWJavaScriptContext.MarkDown
extension WWJavaScriptContext {
    
    open class Markdown: NSObject {
        
        public static let shared = Markdown(filename: "Marked-15.0.11.js")
        
        var context: WWJavaScriptContext?
        
        private override init() {}
        
        convenience init(filename: String) {
            self.init()
            self.context = self.build(filename: filename)
        }
    }
}

// MARK: - 公開函數
public extension WWJavaScriptContext.Markdown {
    
    /// [解析Markdown => HTML](https://cdnjs.cloudflare.com/ajax/libs/showdown/2.1.0/showdown.min.js)
    /// - Parameters:
    ///   - markdown: String
    ///   - tables: [是否開啟HTML的原生Table顯示](https://blog.csdn.net/StimmerLove/article/details/88966827)
    /// - Returns: JSValue?
    func parse(markdown: String) -> JSValue? {
        
        guard let context = context,
              let script = readScript(with: "jsSource.js")
        else {
            return nil
        }
        
        _ = context.evaluateScript(script)
        return context.callFunctionName("parseMarkdown", arguments: [markdown])
    }
}

// MARK: - 小工具
private extension WWJavaScriptContext.Markdown {
    
    /// 建立初始物件
    /// - Parameter filename: String
    /// - Returns: WWJavaScriptContext?
    func build(filename: String) -> WWJavaScriptContext? {
        
        guard let script = readScript(with: filename) else { return nil }
        return WWJavaScriptContext.build(script: script)
    }
    
    /// 讀取Script
    /// - Parameter filename: String
    /// - Returns: String?
    func readScript(with filename: String) -> String? {
        
        guard let sourcePath: String = Bundle.module.path(forResource: filename, ofType: nil),
              let script = try? String(contentsOfFile: sourcePath)
        else {
            return nil
        }
        
        return script
    }
}
