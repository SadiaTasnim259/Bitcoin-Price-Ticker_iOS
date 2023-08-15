//
//  CoinModel.swift
//  Bitcoin Price Ticker_iOS
//
//  Created by Sadia on 14/8/23.
//

import Foundation

struct CoinModel: Codable {
    var time, assetIDBase, assetIDQuote: String?
    var rate: Double?

    enum CodingKeys: String, CodingKey {
        case time
        case assetIDBase = "asset_id_base"
        case assetIDQuote = "asset_id_quote"
        case rate
    }
}
