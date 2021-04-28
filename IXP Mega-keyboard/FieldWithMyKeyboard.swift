//
//  FieldWithMyKeyboard.swift
//  IXP Mega-keyboard
//
//  Created by Rebecca Krieger on 4/27/21.
//

import Foundation
import SwiftUI

struct FieldWithMyKeyboard: UIViewRepresentable {
    class ViewModel {
        var placeholder: String
        var text: Binding<String>
        var font: UIFont?
        var customKeyboard: CustomKeyboard?
        init(_ placeholder: String, _ text: Binding<String>) {
            self.placeholder = placeholder
            self.text = text
        }
    }
    
    private var model: ViewModel
    
    init(_ placeholder: String, text: Binding<String>) {
        model = ViewModel(placeholder, text)
    }
    
    // MARK: - Lifecycle Methods
    
    func makeCoordinator() -> FieldWithMyKeyboard.Coordinator {
        return Coordinator(self)
    }
    
    

    //is this the right delegate? 40 vs 44?
    func makeUIView(context: UIViewRepresentableContext<FieldWithMyKeyboard>) -> UITextField {
        let textField = UITextField()
       // textField.delegate = context.coordinator
        
        if let customKeyboard = model.customKeyboard {
            textField.inputView = customKeyboard.view
            //textField.delegate = customKeyboard
            textField.inputDelegate = customKeyboard

            //customKeyboard.addTextField(textField)
        }
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<FieldWithMyKeyboard>) {
        let textField = uiView
        textField.placeholder = model.placeholder
        textField.text = model.text.wrappedValue
        textField.font = model.font
   //     textField.becomeFirstResponder()
        
    }
    
    static func dismantleUIView(_ uiView: UITextField, coordinator: FieldWithMyKeyboard.Coordinator) {
        let textField = uiView
        textField.resignFirstResponder()
       // if let fieldWithMyKeyboard = coordinator.parent.model.customKeyboard {
           // fieldWithMyKeyboard.removeTextField(textField)
        //}
    }
    
    // MARK: - Modifiers
    
    func font(_ font: UIFont) -> FieldWithMyKeyboard {
        model.font = font
        return self
    }
    
    func customKeyboard(_ avc: CustomKeyboard) -> FieldWithMyKeyboard {
        model.customKeyboard = avc
        return self
    }
    
    // MARK: - Coordinator
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: FieldWithMyKeyboard
        
        init(_ parent: FieldWithMyKeyboard) {
            self.parent = parent
        }

    }
}
