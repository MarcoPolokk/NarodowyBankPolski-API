//
//  Currency.swift
//  NBP
//
//  Created by Paweł Kozioł on 11/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import Foundation

struct CurrencyData: Decodable {
    
    let effectiveDate: String
    let currency: String
    let code: String
    let mid: Double
}
