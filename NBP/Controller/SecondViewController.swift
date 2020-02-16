//
//  CurrencyViewController.swift
//  NBP
//
//  Created by Paweł Kozioł on 11/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var secondScreenJSON = SecondScreenJSON()
    
    var currency: String = ""
    var code: String = ""
    var rates: [SecondScreenRates] = []
    
    var selectedTable: String = ""
    var selectedCurrency: String = ""
    var startDate = String()
    var endDate = String()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondScreenJSON.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
  //MARK: - UIDatePickers functionality
    @IBAction func startDatePickerChanged(_ sender: UIDatePicker) {
        let startDateHolder = startDatePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        startDate = dateFormatter.string(from: startDateHolder)
    }
    
    @IBAction func endDatePickerChanged(_ sender: UIDatePicker) {
        let endDateHolder = endDatePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        endDate = dateFormatter.string(from: endDateHolder)
    }
    
    @IBAction func pressedRefresh(_ sender: UIButton) {
        secondScreenJSON.getData(for: selectedTable, code: selectedCurrency, startDate: startDate, endDate: endDate)
        reloadTable()
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

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
        cell.currencyName.isHidden = true
        cell.placementDate?.text = rates[indexPath.row].effectiveDate
        cell.currencyCode?.text = code
        cell.currencyValue?.text = "\(valueString)\(rates[indexPath.row].mid)"
        return cell
    }
}

//MARK: - SecondScreenDataDelegate
extension SecondViewController: SecondScreenDataDelegate {
    
    func sendDataToSecondViewController(actualCurrencyName: String, actualCode: String, actualRates: [SecondScreenRates]) {
        DispatchQueue.main.async {
            self.currency = actualCurrencyName
            self.code = actualCode
            self.rates = actualRates
        }
        
    }
}

