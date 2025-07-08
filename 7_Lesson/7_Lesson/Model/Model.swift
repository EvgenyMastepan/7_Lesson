//
//  Model.swift
//  7_Lesson
//
//  Created by Evgeny Mastepan on 08.07.2025.
//
import Foundation

struct ChinaItem: Identifiable {
    static let cellName = "HanYuCell"
    let id = UUID()
    let number: String
    let hanzi: String
    let translate: String
    let pinin: String
    
    static func getData() -> [ChinaItem] {
        [
            ChinaItem(number: "1", hanzi: "我", translate: "Я", pinin: "wǒ"),
            ChinaItem(number: "2", hanzi: "舒适(的)", translate: "комфортабельный", pinin: "shūshì"),
            ChinaItem(number: "3", hanzi: "床", translate: "кровать", pinin: "chuáng"),
            ChinaItem(number: "4", hanzi: "沙发", translate: "диван", pinin: "shāfā"),
            ChinaItem(number: "5", hanzi: "跑步", translate: "бегать", pinin: "pǎobù"),
            ChinaItem(number: "6", hanzi: "篮球", translate: "баскетбол", pinin: "lánqiú"),
            ChinaItem(number: "7", hanzi: "游泳", translate: "плавать", pinin: "yóuyǒng"),
            ChinaItem(number: "8", hanzi: "旧", translate: "старый", pinin: "jiù"),
            ChinaItem(number: "9", hanzi: "新", translate: "новый", pinin: "xīn"),
            ChinaItem(number: "10", hanzi: "北京", translate: "пекин", pinin: "běijīng"),
            ChinaItem(number: "11", hanzi: "夏天", translate: "лето", pinin: "xiàtiān"),
            ChinaItem(number: "12", hanzi: "冬天", translate: "зима", pinin: "dōngtiān"),
            ChinaItem(number: "13", hanzi: "热", translate: "жаркий", pinin: "rè"),
            ChinaItem(number: "14", hanzi: "特别", translate: "особенно", pinin: "tèbié"),
            ChinaItem(number: "15", hanzi: "时候", translate: "время", pinin: "shíhou"),
            ChinaItem(number: "16", hanzi: "漂亮", translate: "красивый", pinin: "piàoliang"),
            ChinaItem(number: "17", hanzi: "故宫", translate: "запретный город", pinin: "gùgōng"),
            ChinaItem(number: "18", hanzi: "人们", translate: "люди", pinin: "rénmen"),
            ChinaItem(number: "19", hanzi: "咖啡", translate: "кофе", pinin: "kāfēi"),
            ChinaItem(number: "20", hanzi: "要", translate: "иметь", pinin: "yào"),
            ChinaItem(number: "21", hanzi: "冰", translate: "лёд", pinin: "bīng"),
            ChinaItem(number: "22", hanzi: "不客气", translate: "пожалуйста", pinin: "bù kèqi"),
            ChinaItem(number: "23", hanzi: "在", translate: "в...", pinin: "zài"),
            ChinaItem(number: "24", hanzi: "你(妳)", translate: "он(она)", pinin: "nǐ"),
            ChinaItem(number: "25", hanzi: "它", translate: "оно", pinin: "tā"),
            ChinaItem(number: "26", hanzi: "是", translate: "быть, являться", pinin: "shì"),
            ChinaItem(number: "27", hanzi: "也", translate: "тоже", pinin: "yě"),
            ChinaItem(number: "28", hanzi: "吗", translate: "(вопросительная частица)", pinin: "ma"),
            ChinaItem(number: "29", hanzi: "这里", translate: "тут, здесь", pinin: "zhèlǐ"),
            ChinaItem(number: "30", hanzi: "粥", translate: "каша", pinin: "zhōu"),
            
        ]
    }
}

