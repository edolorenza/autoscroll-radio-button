//
//  ContentView.swift
//  autoscroll radio button
//
//  Created by Edo Lorenza on 21/01/24.
//

import SwiftUI

struct ContentView: View {
     
    @State private var showSheet: Bool = false
    @State private var selected: String = "Cambodia"
    
    var body: some View {
        VStack {
            Text(selected)
                .font(.title)
            
            Button(action: {
                self.showSheet = true
            }, label: {
                Text("Show Sheet")
            })
        }
        .padding()
        .sheet(isPresented: self.$showSheet, content: {
            SheetView(selected: self.$selected)
        })
    }
}



