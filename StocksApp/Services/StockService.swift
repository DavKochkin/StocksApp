//
//  StockService.swift
//  StocksApp
//
//  Created by David Kochkin on 09.03.2024.
//

import Foundation
import Combine

struct StockService {
    static func getStockData(for symbol: String) -> AnyPublisher<StockData, Error> {
        let url = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(symbol)&interval=5min&apikey=F4ANGLCJAAN43D4I")!
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: StockData.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
