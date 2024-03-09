//
//  StocksWidgetView.swift
//  StocksWidgetExtension
//
//  Created by David Kochkin on 09.03.2024.
//

import WidgetKit
import SwiftUI

struct StocksWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Favorite Emoji:")
            Text(entry.configuration.favoriteEmoji)
        }
    }
}
