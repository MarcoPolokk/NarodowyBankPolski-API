//
//  ViewController.swift
//  NBP
//
//  Created by Paweł Kozioł on 11/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var firstScreenData: [FirstScreenData] = []
    var effectiveDate: String = ""
    var rates: [FirstScreenRates] = []
    
    var selectedCurrency: FirstScreenRates?
    
    var firstScreenJSON = FirstScreenJSON()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstScreenJSON.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func pressedTableA(_ sender: UIButton) {
        firstScreenJSON.getData(for: K.tableA)
        reloadTable()

    }
    
    @IBAction func pressedTableB(_ sender: UIButton) {
        firstScreenJSON.getData(for: K.tableB)
        reloadTable()
    }
    
    @IBAction func pressedTableC(_ sender: UIButton) {
        firstScreenJSON.getData(for: K.tableC)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cellAtRow = dataSource[indexPath.row]
        //
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as? CustomCell else { return UITableViewCell() }
                let valueString = "Wartość: "
                cell.placementDate?.text = effectiveDate
                cell.currencyName?.text = rates[indexPath.row].currency
                cell.currencyCode?.text = rates[indexPath.row].code
                cell.currencyValue?.text = "\(valueString)\(rates[indexPath.row].mid)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currencyIndex = rates[indexPath.row]
        selectedCurrency = currencyIndex
        tableView.deselectRow(at: indexPath, animated: true).self
        performSegue(withIdentifier: K.currencyDetailSegue, sender: nil)
        return
    }
    
        // MARK: - Navigation
        func prepare(for segue: UIStoryboardSegue, sender: IndexPath) {
            if segue.identifier == K.currencyDetailSegue {
                let destinationVC = segue.destination as! CurrencyViewController
               
            }
        }
    }
    


extension MainViewController: FirstScreenDataDelegate {
    func sendDataToFirstViewController(actualDate: String, actualRates: [FirstScreenRates]) {
        DispatchQueue.main.async {
            self.effectiveDate = actualDate
            self.rates = actualRates
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
