//
//  CardsViewModel.swift
//  7_Lesson
//
//  Created by Evgeny Mastepan on 08.07.2025.
//

import Foundation

class CardsViewModel {
    private(set) var items: [ChinaItem] = []
    private(set) var itemsPerPage = 12
    private(set) var columnsPerPage = 3
    private(set) var rowsPerPage = 4
    
    init() {
        loadItems()
    }
    
    private func loadItems() {
        items = ChinaItem.getData()
    }
    
    var numberOfPages: Int {
        let fullPages = items.count / 12
        let hasPartialPage = items.count % 12 != 0
        return fullPages + (hasPartialPage ? 1 : 0)
    }
    
    func itemsForPage(_ page: Int) -> [ChinaItem] {
        let startIndex = page * 12
        let endIndex = min(startIndex + 12, items.count)
        return Array(items[startIndex..<endIndex])
    }
    
    func item(at indexPath: IndexPath) -> ChinaItem? {
        let items = itemsForPage(indexPath.section)
        guard indexPath.item < items.count else { return nil }
        return items[indexPath.item]
    }
}
