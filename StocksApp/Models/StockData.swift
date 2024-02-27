//
//  StockData.swift
//  StocksApp
//
//  Created by David Kochkin on 27.02.2024.
//

import Foundation

struct StockData: Codable {
    struct MetaData: Codable {
        let information: String
        let symbol: String
        let lastRefreshed: String
        let interal: String
        let outputSize: String
        let timeZone: String
        
        private enum CodingKeys: String, CodingKey {
            case information   = "1. Information"
            case symbol        = "2. Symbol"
            case lastRefreshed = "3. Last Refreshed"
            case interal       = "4. Interval"
            case outputSize    = "5. Output Size"
            case timeZone      = "6. Time Zone"
        }
    }
    
    
    struct StockDataEntry: Codable {
        let open: String
        let high: String
        let low: String
        let close: String
        let volume: String
        
        private enum CodingKeys: String, CodingKey {
            case open   = "1. open"
            case high   = "2. high"
            case low    = "3. low"
            case close  = "4. close"
            case volume = "5. volume"
        }
    }
    
    let metaData: MetaData
    let timeSeries5Min: [String: StockDataEntry]
    
    private enum CodingKeys: String, CodingKey {
        case metaData       = "Meta Data"
        case timeSeries5Min = "Time Series (5min)"
    }
}
