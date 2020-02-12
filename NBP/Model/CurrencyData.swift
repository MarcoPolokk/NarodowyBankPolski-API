//
//  Currency.swift
//  NBP
//
//  Created by Paweł Kozioł on 11/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import Foundation

struct MainData: Codable {
    
    let effectiveDate: String
    let rates: [CurrencyData]
}

struct CurrencyData: Codable {
    
    let code: String
    let currency: String
    let mid: Double
}
