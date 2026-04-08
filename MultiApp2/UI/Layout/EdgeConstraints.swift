//
//  EdgeConstraints.swift
//  MultiApp2
//
//  Created by Влад Барченков on 08.04.2026.
//

import UIKit

public struct EdgeConstraints {
    public enum Edge {
        case top
        case left
        case bottom
        case right
    }
    
    public var top: NSLayoutConstraint
    public var left: NSLayoutConstraint
    public var bottom: NSLayoutConstraint
    public var right: NSLayoutConstraint
    
    public init(top: NSLayoutConstraint, left: NSLayoutConstraint, bottom: NSLayoutConstraint, right: NSLayoutConstraint) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
}

// MARK: - Insets

extension EdgeConstraints {
    public func update(horizontal value: CGFloat) {
        left.constant = value
        right.constant = value
    }
    
    public func update(vertical value: CGFloat) {
        left.constant = value
        right.constant = value
    }
    
    public func update(insets: UIEdgeInsets) {
        top.constant = insets.top
        left.constant = insets.left
        bottom.constant = insets.bottom
        right.constant = insets.right
    }
}

// MARK: - Priority

extension EdgeConstraints {
    private func update(_ constraint: NSLayoutConstraint, priority: UILayoutPriority) {
        constraint.priority = priority
    }
    
    func update(edge: Edge, priority: Int) {
        update(edge: edge, priority: UILayoutPriority(integerLiteral: priority))
    }
    
    func update(edge: Edge, priority: UILayoutPriority) {
        switch edge {
        case .top:
            update(top, priority: priority)
        case .left:
            update(left, priority: priority)
        case .bottom:
            update(bottom, priority: priority)
        case .right:
            update(right, priority: priority)
        }
    }
}

// MARK: - UILayoutPriority

extension UILayoutPriority: @retroactive ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .init(rawValue: Float(value))
    }
}
