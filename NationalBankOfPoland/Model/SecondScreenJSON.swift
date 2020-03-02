//
//  SecondScreenJSON.swift
//  NationalBankOfPoland
//
//  Created by Paweł Kozioł on 13/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import Foundation

protocol SecondScreenDataDelegate {
    func sendDataToSecondViewController(actualCurrencyName: String, actualCode: String, actualRates: [SecondScreenRates])
}

struct SecondScreenJSON {
    
    var delegate: SecondScreenDataDelegate?
    
    func getData(for table: String, code: String, startDate: String, endDate: String) {
        
        let urlString = "\(K.baseURL2)/\(table)/\(code)/\(startDate)/\(endDate)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let secondScreenData = try JSONDecoder().decode(SecondScreenData.self, from: data)
                let currency = secondScreenData.currency
                let code = secondScreenData.code
                let rates = secondScreenData.rates
                self.delegate?.sendDataToSecondViewController(actualCurrencyName: currency, actualCode: code, actualRates: rates)
                print(secondScreenData)
                return
                
            } catch let error {
                print(K.err, error)
            }
        }.resume()
    }
}
