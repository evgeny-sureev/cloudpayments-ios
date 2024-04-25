//
//  Currency.swift
//  sdk
//
//  Created by Sergey Iskhakov on 22.09.2020.
//  Copyright © 2020 Cloudpayments. All rights reserved.
//

import Foundation

public class Currency {
    public static let ruble: String = "RUB"      //    Российский рубль
    public static let euro: String = "EUR"       //    Евро
    public static let usd: String = "USD"        //    Доллар США
    public static let gbp: String = "GBP"        //    Фунт стерлингов
    public static let uah: String = "UAH"        //    Украинская гривна
    public static let byn: String = "BYN"        //    Белорусский рубль
    public static let kzt: String = "KZT"        //    Казахский тенге
    public static let azn: String = "AZN"        //    Азербайджанский манат
    public static let chf: String = "CHF"        //    Швейцарский франк
    public static let czk: String = "CZK"        //    Чешская крона
    public static let cad: String = "CAD"        //    Канадский доллар
    public static let pln: String = "PLN"        //    Польский злотый
    public static let sek: String = "SEK"        //    Шведская крона
    public static let tur: String = "TRY"        //    Турецкая лира
    public static let cny: String = "CNY"        //    Китайский юань
    public static let inr: String = "INR"        //    Индийская рупия
    public static let brl: String = "BRL"        //    Бразильский реал
    public static let zar: String = "ZAR"        //    Южноафриканский рэнд
    public static let uzs: String = "UZS"        //    Узбекский сум
    public static let bgl: String = "BGL"        //    Болгарский лев
    
    static func getCurrencySign(code: String) -> String {
        switch code {
            case ruble:
                return .RUBLE_SIGN
            case usd:
                return "$"
            case euro:
                return .EURO_SIGN
            case gbp:
                return .GBP_SIGN
            default:
                return code
        }
    }
}
