//
//  CardsViewModel.swift
//  7_Lesson
//
//  Created by Evgeny Mastepan on 08.07.2025.
//

import Foundation

class CardsViewModel {
    // Меняем видимость переменных
    private(set) var items: [ChinaItem] = []
    private(set) var itemsPerPage = 12
    private(set) var columnsPerPage = 3
    private(set) var rowsPerPage = 4
    
    init() {
        loadItems()
    }
    
    //Получаем данные
    private func loadItems() {
        items = ChinaItem.getData()
    }
    
    //Высчитываем кол-во страниц при заданных 12 карточках на страницу.
    // По большой идее кол-во карточек/стр можно вынести в настройки.
    var numberOfPages: Int {
        let fullPages = items.count / 12
        let hasPartialPage = items.count % 12 != 0
        return fullPages + (hasPartialPage ? 1 : 0)
    }
    
    //Нужно для расчета карточек для последней страницы
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
