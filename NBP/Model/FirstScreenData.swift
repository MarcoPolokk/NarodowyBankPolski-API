//
//  Currency.swift
//  NBP
//
//  Created by Paweł Kozioł on 11/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import Foundation

struct FirstScreenData: Codable {
    
    let effectiveDate: String
    let rates: [FirstScreenRates]
}

struct FirstScreenRates: Codable {
    
    let code: String
    let currency: String
    let mid: Double
}
