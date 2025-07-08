//
//  PagingCollectionViewLayout.swift
//  7_Lesson
//
//  Created by Evgeny Mastepan on 08.07.2025.
//


import UIKit

class PagingCollectionViewLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        let pageWidth = collectionView.bounds.width
        let currentPage = collectionView.contentOffset.x / pageWidth
        let roundedPage = round(currentPage)
        
        return CGPoint(x: roundedPage * pageWidth, y: proposedContentOffset.y)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
