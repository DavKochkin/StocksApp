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
                HStack {
                    TextField("Symbol", text: $model.symbol)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Add") { model.addStock() }
                        .disabled(!model.symbolValid)
                }
                if !model.stockData.isEmpty {
                    ForEach (model.stockData) { stock in
                        HStack {
                            Text(stock.metaData.symbol)
                            
                            Spacer()
                            
                            LineChart(values: stock.closeValues)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.green.opacity(0.7), .green.opacity(0.2), .green.opacity(0)]),
                                        startPoint: .top,
                                        endPoint: .bottom)
                                )
                                .frame(width: 150, height: 50)
                            
                            VStack(alignment: .trailing) {
                                Text(stock.latestClose)
                            }
                            .frame(width: 100)
                        }
                    }
                    .onDelete(perform: model.delete(at:))
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
