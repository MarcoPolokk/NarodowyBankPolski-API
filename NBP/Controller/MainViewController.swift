//
//  ViewController.swift
//  NBP
//
//  Created by Paweł Kozioł on 11/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var currencyManager = CurrencyManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        let baseURL = "https://api.nbp.pl/api/exchangerates/tables"
        let urlString = "\(baseURL)/A"
        
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
    
    @IBAction func pressedTableA(_ sender: UIButton) {
        currencyManager.getData(for: "A")
    }
    @IBAction func pressedTableB(_ sender: UIButton) {
        
    }
    @IBAction func pressedTableC(_ sender: UIButton) {
        
    }
    @IBAction func pressedRefresh(_ sender: UIButton) {
        
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
        self.tableView.reloadData()
        }
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        return cell
    }
    
    
    
    
}
