//
//  StockDetailViewController.swift
//  StockProject
//
//  Created by Prasad.d on 10/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import UIKit

class StockDetailViewController: UIViewController {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var detailview: UIView!
    
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    var symbol :String?
    var viewModel = StockDetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingIndicator.startAnimating()
        detailview.isHidden = true
         loadingIndicator.hidesWhenStopped = true
        viewModel.loadStockDetails(symbols: symbol!, completion: { [weak self]stockViewModel in
            if (stockViewModel?.stockModel) != nil{
                self?.loadingIndicator.isHidden = true
                self?.detailview.isHidden = false
                if let open = stockViewModel?.getOpenStock(){
                    print(open)
                    self?.openLabel.text = open
                }
                if let close = stockViewModel?.getCloseStock(){
                    self?.closeLabel.text = close
                }
                if let volume = stockViewModel?.getVolumeStock(){
                    self?.volumeLabel.text = volume
                }
                if let low = stockViewModel?.getLowStock(){
                    self?.lowLabel.text = low
                }
                if let high = stockViewModel?.getHighStock(){
                    self?.highLabel.text = high
                }
//                self?.openLabel.text = stockViewModel?.getOpenStock()
//                self?.closeLabel.text = stockViewModel?.getCloseStock()
//                self?.volumeLabel.text = stockViewModel?.getVolumeStock()
//                self?.lowLabel.text = stockViewModel?.getLowStock()
//                self?.highLabel.text = stockViewModel?.getHighStock()
            }
            else if let error = stockViewModel?.responseError{
                self?.showAlertForError(errorName: error.localizedDescription)
            }
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

