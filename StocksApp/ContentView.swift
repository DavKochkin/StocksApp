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
                    Text("\(number)")
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
