//
//  GBKTextField.swift
//  GBKTextField
//
//  Created by Dmitry Popravka on 3/6/19.
//  Copyright © 2019 gbksoft. All rights reserved.
//

import UIKit

/// View type for displaying an error
public typealias GBKTextFieldErrorViewType = (UIView & GBKTextFieldErrorViewProtocol)

/// UITextField + Error display below the text
open class GBKTextField: UITextField {
    
    @IBInspectable public var errorText: String = ""

    @IBInspectable public var setupDefaultErrorView: Bool = false {
        didSet {
            if setupDefaultErrorView {
                setup(errorView: GBKTextFieldDefaultErrorView())
            }
        }
    }
    
    private(set) var textHeight: CGFloat = 24
    private(set) var errorView: GBKTextFieldErrorViewType?
    
    //MARK: -
    //MARK: init
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    //MARK: -
    //MARK: setup
    
    private func setup() {
        textHeight = frame.size.height < textHeight ? textHeight : frame.size.height
        borderStyle = .none
        translatesAutoresizingMaskIntoConstraints = false
    }

   public func setup(errorView view: GBKTextFieldErrorViewType) {
        
        errorView?.removeFromSuperview()
        errorView = view
        
        guard let errorView = errorView else { return }
        
        addSubview(errorView)
        
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.topAnchor.constraint(equalTo: topAnchor,
                                       constant: textHeight).isActive = true
        errorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        errorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        errorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    //MARK: -
    //MARK: override text rect

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        
        let padding: UIEdgeInsets = {
            
            if errorView != nil {
                return UIEdgeInsets(top: 4, left: 4, bottom: frame.size.height - textHeight + 4, right: 4)
            }
            
            return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        } ()
        
        return bounds.inset(by: padding)
    }
    
    override open func borderRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

    //MARK: -
    //MARK: show/hide error methods
    
    public func showError(text: String? = nil) {
        errorView?.showError(text: text ?? errorText)
    }
    
    public func hideError() {
        errorView?.hideError()
    }
}
