//
//  ViewController.swift
//  StockProject
//
//  Created by Prasad.d on 09/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import UIKit

class StockListController: UITableViewController {
    var viewModel  = StockViewModel()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        viewModel.loadStocks(completion: { [weak self] stocksViewModel in
            self?.viewModel = stocksViewModel!
            self?.tableView.reloadData()
        })
        // Dispose of any resources that can be recreated.
    }


}
extension StockListController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getStockCount()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.stockListIdentifier, for: indexPath) as! StockViewCell
        let stockss = viewModel.stocks?.stocks![indexPath.row]
        cell.stockDateLabel.text = stockss?.timeStamp
        cell.stockTitleLabel.text = stockss?.symbol
        return cell
    }
}

