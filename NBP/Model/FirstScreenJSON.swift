//
//  CurrencyManager.swift
//  NBP
//
//  Created by Paweł Kozioł on 11/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import Foundation

struct FirstScreenJSON {
    
    var rates = [FirstScreenRates]()
    
    let baseURL = "https://api.nbp.pl/api/exchangerates/tables"
    
    func getData(for table: String) {
        
        let urlString = "\(baseURL)/\(table)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let downloadedData = try JSONDecoder().decode([FirstScreenData].self, from: data)
                self.rates = downloadedData[rates]
                print(downloadedData)
                
//                print(firstScreenData[0].effectiveDate)
//                print(firstScreenData[0].rates[0])
                
            } catch let error {
                print("Error", error)
            }
        }.resume()
    }
}

