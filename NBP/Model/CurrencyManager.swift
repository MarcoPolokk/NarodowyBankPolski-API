//
//  CurrencyManager.swift
//  NBP
//
//  Created by Paweł Kozioł on 11/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import Foundation


struct CurrencyManager {
    
//    var delegate: CurrencyManagerDelegate?
    
    let baseURL = "http://api.nbp.pl/api/exchangerates/tables"
    
    func getData(for table: String) {
        
        let urlString = "\(baseURL)/\(table)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let mainData = try JSONDecoder().decode([MainData].self, from: data)
                print(mainData)
            } catch let error {
                print("Error", error)
            }
        }.resume()
    }
}
//func parseJSON(_ data: Data) -> (Double?) {
//
//    //Create a JSONDecoder
//    let decoder = JSONDecoder()
//
//    do {
//
//        //Try to decode the data using the CoinData Structure.
//        let decodedData = try decoder.decode(CurrencyData.self, from: data)
//
//        //Get the last property from the decoded data.
//        let effectiveDate = decodedData.effectiveDate
//        let currency = decodedData.currency
//        let code = decodedData.code
//        let mid = decodedData.mid
//
//        return
//
//    } catch {
//
//        //Catch and print any errors.
//        delegate?.didFailWithError(error: error)
//        return
//    }
//}
//}
