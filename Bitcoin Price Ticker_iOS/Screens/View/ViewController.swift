//
//  ViewController.swift
//  Bitcoin Price Ticker_iOS
//
//  Created by Sadia on 13/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    var coinCurrencyModel = CoinCurrencyModel()
    
    @IBOutlet weak var bitCoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        coinCurrencyModel.delegate = self
        
        showActivityIndicator()
    }
    
    var activityView: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    func showActivityIndicator() {
        if !activityView.isAnimating{
            activityView.center = self.view.center
            self.view.addSubview(activityView)
            activityView.startAnimating()
        }
    }

    func hideActivityIndicator(){
        if activityView.isAnimating{
            activityView.stopAnimating()
        }
    }
}

extension ViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencyLabel.text = coinManager.currencyArray[row]
        coinCurrencyModel.getBitCoinRate(currency: coinManager.currencyArray[row])
        hideActivityIndicator()
    }
}

extension ViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    
}

extension ViewController: CoinCurrencyDelegate{
    
    func showBitCoinRate(rate: Double?) {
        guard let bitCoin = rate else{return}
        let bitCoinString = String(format: "%.2f", bitCoin)
        
        bitCoinLabel.text = bitCoinString
    }
    
    func showBitCoinRateError(error: Error) {
        print(error)
    }
    
    
}

