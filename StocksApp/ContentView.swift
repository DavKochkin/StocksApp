//
//  ContentView.swift
//  StocksApp
//
//  Created by David Kochkin on 27.02.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (0...10, id: \.self) { number in
                    HStack {
                        Text("Symbol")
                        
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 50)
                        
                        VStack(alignment: .trailing) {
                            Text("Value")
                            Text("Change")
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
