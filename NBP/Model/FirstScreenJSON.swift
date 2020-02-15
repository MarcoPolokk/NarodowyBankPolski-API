//
//  CurrencyManager.swift
//  NBP
//
//  Created by Paweł Kozioł on 11/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import Foundation

protocol FirstScreenDataDelegate {
    func sendDataToFirstViewController(actualDate: String, actualRates: [FirstScreenRates])
}

struct FirstScreenJSON {
    
    var delegate: FirstScreenDataDelegate?
    
    let baseURL = "https://api.nbp.pl/api/exchangerates/tables"
    
    func getData(for table: String) {
        
        let urlString = "\(baseURL)/\(table)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let firstScreenData = try JSONDecoder().decode([FirstScreenData].self, from: data)
                let effectiveDate = firstScreenData[0].effectiveDate
                let rates = firstScreenData[0].rates
                self.delegate?.sendDataToFirstViewController(actualDate: effectiveDate, actualRates: rates)
                return
                
            } catch let error {
                print("Error: ", error)
            }
        }.resume()
    }
}

