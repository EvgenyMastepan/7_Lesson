//
//  CardDetailView.swift
//  7_Lesson
//
//  Created by Evgeny Mastepan on 08.07.2025.
//

import UIKit

final class CardDetailView: UIView {
    
    //MARK: -- Вёрстка всплывающего окна с переводом, при нажатии на карточку.
    
    private lazy var containerView: UIView = {
        $0.backgroundColor = .cellBackground
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
        return $0
    }(UIView())
    
    private lazy var hanziLabel = ChinaLabel(
        font: UIFont.systemFont(ofSize: 60, weight: .bold),
        textColor: .hanziRed,
    )

    private lazy var pinyinLabel = ChinaLabel(
        font: UIFont.systemFont(ofSize: 24, weight: .medium),
        textColor: .pinyinWhite,
    )
    
    private lazy var translateLabel = ChinaLabel(
        font: UIFont.systemFont(ofSize: 26, weight: .semibold),
        textColor: .translateColor,
    )
    
    private lazy var numberLabel = ChinaLabel(
        font: UIFont.systemFont(ofSize: 12, weight: .regular),
        textColor: UIColor.white.withAlphaComponent(0.6),
        textAligment: .right
    )
    
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
        
        containerView.addSubviews(numberLabel, contentStack, strokeAnimationView)
        addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
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
        //Передаем данные карточки.
        numberLabel.text = "#\(item.number)"
        hanziLabel.text = item.hanzi
        pinyinLabel.text = item.pinin
        translateLabel.text = item.translate
        
        // Без этого глючила анимация.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.strokeAnimationView.animate(strokeOrder: item.strokeOrder)
        }
    }
    
    func stopAnimation() {
        strokeAnimationView.reset()
    }
}
