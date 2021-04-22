//
//  SpecialTextFieldView.swift
//  IXP Mega-keyboard
//
//  Created by Rebecca Krieger on 4/21/21.
//

import SwiftUI
import UIKit

struct SpecialTextFieldView<Page: View>: UIViewRepresentable {

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField
        textField.inputAccessoryView = accessoryViewController.view


        
        return view
    }
}
