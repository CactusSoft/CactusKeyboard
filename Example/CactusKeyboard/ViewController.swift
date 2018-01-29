//
//  ViewController.swift
//  CactusKeyboard
//
//  Created by Maxim Vialykh on 01/26/2018.
//  Copyright (c) 2018 Maxim Vialykh. All rights reserved.
//

import CactusKeyboard

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addKeyboardObserver { [weak self] (visible, height) in
            guard let `self` = self else { return }
            print("\(self) keyboard visible: \(visible) height:\(height)")
        }
    }
    
    deinit {
        removeKeyboardObserver()
        print("\(self) removeKeyboardObserver")
    }

    // MARK: - Actions
    @IBAction func hideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
}

