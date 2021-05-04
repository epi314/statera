//
//  UIView+Alignments.swift
//  Statera
//
//  Created by Pierre Enriquez on 4/05/21.
//

import UIKit

extension UIView {
  
  @discardableResult
  public func alignToSuperview(activate: Bool = true) -> [NSLayoutConstraint]? {
    guard let superview = superview else { return nil }
    translatesAutoresizingMaskIntoConstraints = false
    
    let layoutConstraints: [NSLayoutConstraint] = [
      leftAnchor.constraint(equalTo: superview.leftAnchor),
      rightAnchor.constraint(equalTo: superview.rightAnchor),
      topAnchor.constraint(equalTo: superview.topAnchor),
      bottomAnchor.constraint(equalTo: superview.bottomAnchor)
    ]
    
    if activate {
      NSLayoutConstraint.activate(layoutConstraints)
    }
    
    return layoutConstraints.count > 0 ? layoutConstraints : nil
  }
  
  @discardableResult
  public func alignToSafeArea(activate: Bool = true) -> [NSLayoutConstraint]? {
    guard let superview = superview else { return nil }
    translatesAutoresizingMaskIntoConstraints = false
    
    let layoutConstraints: [NSLayoutConstraint] = [
      leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor),
      rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor),
      topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor),
      bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor)
    ]
    
    if activate {
      NSLayoutConstraint.activate(layoutConstraints)
    }
    
    return layoutConstraints.count > 0 ? layoutConstraints : nil
  }
  
  @discardableResult
  public func alignCenterToSuperview(activate: Bool = true) -> [NSLayoutConstraint]? {
    guard let superview = superview else { return nil }
    return alignCenter(x: superview.centerXAnchor, y: superview.centerYAnchor, xOffset: 0, yOffset: 0, activate: activate)
  }
  
  @discardableResult
  public func alignCenter(x: NSLayoutXAxisAnchor? = nil, y:NSLayoutYAxisAnchor? = nil, xOffset: CGFloat = 0, yOffset: CGFloat = 0, activate: Bool = true) -> [NSLayoutConstraint]? {
    translatesAutoresizingMaskIntoConstraints = false
    
    var layoutConstraints: [NSLayoutConstraint] = []
    
    if let x = x {
      layoutConstraints.append(centerXAnchor.constraint(equalTo: x, constant: xOffset))
    }
    if let y = y {
      layoutConstraints.append(centerYAnchor.constraint(equalTo: y, constant: xOffset))
    }
    
    if activate {
      NSLayoutConstraint.activate(layoutConstraints)
    }
    
    return layoutConstraints.count > 0 ? layoutConstraints : nil
  }
  
  @discardableResult
  public func align(top: NSLayoutYAxisAnchor? = nil, lead: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trail: NSLayoutXAxisAnchor? = nil, topPadding: CGFloat = 0, leadPadding: CGFloat = 0, bottomPadding: CGFloat = 0, trailPadding: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0, activate: Bool = true) -> [NSLayoutConstraint]? {
    translatesAutoresizingMaskIntoConstraints = false
    
    var layoutConstraints: [NSLayoutConstraint] = []
    
    if let top = top {
      layoutConstraints.append(topAnchor.constraint(equalTo: top, constant: topPadding))
    }
    if let lead = lead {
      layoutConstraints.append(leadingAnchor.constraint(equalTo: lead, constant: leadPadding))
    }
    if let bottom = bottom {
      layoutConstraints.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding))
    }
    if let trail = trail {
      layoutConstraints.append(trailingAnchor.constraint(equalTo: trail, constant: -trailPadding))
    }
    if width > 0 {
      layoutConstraints.append(widthAnchor.constraint(equalToConstant: width))
    }
    if height > 0 {
      layoutConstraints.append(heightAnchor.constraint(equalToConstant: height))
    }
    
    if activate {
      NSLayoutConstraint.activate(layoutConstraints)
    }
    
    return layoutConstraints.count > 0 ? layoutConstraints : nil
  }
  
  @discardableResult
  public func align(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topPadding: CGFloat = 0, leftPadding: CGFloat = 0, bottomPadding: CGFloat = 0, rightPadding: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0, activate: Bool = true) -> [NSLayoutConstraint]? {
    translatesAutoresizingMaskIntoConstraints = false
    
    var layoutConstraints: [NSLayoutConstraint] = []
    
    if let top = top {
      layoutConstraints.append(topAnchor.constraint(equalTo: top, constant: topPadding))
    }
    if let left = left {
      layoutConstraints.append(leftAnchor.constraint(equalTo: left, constant: leftPadding))
    }
    if let bottom = bottom {
      layoutConstraints.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding))
    }
    if let right = right {
      layoutConstraints.append(rightAnchor.constraint(equalTo: right, constant: -rightPadding))
    }
    if width > 0 {
      layoutConstraints.append(widthAnchor.constraint(equalToConstant: width))
    }
    if height > 0 {
      layoutConstraints.append(heightAnchor.constraint(equalToConstant: height))
    }
    
    if activate {
      NSLayoutConstraint.activate(layoutConstraints)
    }
    
    return layoutConstraints.count > 0 ? layoutConstraints : nil
  }
  
  @discardableResult
  public func widthEqualToSuperview(multiplier: CGFloat, activate: Bool = true) -> NSLayoutConstraint? {
    guard let superview = superview else { return nil }
    let constraint = widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: multiplier)
    constraint.isActive = activate
    return constraint
  }
  
  @discardableResult
  public func width(equalTo w: NSLayoutDimension, multiplier: CGFloat, activate: Bool = true) -> NSLayoutConstraint? {
    let constraint = widthAnchor.constraint(equalTo: w, multiplier: multiplier)
    constraint.isActive = activate
    return constraint
  }
  
  @discardableResult
  public func width(equalToConstant c: CGFloat, activate: Bool = true) -> NSLayoutConstraint? {
    let constraint = widthAnchor.constraint(equalToConstant: c)
    constraint.isActive = activate
    return constraint
  }
  
  @discardableResult
  public func heightEqualToSuperview(_ multiplier: CGFloat, activate: Bool = true) -> NSLayoutConstraint? {
    guard let superview = superview else { return nil }
    let constraint = heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: multiplier)
    constraint.isActive = activate
    return constraint
  }
  
  @discardableResult
  public func height(equalTo h: NSLayoutDimension, multiplier: CGFloat, activate: Bool = true) -> NSLayoutConstraint? {
    let constraint = heightAnchor.constraint(equalTo: h, multiplier: multiplier)
    constraint.isActive = activate
    return constraint
  }
  
  @discardableResult
  public func height(equalToConstant c: CGFloat, activate: Bool = true) -> NSLayoutConstraint? {
    let constraint = heightAnchor.constraint(equalToConstant: c)
    constraint.isActive = activate
    return constraint
  }
}
