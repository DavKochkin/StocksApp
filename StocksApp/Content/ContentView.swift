//
//  ContentView.swift
//  StocksApp
//
//  Created by David Kochkin on 27.02.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject private var model = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                if !model.stockData.isEmpty {
                    ForEach (model.stockData) { stock in
                        HStack {
                            Text(stock.metaData.symbol)
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 150, height: 50)
                            
                            VStack(alignment: .trailing) {
                                Text(stock.latestClose)
                                Text("Change")
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("My Stocks")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    EditButton()
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
