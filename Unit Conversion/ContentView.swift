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
    @State private var inputUnitSelected = 0
    @State private var outputUnitSelected = 1
    
    private var inputUnits = ["HP", "Brake HP", "Kilowatt"]
    private var outputUnits = ["HP", "Brake HP", "Kilowatt"]
    
    private var conversionResult: Double {
        return 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input here:")) {
                    TextField("", text: $input).keyboardType(.decimalPad)
                }
                Section(header: Text("Input Unit")) {
                    Picker("Select Input Unit", selection: $inputUnitSelected) {
                        ForEach(0..<inputUnits.count) {
                            Text("\(self.inputUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output Unit")) {
                    Picker("Select Output Unit", selection: $outputUnitSelected) {
                        ForEach(0..<outputUnits.count) {
                            Text("\(self.outputUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Conversion Output")) {
                    Text("\(self.conversionResult, specifier: "%.2f") \(outputUnits[outputUnitSelected])")
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
