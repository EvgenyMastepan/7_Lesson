//
//  CardsViewController.swift
//  7_Lesson
//
//  Created by Evgeny Mastepan on 08.07.2025.
//

import UIKit

final class CardsViewController: UIViewController {
    private let viewModel = CardsViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout() // Используем наш кастомный layout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .darkBackground
        cv.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseID)
        cv.decelerationRate = .fast // Для четкого пейджинга
        return cv
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = .hanziRed
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
        collectionView.decelerationRate = .normal
    }
    
    private func setupViews() {
        view.backgroundColor = .darkBackground
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -16),
            
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        pageControl.numberOfPages = viewModel.numberOfPages
        pageControl.addTarget(self, action: #selector(pageControlChanged), for: .valueChanged)
    }

    @objc private func pageControlChanged(_ sender: UIPageControl) {
        let page = sender.currentPage
        let xOffset = collectionView.frame.width * CGFloat(page)
        collectionView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func showDetail(for item: ChinaItem) {
        let detailView = CardDetailView(item: item)
        detailView.alpha = 0
        view.addSubview(detailView)
        detailView.frame = view.bounds
        
        UIView.animate(withDuration: 0.3) {
            detailView.alpha = 1
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissDetail))
        detailView.addGestureRecognizer(tap)
    }
    
    @objc private func dismissDetail(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3, animations: {
            sender.view?.alpha = 0
        }, completion: { _ in
            sender.view?.removeFromSuperview()
        })
    }
}

extension CardsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfPages
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.itemsForPage(section).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.reuseID, for: indexPath) as! CardCell
        let items = viewModel.itemsForPage(indexPath.section)
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

extension CardsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 8
        let availableWidth = collectionView.bounds.width - (padding * 4) // Отступы слева+справа и между колонками
        let widthPerItem = availableWidth / 3
        
        let availableHeight = collectionView.bounds.height - (padding * 5) // Отступы сверху+снизу и между рядами
        let heightPerItem = availableHeight / 4
        
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let itemsCount = viewModel.itemsForPage(section).count
        let emptySlots = 12 - itemsCount // 12 - полная страница
        
        guard emptySlots > 0 else {
            return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
        
        // Центрируем неполную страницу
        let emptySpace = CGFloat(emptySlots / 3) * (collectionView.bounds.width / 3)
        let leftInset = emptySpace / 2 + 8
        
        return UIEdgeInsets(top: 8, left: leftInset, bottom: 8, right: leftInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let items = viewModel.itemsForPage(indexPath.section)
        showDetail(for: items[indexPath.item])
    }
}

extension CardsViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updateCurrentPage()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        updateCurrentPage()
    }
    
    private func updateCurrentPage() {
        let pageWidth = collectionView.frame.width
        let currentPage = Int(round(collectionView.contentOffset.x / pageWidth))
        pageControl.currentPage = currentPage
    }
}
