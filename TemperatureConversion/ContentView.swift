//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Melissa  Garrett on 1/24/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemp = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let tempUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var outputTemp: Double {
        let inputAsNumber = Double(inputTemp) ?? 0
        
        switch inputUnit {
        case 0: // Celsium
        
            switch outputUnit {
            case 1: // Fahrenheit
                return ((9/5 * inputAsNumber) + 32)
            case 2: // Kelvin
                return (inputAsNumber + 273)
            default:
                return inputAsNumber
            }
            
        case 1: // Fahrenheit
        
            switch outputUnit {
            case 0: // Celsius
                return ((5/9 * (inputAsNumber - 32)))
            case 2: // Kelvin
                return (5/9 * (inputAsNumber - 32) + 273)
            default:
                return inputAsNumber
            }
            
        case 2: // Kelvin
        
            switch outputUnit {
            case 0: // Celsius
                return (inputAsNumber - 273)
            case 1: // Fahrenehit
                return (9/5 * (inputAsNumber - 273) + 32)
            default:
                return inputAsNumber
            }
            
        default:
            return inputAsNumber
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter temp to convert", text: $inputTemp)
                        .keyboardType(.numbersAndPunctuation)
                }
                
                Section(header: Text("Convert from...")) {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(0 ..< tempUnits.count) {
                            Text("\(tempUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Convert to...")) {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(0 ..< tempUnits.count) {
                            Text("\(tempUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("The converted temp is")) {
                    Text("\(outputTemp, specifier: "%.1f")")
                }
            }
            .navigationBarTitle("Temp Conversion")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
