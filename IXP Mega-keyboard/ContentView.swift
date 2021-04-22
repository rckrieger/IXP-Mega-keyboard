//
//  ContentView.swift
//  IXP Mega-keyboard
//
//  Created by Rebecca Krieger on 4/21/21.
//

import SwiftUI
import UIKit

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}


struct ContentView: View {
    @State private var accessoryfield = ""
    @State private var github = ""

    var body: some View {
        VStack{
            HStack {
                Text("Basic")
                TextField("basicfield", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            HStack {
                Text("Basic plus built-ins")
                TextField("basicfield", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .keyboardType(.numberPad)
                    .accentColor(.green)
                    .foregroundColor(.purple)
            }
            HStack {
                Text("Custom wrapped UITextField")
                SpecialTextFieldView()
            }
            HStack {
                Text("Accessory from github")
                AccessoryCapableTextField("github", text: $github)
                    .accessoryViewController(TextFieldAccessoryViewController(), tag: 0)
            
            }

            HStack {
                Text("Rotation: ")
                Text(orientationToString())
            }
        }
    }
    func orientationToString() -> String {
        switch UIDevice.current.orientation {
            case .unknown:
                return "The orientation of the device cannot be determined."
            case .portrait:
                return "The device is in portrait mode, with the device held upright and the Home button at the bottom."
            case .portraitUpsideDown:
                return "The device is in portrait mode but upside down, with the device held upright and the Home button at the top."
            case .landscapeLeft:
                return "The device is in landscape mode, with the device held upright and the Home button on the right side."
            case .landscapeRight:
                return "The device is in landscape mode, with the device held upright and the Home button on the left side."
            case .faceUp:
                return "The device is held parallel to the ground with the screen facing upwards."
            case .faceDown:
                return "The device is held parallel to the ground with the screen facing downwards."
            default:
                return "unknown"
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
