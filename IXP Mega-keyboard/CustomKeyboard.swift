//
//  CustomKeyboard.swift
//  IXP Mega-keyboard
//
//  Created by Rebecca Krieger on 4/27/21.
//

import Foundation
import UIKit
import SwiftUI

final class CustomKeyboard: UIInputViewController, UIViewControllerRepresentable {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let customKeyboard = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)

        return customKeyboard
    }
    func updateUIViewController(_ accessoryViewController: UIPageViewController, context: Context) {
      //  accessoryViewController.setViewControllers(
        //    [UIHostingController(rootView: )], direction: .forward, animated: true)
        // [context.coordinator.controllers[0]];, direction: .forward, animated: true)

    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let keyboard:UIView = UIView(frame: CGRect(x:0.0,y:0.0,width:768.0, height:240.0))
           // keyboard.backgroundColor = UIColor.red
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        self.nextKeyboardButton.backgroundColor = UIColor.green
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.green
        } else {
            textColor = UIColor.purple
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
