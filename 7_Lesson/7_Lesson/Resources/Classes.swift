//
//  Classes.swift
//  7_Lesson
//
//  Created by Evgeny Mastepan on 10.07.2025.
//

import UIKit

final class ChinaLabel: UILabel {
    init(
//        text: String? = nil,
        font: UIFont = .systemFont(ofSize: 14, weight: .regular),
        textColor: UIColor = .systemBlue,
        textAligment: NSTextAlignment = .center,
    ) {
        super.init(frame: .zero)
        
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAligment
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
        self.lineBreakMode = .byWordWrapping
        self.setContentCompressionResistancePriority(.required, for: .vertical)
        self.setContentHuggingPriority(.required, for: .vertical)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
