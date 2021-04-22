//
//  SpecialTextFieldView.swift
//  IXP Mega-keyboard
//
//  Created by Rebecca Krieger on 4/21/21.
//

import SwiftUI
import UIKit
struct SpecialTextFieldView: UIViewRepresentable {
    //@Binding var text: NSMutableAttributedString
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
       // textField.backgroundColor = UIColor.green
        textField.tintColor = UIColor.purple
        textField.keyboardAppearance = .light
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        //uiView.attributedText = text
    }
}
