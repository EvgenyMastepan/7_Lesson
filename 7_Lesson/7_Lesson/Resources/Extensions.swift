//
//  Extensions.swift
//  7_Lesson
//
//  Created by Evgeny Mastepan on 10.07.2025.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
