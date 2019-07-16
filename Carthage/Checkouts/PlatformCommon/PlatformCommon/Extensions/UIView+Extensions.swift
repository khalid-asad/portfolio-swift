//
//  UIView+Extensions.swift
//  Nebula
//
//  Created by Khalid Asad on 2019-06-24.
//  Copyright © 2019 Khalid Asad. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    public class func fromNib<T: UIView>() -> T {
        // swiftlint:disable force_unwrapping
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    public func addConstraintSubview(_ view: UIView, edgeInset: UIEdgeInsets = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        view.topAnchor.constraint(equalTo: topAnchor, constant: edgeInset.top).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: edgeInset.bottom).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: edgeInset.left).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: edgeInset.right).isActive = true
    }
    
    public static func createView(withSubview view: UIView, edgeInsets: UIEdgeInsets = .zero, backgroundColor: UIColor = .white) -> UIView {
        let newView = UIView()
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.backgroundColor = backgroundColor
        newView.addConstraintSubview(view, edgeInset: edgeInsets)
        return newView
    }
    
    public func addBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    public func setRoundedCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    public func addShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
