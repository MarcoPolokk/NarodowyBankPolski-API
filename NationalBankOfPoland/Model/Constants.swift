//
//  Constants.swift
//  NationalBankOfPoland
//
//  Created by Paweł Kozioł on 12/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import Foundation

struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "CustomCell"
    static let currencyDetailSegue = "ShowCurencyDetail"
    static let err = "Error: "
    static let dateFormat = "YYYY-MM-dd"
    static let valueIs = "Wartość: "
    
    static let baseURL1 = "https://api.nbp.pl/api/exchangerates/tables"
    static let baseURL2 = "https://api.nbp.pl/api/exchangerates/rates"
    
    static let tableA = "A"
    static let tableB = "B"
    static let tableC = "C"
}
