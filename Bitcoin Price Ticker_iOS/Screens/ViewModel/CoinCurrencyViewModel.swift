//
//  CoinCurrencyViewModel.swift
//  Bitcoin Price Ticker_iOS
//
//  Created by Sadia on 15/8/23.
//

import Foundation

protocol CoinCurrencyDelegate {
    func showBitCoinRate(rate:Double?)
    func showBitCoinRateError(error: Error)
}

class CoinCurrencyModel{
    var delegate: CoinCurrencyDelegate?
    
    func getBitCoinRate(currency:String){
        let URL = API.baseURL+currency+"?apikey="+API.apiKey
        //print(URL)
        NetworkManager.shared.httpRequest(urlString: URL, httpMethodType: .GET, respnseType: CoinModel.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.delegate?.showBitCoinRate(rate: success.rate)
                case .failure(let failure):
                    self.delegate?.showBitCoinRateError(error: failure)
                }
            }
        }
    }
}
