//
//  CactusKeyboard.swift
//  CactusKeyboard
//
//  Created by Maxim Vialykh on 1/26/18.
//

import UIKit

public typealias KeyboardCompletion = (Bool, CGFloat) -> Void

private class KeyboardObject {
    
    let completion: KeyboardCompletion
    
    init(_ completion: @escaping KeyboardCompletion) {
        self.completion = completion
    }
    
}

public protocol KeyboardCompletionProtocol {
    func addKeyboardObserver(for observer: UIViewController, _ completion: @escaping KeyboardCompletion)
    func removeKeyboardObserver(for observer: UIViewController)
}

public final class CactusKeyboard: KeyboardCompletionProtocol {
    
    static let `default` = CactusKeyboard()
    
    private var observers: NSMapTable<NSString, KeyboardObject> = NSMapTable(keyOptions: NSPointerFunctions.Options.strongMemory, valueOptions: NSPointerFunctions.Options.strongMemory)
    
    private init() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Notifications
    @objc private func keyboardWillShow(_ notification: Notification) {
        var userInfo = notification.userInfo!
        let keyboardFrame: CGRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        postCompletions(with: true, height: keyboardFrame.height)
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        postCompletions(with: false, height: 0)
    }
    
    // MARK: - Inner
    private func postCompletions(with visibility: Bool, height: CGFloat) {
        guard let enumerator = observers.objectEnumerator() else { return }
        
        enumerator.forEach {
            if let object = $0 as? KeyboardObject {
                object.completion(visibility, height)
            }
        }
    }
    
    // MARK: - KeyboardCompletionProtocol
    public func addKeyboardObserver(for observer: UIViewController, _ completion: @escaping (Bool, CGFloat) -> Void) {
        observers.setObject(KeyboardObject(completion), forKey: "\(type(of: observer))" as NSString)
    }
    
    public func removeKeyboardObserver(for observer: UIViewController) {
        observers.removeObject(forKey: "\(observer)" as NSString)
    }
}

public extension UIViewController {
    
    func addKeyboardObserver(_ completion: @escaping (Bool, CGFloat) -> Void) {
        CactusKeyboard.default.addKeyboardObserver(for: self, completion)
    }
    
    func removeKeyboardObserver() {
        CactusKeyboard.default.removeKeyboardObserver(for: self)
    }
    
}
