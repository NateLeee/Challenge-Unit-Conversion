//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Nate Lee on 6/26/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input here:")) {
                    TextField("", text: $input).keyboardType(.decimalPad)
                }
            }.navigationBarTitle("Unit Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
