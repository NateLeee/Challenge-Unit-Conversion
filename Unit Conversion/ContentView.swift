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
    
    private var inputUnits = ["HP", "Kilowatts"]
    private var outputUnits = ["HP", "Kilowatts"]
    
    private var inputValue: Double {
        return Double(input) ?? 0
    }
    
    private var conversionResult: Double {
        let inputUnit = inputUnits[inputUnitSelected]
        let outputUnit = outputUnits[outputUnitSelected]
        
        // "UnitPower.watts" is just a placeholder! The idea is to get this instance created.
        var inputMeasurement = Measurement(value: 0, unit: UnitPower.watts)
        var outputMeasurement = inputMeasurement
        
        switch inputUnit {
        case "HP":
            inputMeasurement = Measurement(value: inputValue, unit: UnitPower.horsepower)
        case "Kilowatts":
            inputMeasurement = Measurement(value: inputValue, unit: UnitPower.kilowatts)
        default:
            return 0
        }
        
        switch outputUnit {
        case "HP":
            outputMeasurement = inputMeasurement.converted(to: .horsepower)
        case "Kilowatts":
            outputMeasurement = inputMeasurement.converted(to: .kilowatts)
        default:
            return 0
        }
        
        return outputMeasurement.value
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
