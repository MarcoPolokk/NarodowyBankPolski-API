//
//  CurrencyManager.swift
//  NBP
//
//  Created by Paweł Kozioł on 11/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import Foundation

protocol CurrencyManagerDelegate {
    func didUpdateTable(effectiveDate: String, currency: String, code: String, mid: Double)
    func didFailWithError(error: Error)
}

struct CurrencyManager {
    
    var delegate: CurrencyManagerDelegate?
    
    let baseURL = "http://api.nbp.pl/api/exchangerates/tables"
    
    func getData(for table: String) {
        
        let urlString = "\(baseURL)/\(table)"
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            //Create a new data task for the URLSession.
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let tableData = self.parseJSON(safeData) {
                        
                        //Call the delegate method in the delegate (ViewController) and pass along the necessary data.
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                    
                    
                    
                }
            }
            task.resume()
        }
    }

func parseJSON(_ data: Data) -> (Double?) {
    
    //Create a JSONDecoder
    let decoder = JSONDecoder()
    
    do {
        
        //Try to decode the data using the CoinData Structure.
        let decodedData = try decoder.decode(CurrencyData.self, from: data)
        
        //Get the last property from the decoded data.
        let effectiveDate = decodedData.effectiveDate
        let currency = decodedData.currency
        let code = decodedData.code
        let mid = decodedData.mid
        
        return
        
    } catch {
        
        //Catch and print any errors.
        delegate?.didFailWithError(error: error)
        return
    }
}
}
