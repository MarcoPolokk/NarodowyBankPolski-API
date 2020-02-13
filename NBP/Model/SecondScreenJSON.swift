//
//  SecondScreenJSON.swift
//  NBP
//
//  Created by Paweł Kozioł on 13/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import Foundation

struct SecondScreenJSON {
    
    let baseURL = "https://api.nbp.pl/api/exchangerates/rates"
    
    func getData(for table: String, code: String, startDate: String, endDate: String) {
        
        let urlString = "\(baseURL)/\(table)/\(code)/\(startDate)/\(endDate)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let mainData = try JSONDecoder().decode([SecondScreenData].self, from: data)
                print(mainData)
            } catch let error {
                print("Error", error)
            }
        }.resume()
    }
}
