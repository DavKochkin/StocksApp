//
//  StocksWidgetBundle.swift
//  StocksWidget
//
//  Created by David Kochkin on 08.03.2024.
//

import WidgetKit
import SwiftUI

@main
struct StocksWidgetBundle: WidgetBundle {
    var body: some Widget {
        StocksWidget()
        StocksWidgetLiveActivity()
    }
}
