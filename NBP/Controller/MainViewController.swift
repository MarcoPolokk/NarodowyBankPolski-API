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
    var rates: [FirstScreenRates] = []
    
    public var rate = [FirstScreenRates]()
    
    var firstScreenJSON = FirstScreenJSON()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstScreenJSON.getData(for: K.tableA)
        reloadTable()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func pressedTableA(_ sender: UIButton) {
        firstScreenJSON.getData(for: K.tableA)
    }
    
    @IBAction func pressedTableB(_ sender: UIButton) {
        firstScreenJSON.getData(for: K.tableB)
    }
    
    @IBAction func pressedTableC(_ sender: UIButton) {
        firstScreenJSON.getData(for: K.tableC)
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
//        cell.
        
//
//        cell.placementDate?.text = dataSource[0].effectiveDate
//        cell.currencyName?.text = rates[indexPath.row].currency
//        cell.currencyCode?.text = rates[indexPath.row].code
//        cell.currencyValue?.text = rates[indexPath.row].mid
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}
