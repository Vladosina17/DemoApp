//
//  SizeConstraints.swift
//  MultiApp2
//
//  Created by Влад Барченков on 08.04.2026.
//

import UIKit
import ViennaShared

public struct SizeConstraints {
    public var width: NSLayoutConstraint
    public var height: NSLayoutConstraint

    public init(width: NSLayoutConstraint, height: NSLayoutConstraint) {
        self.width = width
        self.height = height
    }
}

extension SizeConstraints {
    public func update(width value: CGFloat) {
        width.constant = value
    }
    
    public func update(height value: CGFloat) {
        height.constant = value
    }
    
    public func update(size: CGSize) {
        width.constant = size.width
        height.constant = size.height
    }
}
