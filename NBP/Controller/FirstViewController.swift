//
//  ViewController.swift
//  NBP
//
//  Created by Paweł Kozioł on 11/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit




class FirstViewController: UIViewController, UITableViewDataSource {
    
    var firstScreenJSON = FirstScreenJSON()
    
    var effectiveDate: String = ""
    var rates: [FirstScreenRates] = []
    
    var selectedTable = String()
    var selectedCurrency = String()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstScreenJSON.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
   //MARK: - Button functions
    @IBAction func pressedTableA(_ sender: UIButton) {
        firstScreenJSON.getData(for: K.tableA)
        selectedTable = K.tableA
        reloadTable()
        
    }
    
    @IBAction func pressedTableB(_ sender: UIButton) {
        firstScreenJSON.getData(for: K.tableB)
        selectedTable = K.tableB
        reloadTable()
    }
    
    @IBAction func pressedTableC(_ sender: UIButton) {
        firstScreenJSON.getData(for: K.tableC)
        selectedTable = K.tableC
        reloadTable()
    }
    
    @IBAction func pressedRefresh(_ sender: UIButton) {
        reloadTable()
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //    func activateIndicator() {
    //        activityIndicator.hidesWhenStopped = true
    //        activityIndicator.center = view.center
    //        activityIndicator.startAnimating()
    //    }
    
    //MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as? CustomCell else { return UITableViewCell() }
        let valueString = "Wartość: "
        cell.placementDate?.text = effectiveDate
        cell.currencyName?.text = rates[indexPath.row].currency
        cell.currencyCode?.text = rates[indexPath.row].code
        cell.currencyValue?.text = "\(valueString)\(rates[indexPath.row].mid)"
        selectedCurrency = rates[indexPath.row].code
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true).self
        selectedCurrency = rates[indexPath.row].code
        
        performSegue(withIdentifier: K.currencyDetailSegue, sender: (Any).self)
        
    }
    
    // MARK: - Navigation prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SecondViewController {
            destinationVC.selectedTable = selectedTable
            destinationVC.selectedCurrency = selectedCurrency
            return
        }
    }
    
}

//MARK: - FirstScreenDataDelegate
extension FirstViewController: FirstScreenDataDelegate {
    func sendDataToFirstViewController(actualDate: String, actualRates: [FirstScreenRates]) {
        DispatchQueue.main.async {
            self.effectiveDate = actualDate
            self.rates = actualRates
        }
    }
}