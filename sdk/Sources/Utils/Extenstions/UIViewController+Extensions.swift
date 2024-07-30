//
//  UIViewController+Extensions.swift
//  sdk
//
//  Created by Sergey Iskhakov on 21.09.2020.
//  Copyright © 2020 Cloudpayments. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        DispatchQueue.main.async { [weak self] in
            self?.view.endEditing(true)
        }
    }
    
    /* Shows default OK action if actions is nil */
    func showAlert(title: String?, message: String?, completion: (() -> Void)? = nil, shouldDismiss: (() -> Bool)? = nil) {
        let alert = UIAlertController(title: title ?? "", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let shouldDismiss = shouldDismiss, shouldDismiss() {
                self.dismiss(animated: true, completion: nil)
            } else {
                completion?()
            }
        }
        
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
