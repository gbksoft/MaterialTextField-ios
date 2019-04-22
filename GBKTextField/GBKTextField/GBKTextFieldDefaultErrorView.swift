//
//  GBKTextFieldDefaultErrorView.swift
//  GBKTextField
//
//  Created by Dmitry Popravka on 3/6/19.
//  Copyright © 2019 gbksoft. All rights reserved.
//

import UIKit

/// Default error view in text field
public class GBKTextFieldDefaultErrorView: UIView {
    
    public var errorlabel: UILabel!
    public var bottomLineView: UIView!

    private var padding = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    private var topPaddingAnchor : NSLayoutConstraint?
    private var bottomPaddingAnchor : NSLayoutConstraint?

    private let showErrorColor = UIColor.red
    private let hideErrorColor = UIColor(red: 225.0/255.0,
                                         green: 225.0/255.0,
                                         blue: 225.0/255.0,
                                         alpha: 1)

    //MARK: -
    //MARK: init
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }
    
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
        setupBottomLineView()
        setupErrorLabel()
    }
    
    private func setupBottomLineView() {
        
        bottomLineView = UIView(frame: CGRect.zero)
        bottomLineView.backgroundColor = hideErrorColor
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bottomLineView)
        
        bottomLineView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bottomLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomLineView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomLineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func setupErrorLabel() {
        
        errorlabel = UILabel(frame: CGRect.zero)
        
        errorlabel.text = nil
        errorlabel.font = UIFont.systemFont(ofSize: 14)
        errorlabel.textColor = showErrorColor
        errorlabel.numberOfLines = 0
        errorlabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(errorlabel)
        
        topPaddingAnchor = errorlabel.topAnchor.constraint(equalTo: bottomLineView.bottomAnchor, constant: padding.top)
        topPaddingAnchor?.isActive = true
        
        bottomPaddingAnchor = errorlabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding.bottom)
        bottomPaddingAnchor?.isActive = true
        
        errorlabel.leftAnchor.constraint(equalTo: leftAnchor, constant: padding.left).isActive = true
        errorlabel.rightAnchor.constraint(equalTo: rightAnchor, constant: padding.right).isActive = true
        errorlabel.setContentHuggingPriority(.defaultHigh, for: NSLayoutConstraint.Axis.vertical)
    }
    
}

//MARK: - GBKTextFieldErrorViewProtocol
extension GBKTextFieldDefaultErrorView: GBKTextFieldErrorViewProtocol {
    
    public func update(text: String?) {
        let isShowError = (text?.count ?? 0) != 0
        errorlabel?.text = text
        bottomLineView?.backgroundColor = isShowError ? showErrorColor : hideErrorColor
        topPaddingAnchor?.constant = isShowError ? 4 : 0
        bottomPaddingAnchor?.constant = isShowError ? 4 : 0
    }
}
