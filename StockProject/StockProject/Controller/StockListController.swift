//
//  ViewController.swift
//  StockProject
//
//  Created by Prasad.d on 09/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import UIKit

class StockListController: UIViewController {
    var viewModel  = StockViewModel()
  
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var stockTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.startAnimating()
        stockTableView.isHidden = true
      loadingIndicator.hidesWhenStopped = true
        viewModel.loadStocks(completion: { [weak self] stocksViewModel in
            self?.viewModel = stocksViewModel!
            self?.loadingIndicator.stopAnimating()
            self?.stockTableView.isHidden = false
            self?.stockTableView.reloadData()
        })
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        // Dispose of any resources that can be recreated.
    }


}

extension StockListController:UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getStockCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.stockListIdentifier, for: indexPath) as! StockViewCell
        let stockss = viewModel.stocks?.stocks![indexPath.row]
        cell.stockDateLabel.text = stockss?.timeStamp
        cell.stockTitleLabel.text = stockss?.symbol
         return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constant.stockSegue, sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = stockTableView.indexPathForSelectedRow{
            let stock = viewModel.stocks?.stocks![indexPath.row]
            let stockDetailController : StockDetailViewController = segue.destination as! StockDetailViewController
            stockDetailController.symbol = stock?.symbol
        }
       
    }
}

