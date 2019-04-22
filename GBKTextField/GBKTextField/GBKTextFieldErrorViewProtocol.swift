//
//  GBKBottomErrorProtocol.swift
//  GBKTextField
//
//  Created by Dmitry Popravka on 3/6/19.
//  Copyright © 2019 gbksoft. All rights reserved.
//

import UIKit

// Protocol that describes the required methods for the error view
public protocol GBKTextFieldErrorViewProtocol {
    func update(text: String?)
}

// MARK: - Implementation of showing/hiding methods
extension GBKTextFieldErrorViewProtocol where Self: UIView {
    
    /// Showing view
    ///
    /// - Parameter text: Text of the error
    func showError(text: String) {
        update(text: text)
        superviewLayoutIfNeeded()
    }
    
    /// Hiding view
    func hideError() {
        update(text: nil)
        superviewLayoutIfNeeded()
    }
    
    /// Call the method layoutIfNeeded in superview
    private func superviewLayoutIfNeeded() {
        
        var viewForUpdate: UIView? = self
        
        while viewForUpdate?.superview != nil {
            viewForUpdate = viewForUpdate?.superview
        }
        
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
            viewForUpdate?.layoutIfNeeded()
        }
    }
}
