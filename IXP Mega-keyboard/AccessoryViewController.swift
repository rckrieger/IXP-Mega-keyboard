//
//  AccessoryViewController.swift
//  IXP Mega-keyboard
//
//  Created by Rebecca Krieger on 4/21/21.
//

import SwiftUI
import UIKit

struct AccessoryViewController<Page: View>: UIViewControllerRepresentable {

    func makeCoordinator() -> Coordinator {
          Coordinator(self)
      }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let accessoryViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)

        return accessoryViewController
    }
    func updateUIViewController(_ accessoryViewController: UIPageViewController, context: Context) {
      //  accessoryViewController.setViewControllers(
        //    [UIHostingController(rootView: )], direction: .forward, animated: true)
        // [context.coordinator.controllers[0]];, direction: .forward, animated: true)

    }
    class Coordinator: NSObject {
        var parent: AccessoryViewController
        var controllers = [UIViewController]()

        init(_ accessoryViewController: AccessoryViewController) {
            parent = accessoryViewController
            //controllers = parent.pages.map { UIHostingController(rootView: $0) }//

        }
        func accessoryViewController(
            _ accessoryViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }

        func accessoryViewController(
            _ accessoryViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
    }
}

