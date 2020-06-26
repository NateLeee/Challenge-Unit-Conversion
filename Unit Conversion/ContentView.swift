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
    @State private var sourceSelected = 0
    @State private var dstSelected = 0
    
    private var sourceUnits = ["HP", "Brake HP", "Kilowatt"]
    private var dstUnits = ["HP", "Brake HP", "Kilowatt"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input here:")) {
                    TextField("", text: $input).keyboardType(.decimalPad)
                }
                Section(header: Text("Source Unit")) {
                    Picker("Select Source Unit", selection: $sourceSelected) {
                        ForEach(0..<sourceUnits.count) {
                            Text("\(self.sourceUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
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
