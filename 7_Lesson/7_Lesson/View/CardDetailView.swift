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
        view.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1)
        view.layer.cornerRadius = 20
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
        label.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        label.textColor = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 1.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        label.textAlignment = .right
        return label
    }()
    
    private let strokeAnimationView = StrokeAnimationView()
    
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
        
        let contentStack = UIStackView(arrangedSubviews: [hanziLabel, pinyinLabel, translateLabel])
        contentStack.axis = .vertical
        contentStack.spacing = 20
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(numberLabel)
        containerView.addSubview(contentStack)
        containerView.addSubview(strokeAnimationView)
        addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        strokeAnimationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            
            numberLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            numberLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            hanziLabel.heightAnchor.constraint(equalToConstant: 80),
            
            contentStack.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 8),
            contentStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            contentStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            contentStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
            
            strokeAnimationView.centerXAnchor.constraint(equalTo: hanziLabel.centerXAnchor),
            strokeAnimationView.centerYAnchor.constraint(equalTo: hanziLabel.centerYAnchor),
            strokeAnimationView.widthAnchor.constraint(equalTo: hanziLabel.widthAnchor),
            strokeAnimationView.heightAnchor.constraint(equalTo: hanziLabel.heightAnchor)
        ])
    }
    
    func configure(with item: ChinaItem) {
        numberLabel.text = "#\(item.number)"
        hanziLabel.text = item.hanzi
        pinyinLabel.text = item.pinin
        translateLabel.text = item.translate
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.strokeAnimationView.animate(strokeOrder: item.strokeOrder)
        }
    }
    
    func stopAnimation() {
        strokeAnimationView.reset()
    }
}
