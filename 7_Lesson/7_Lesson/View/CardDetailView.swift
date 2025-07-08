//
//  CardDetailView.swift
//  7_Lesson
//
//  Created by Evgeny Mastepan on 08.07.2025.
//

import UIKit

final class CardDetailView: UIView {
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .cardBackground
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    private let hanziLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.textColor = .hanziRed
        label.textAlignment = .center
        return label
    }()
    
    private let pinyinLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .pinyinWhite
        label.textAlignment = .center
        return label
    }()
    
    private let translateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .pinyinWhite
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    init(item: ChinaItem) {
        super.init(frame: .zero)
        setupViews()
        configure(with: item)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
            backgroundColor = UIColor.black.withAlphaComponent(0.8)
            
            let stackView = UIStackView(arrangedSubviews: [hanziLabel, pinyinLabel, translateLabel])
            stackView.axis = .vertical
            stackView.spacing = 16
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            containerView.addSubview(stackView)
            addSubview(containerView)
            
            containerView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
                containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
                containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
                
                stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
                stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
                stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
                stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24)
            ])
        }
    
    func configure(with item: ChinaItem) {
        hanziLabel.text = item.hanzi
        pinyinLabel.text = item.pinin
        translateLabel.text = "\(item.number). \(item.translate)"
        
        // Адаптируем размер шрифта под количество иероглифов
        let hanziCount = item.hanzi.count
        let baseSize: CGFloat = 60
        
        if hanziCount <= 2 {
            hanziLabel.font = UIFont.systemFont(ofSize: baseSize, weight: .bold)
        } else if hanziCount <= 4 {
            hanziLabel.font = UIFont.systemFont(ofSize: baseSize * 0.8, weight: .bold)
        } else {
            hanziLabel.font = UIFont.systemFont(ofSize: baseSize * 0.6, weight: .bold)
        }
    }
}
