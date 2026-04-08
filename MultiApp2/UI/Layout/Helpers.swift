//
//  Helpers.swift
//  MultiApp2
//
//  Created by Влад Барченков on 08.04.2026.
//

import UIKit

public extension UIView {
    var top: NSLayoutYAxisAnchor { topAnchor }
    var bottom: NSLayoutYAxisAnchor { bottomAnchor }
    var left: NSLayoutXAxisAnchor { leftAnchor }
    var right: NSLayoutXAxisAnchor { rightAnchor }
    var height: NSLayoutDimension { heightAnchor }
    var width: NSLayoutDimension { widthAnchor }
    var centerY: NSLayoutYAxisAnchor { centerYAnchor }
    var centerX: NSLayoutXAxisAnchor { centerXAnchor }
}

public extension UIView {
    typealias SideConstraints = (top: NSLayoutConstraint, right: NSLayoutConstraint, left: NSLayoutConstraint, bottom: NSLayoutConstraint)
    
    @discardableResult
    func pin(to view: UIView, insets: UIEdgeInsets = .zero) -> EdgeConstraints {
        .init(
            top: self.top => view.top + insets.top,
            left: self.left => view.left + insets.left,
            bottom: view.bottom => self.bottom + insets.bottom,
            right: view.right => self.right + insets.right
        )
    }
    
    func forAutolayout() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    @discardableResult
    func placedOn(_ parent: UIView) -> Self {
        parent.addSubview(self.forAutolayout())
        return self
    }
    
    func pinToCenter(of view: UIView) {
        self.centerX => view.centerX
        self.centerY => view.centerY
    }
    
    @discardableResult
    func pinned(to view: UIView, insets: UIEdgeInsets = .zero) -> Self {
        pin(to: view, insets: insets)
        return self
    }

    func pinToSuperviewCenter() {
        guard let view = superview else { return }
        pinToCenter(of: view)
    }

    @discardableResult
    func pinToSuperviewEdges(insets: UIEdgeInsets = .zero) -> Self {
        guard let view = superview else { return self }
        pin(to: view, insets: insets)
        return self
    }
}
