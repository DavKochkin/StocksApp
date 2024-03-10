//
//  TimelineEntry.swift
//  StocksWidgetExtension
//
//  Created by David Kochkin on 09.03.2024.
//

import WidgetKit

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let stockData: StockData?
}
