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
        Int(ceil(Double(items.count) / Double(itemsPerPage)))
    }
    
    func itemsForPage(_ page: Int) -> [ChinaItem] {
        let startIndex = page * itemsPerPage
        let endIndex = min(startIndex + itemsPerPage, items.count)
        return Array(items[startIndex..<endIndex])
    }
    
    func item(at indexPath: IndexPath) -> ChinaItem? {
        let items = itemsForPage(indexPath.section)
        guard indexPath.item < items.count else { return nil }
        return items[indexPath.item]
    }
}
