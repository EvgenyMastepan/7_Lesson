//
//  Model.swift
//  7_Lesson
//
//  Created by Evgeny Mastepan on 08.07.2025.
//
import Foundation

struct ChinaItem: Identifiable {
    let id = UUID()
    let number: String
    let hanzi: String
    let translate: String
    let pinin: String
    let strokeOrder: [String] // Пути прорисовки черт "Mx,y Lx,y"
    
    static func getData() -> [ChinaItem] {
        [
            ChinaItem(number: "1", hanzi: "我", translate: "Я", pinin: "wǒ",
                    strokeOrder: ["M30,20 L20,50", "M20,50 L30,80", "M30,80 L40,50", "M40,50 L30,20"]),
            
            ChinaItem(number: "2", hanzi: "舒适(的)", translate: "комфортабельный", pinin: "shūshì",
                    strokeOrder: ["M20,30 L40,30", "M30,20 L30,40", "M50,25 L70,25", "M60,15 L60,35"]),
            
            ChinaItem(number: "3", hanzi: "床", translate: "кровать", pinin: "chuáng",
                    strokeOrder: ["M20,20 L80,20", "M50,20 L50,80", "M30,40 L70,40"]),
            
            ChinaItem(number: "4", hanzi: "沙发", translate: "диван", pinin: "shāfā",
                    strokeOrder: ["M25,30 L45,30", "M35,20 L35,40", "M55,25 L75,25", "M65,15 L65,35"]),
            
            ChinaItem(number: "5", hanzi: "跑步", translate: "бегать", pinin: "pǎobù",
                    strokeOrder: ["M20,25 L40,25", "M30,15 L30,35", "M60,20 L80,20", "M70,10 L70,30"]),
            
            ChinaItem(number: "6", hanzi: "篮球", translate: "баскетбол", pinin: "lánqiú",
                    strokeOrder: ["M25,20 L45,20", "M35,10 L35,30", "M65,25 L85,25", "M75,15 L75,35"]),
            
            ChinaItem(number: "7", hanzi: "游泳", translate: "плавать", pinin: "yóuyǒng",
                    strokeOrder: ["M20,30 L40,30", "M30,20 L30,40", "M60,35 L80,35", "M70,25 L70,45"]),
            
            ChinaItem(number: "8", hanzi: "旧", translate: "старый", pinin: "jiù",
                    strokeOrder: ["M20,20 L80,20", "M50,20 L50,80", "M30,60 L70,60"]),
            
            ChinaItem(number: "9", hanzi: "新", translate: "новый", pinin: "xīn",
                    strokeOrder: ["M30,20 L20,50", "M20,50 L30,80", "M30,80 L40,50", "M40,50 L30,20"]),
            
            ChinaItem(number: "10", hanzi: "北京", translate: "Пекин", pinin: "běijīng",
                    strokeOrder: ["M25,20 L45,20", "M35,10 L35,30", "M65,25 L85,25", "M75,15 L75,35"]),
            
            ChinaItem(number: "11", hanzi: "夏天", translate: "лето", pinin: "xiàtiān",
                    strokeOrder: ["M20,25 L40,25", "M30,15 L30,35", "M60,20 L80,20", "M70,10 L70,30"]),
            
            ChinaItem(number: "12", hanzi: "冬天", translate: "зима", pinin: "dōngtiān",
                    strokeOrder: ["M25,30 L45,30", "M35,20 L35,40", "M55,25 L75,25", "M65,15 L65,35"]),
            
            ChinaItem(number: "13", hanzi: "热", translate: "жаркий", pinin: "rè",
                    strokeOrder: ["M20,20 L80,20", "M50,20 L50,80", "M30,60 L70,60"]),
            
            ChinaItem(number: "14", hanzi: "特别", translate: "особенно", pinin: "tèbié",
                    strokeOrder: ["M20,30 L40,30", "M30,20 L30,40", "M60,35 L80,35", "M70,25 L70,45"]),
            
            ChinaItem(number: "15", hanzi: "时候", translate: "время", pinin: "shíhou",
                    strokeOrder: ["M25,20 L45,20", "M35,10 L35,30", "M65,25 L85,25", "M75,15 L75,35"]),
            
            ChinaItem(number: "16", hanzi: "漂亮", translate: "красивый", pinin: "piàoliang",
                    strokeOrder: ["M20,25 L40,25", "M30,15 L30,35", "M60,20 L80,20", "M70,10 L70,30"]),
            
            ChinaItem(number: "17", hanzi: "故宫", translate: "Запретный город", pinin: "gùgōng",
                    strokeOrder: ["M25,30 L45,30", "M35,20 L35,40", "M55,25 L75,25", "M65,15 L65,35"]),
            
            ChinaItem(number: "18", hanzi: "人们", translate: "люди", pinin: "rénmen",
                    strokeOrder: ["M20,20 L80,20", "M50,20 L50,80", "M30,60 L70,60"]),
            
            ChinaItem(number: "19", hanzi: "咖啡", translate: "кофе", pinin: "kāfēi",
                    strokeOrder: ["M25,20 L45,20", "M35,10 L35,30", "M65,25 L85,25", "M75,15 L75,35"]),
            
            ChinaItem(number: "20", hanzi: "要", translate: "иметь", pinin: "yào",
                    strokeOrder: ["M20,25 L40,25", "M30,15 L30,35", "M60,20 L80,20", "M70,10 L70,30"]),
            
            ChinaItem(number: "21", hanzi: "冰", translate: "лёд", pinin: "bīng",
                    strokeOrder: ["M25,30 L45,30", "M35,20 L35,40", "M55,25 L75,25", "M65,15 L65,35"]),
            
            ChinaItem(number: "22", hanzi: "不客气", translate: "пожалуйста", pinin: "bù kèqi",
                    strokeOrder: ["M20,20 L80,20", "M50,20 L50,80", "M30,60 L70,60"]),
            
            ChinaItem(number: "23", hanzi: "在", translate: "в...", pinin: "zài",
                    strokeOrder: ["M20,30 L40,30", "M30,20 L30,40", "M60,35 L80,35", "M70,25 L70,45"]),
            
            ChinaItem(number: "24", hanzi: "你(妳)", translate: "ты", pinin: "nǐ",
                    strokeOrder: ["M25,20 L45,20", "M35,10 L35,30", "M65,25 L85,25", "M75,15 L75,35"]),
            
            ChinaItem(number: "25", hanzi: "它", translate: "оно", pinin: "tā",
                    strokeOrder: ["M20,25 L40,25", "M30,15 L30,35", "M60,20 L80,20", "M70,10 L70,30"]),
            
            ChinaItem(number: "26", hanzi: "是", translate: "быть", pinin: "shì",
                    strokeOrder: ["M25,30 L45,30", "M35,20 L35,40", "M55,25 L75,25", "M65,15 L65,35"]),
            
            ChinaItem(number: "27", hanzi: "也", translate: "тоже", pinin: "yě",
                    strokeOrder: ["M20,20 L80,20", "M50,20 L50,80", "M30,60 L70,60"]),
            
            ChinaItem(number: "28", hanzi: "吗", translate: "вопросительная частица", pinin: "ma",
                    strokeOrder: ["M20,30 L40,30", "M30,20 L30,40", "M60,35 L80,35", "M70,25 L70,45"]),
            
            ChinaItem(number: "29", hanzi: "这里", translate: "здесь", pinin: "zhèlǐ",
                    strokeOrder: ["M25,20 L45,20", "M35,10 L35,30", "M65,25 L85,25", "M75,15 L75,35"]),
            
            ChinaItem(number: "30", hanzi: "粥", translate: "каша", pinin: "zhōu",
                    strokeOrder: ["M30,30 L50,50", "M50,50 L70,30", "M40,60 L60,60"]),
            
            ChinaItem(number: "31", hanzi: "爱", translate: "любовь", pinin: "ài",
                    strokeOrder: ["M50,20 L30,50", "M30,50 L50,80", "M50,80 L70,50", "M70,50 L50,20"]),
            
            ChinaItem(number: "32", hanzi: "和平", translate: "мир", pinin: "hépíng",
                    strokeOrder: ["M20,50 L80,50", "M50,20 L50,80", "M30,30 L70,70", "M70,30 L30,70"])
        ]
    }
}
