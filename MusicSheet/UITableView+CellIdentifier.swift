//
//  UITableViewCell+Identifier.swift
//  maarked
//
//  Created by Aleš Kocur on 14/05/16.
//  Copyright © 2016 Rubicoin All rights reserved.
//

import UIKit

// Helper for class names
func classNameOf(aClass: AnyClass) -> String {
    return NSStringFromClass(aClass).componentsSeparatedByString(".").last!
}

// MARK - UITableViewCell

extension UITableViewCell {
    static var nibName: String {
        return classNameOf(self)
    }

    static var reuseIdentifier: String {
        return classNameOf(self)
    }
}

// MARK - UITableViewHeaderFooterView

extension UITableViewHeaderFooterView {
    static var nibName: String {
        return classNameOf(self)
    }

    static var reuseIdentifier: String {
        return classNameOf(self)
    }
}

// MARK - UITableView

extension UITableView {
    func registerNibForCellClass<T: UITableViewCell>(type: T.Type) {
        let nib = UINib(nibName: type.nibName, bundle: nil)
        registerNib(nib, forCellReuseIdentifier: type.reuseIdentifier)
    }

    func registerCellClass<T: UITableViewCell>(type: T.Type) {
        registerClass(type, forCellReuseIdentifier: type.reuseIdentifier)
    }

    func registerNibForHeaderFooterClass<T: UITableViewHeaderFooterView>(type: T.Type) {
        let nib = UINib(nibName: type.nibName, bundle: nil)
        registerNib(nib, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }

    func registerHeaderFooterClass<T: UITableViewHeaderFooterView>(type: T.Type) {
        registerClass(type, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }
}
