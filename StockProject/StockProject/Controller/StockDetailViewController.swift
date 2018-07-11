//
//  StockDetailViewController.swift
//  StockProject
//
//  Created by Prasad.d on 10/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import UIKit

class StockDetailViewController: UIViewController {
    var symbol :String?
    var viewModel = StockDetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadStockDetails(symbols: symbol!, completion: { stockViewModel in
            
        })
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

