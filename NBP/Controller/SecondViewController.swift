//
//  CurrencyViewController.swift
//  NBP
//
//  Created by Paweł Kozioł on 11/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var secondScreenJSON = SecondScreenJSON()
    var firstViewController = FirstViewController()
    var table = String()
    var code = String()

    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }

    @IBAction func startDatePicker(_ sender: UIDatePicker) {
    }

    @IBAction func endDatePicker(_ sender: UIDatePicker) {
    }
    
    @IBAction func pressedRefresh(_ sender: UIButton) {
        print(table, code)
//     secondScreenJSON.getData(for: <#T##String#>, code: <#T##String#>, startDate: <#T##String#>, endDate: <#T##String#>)
    }
    
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        return cell
    }


}
