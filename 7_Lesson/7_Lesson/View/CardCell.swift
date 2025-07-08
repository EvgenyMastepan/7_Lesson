//
//  CardCell.swift
//  7_Lesson
//
//  Created by Evgeny Mastepan on 08.07.2025.
//

import UIKit

final class CardCell: UICollectionViewCell {
    static let reuseID = "CardCell"
    
    private let hanziLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .hanziRed
        label.textAlignment = .center
        return label
    }()
    
    private let pinyinLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .pinyinWhite
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
         backgroundColor = .cardBackground
         layer.cornerRadius = 12
         layer.masksToBounds = true
         
         let stackView = UIStackView(arrangedSubviews: [hanziLabel, pinyinLabel])
         stackView.axis = .vertical
         stackView.spacing = 4
         stackView.translatesAutoresizingMaskIntoConstraints = false
         
         contentView.addSubview(stackView)
         
         NSLayoutConstraint.activate([
             stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
             stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
             stackView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 4),
             stackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -4)
         ])
     }
    
    func configure(with item: ChinaItem) {
        hanziLabel.text = item.hanzi
        pinyinLabel.text = item.pinin
        
        // Адаптируем размер шрифта под количество иероглифов
        let hanziCount = item.hanzi.count
        let baseSize: CGFloat = 40
        
        if hanziCount <= 2 {
            hanziLabel.font = UIFont.systemFont(ofSize: baseSize, weight: .bold)
        } else if hanziCount <= 4 {
            hanziLabel.font = UIFont.systemFont(ofSize: baseSize * 0.8, weight: .bold)
        } else {
            hanziLabel.font = UIFont.systemFont(ofSize: baseSize * 0.6, weight: .bold)
        }
    }
}
