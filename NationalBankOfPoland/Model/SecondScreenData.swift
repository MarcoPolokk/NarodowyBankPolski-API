//
//  SecondScreenData.swift
//  NationalBankOfPoland
//
//  Created by Paweł Kozioł on 13/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import Foundation

struct SecondScreenData: Decodable {
    
    let currency: String
    let code: String
    let rates: [SecondScreenRates]
}

struct SecondScreenRates: Decodable {
    
    let effectiveDate: String
    let mid: Double
}
