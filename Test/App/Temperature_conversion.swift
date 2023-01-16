//
//  Temperature_conversion.swift
//  Test
//
//  Created by Aldanah Alqbbani on 22/06/1444 AH.
//

import SwiftUI

struct Temperature_conversion:View {
    @FocusState private var Focused: Bool
    @State private var Temperature:Double = 30.0
    @State private var Tep1 = "Celsius"
    @State private var Tep2 = "Celsius"
    var tipunit1 = ["Celsius","Fahrenheit", "Kelvin"]
    var tipunit2 = ["Celsius","Fahrenheit", "Kelvin"]
    var Resutl: Double {
        let cels = Temperature
        let result = cels * (9/5) + 32
        return result
    }
    var Resut2: Double {
        let cels = Temperature
        let result = cels + 273.15
        return result
    }
    var Resut3: Double {
        let Fer = Temperature
        let result = Fer - 32 * 5/9
        return result
    }
    var Resut4: Double {
        let Fer = Temperature
        let result = Fer - 32 * 5/9 + 273.15
        return result
    }
    var Resut5: Double {
        let Kel = Temperature
        let result = Kel - 273.15
        return result
    }
    var Resut6: Double {
        let Kel = Temperature
        let result = Kel - 273.15 * 9/5 + 32
        return result
    }
    var body: some View{
        NavigationView{
            Form {
                Section("Enter the degree"){
                    TextField("Amount", value: $Temperature, format: .currency(code: Locale.current.identifier))
                        .keyboardType(.decimalPad)
                        .focused($Focused)
                }
                Section(" Temperature Unit Input"){
                    Picker("Temperature Unit", selection: $Tep1) {
                        ForEach(tipunit1, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section(" Temperature Unit Otput"){
                    Picker("Temperature Unit", selection: $Tep2) {
                        ForEach(tipunit2, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("Result"){
                    if Tep1 == "Celsius" && Tep2 == "Fahrenheit"{
                        Text(Resutl, format: .currency(code: Locale.current.identifier))
                    }
                    if Tep1 == "Celsius" && Tep2 == "Kelvin"{
                        Text(Resut2, format: .currency(code: Locale.current.identifier))
                    }
                    if Tep1 == "Fahrenheit" && Tep2 == "Celsius"{
                        Text(Resut3, format: .currency(code: Locale.current.identifier))
                    }
                    if Tep1 == "Fahrenheit" && Tep2 == "Kelvin"{
                        Text(Resut4, format: .currency(code: Locale.current.identifier))
                    }
                    if Tep1 == "Kelvin" && Tep2 == "Celsius"{
                        Text(Resut5, format: .currency(code: Locale.current.identifier))
                    }
                    if Tep1 == "Kelvin" && Tep2 == "Fahrenheit"{
                        Text(Resut6, format: .currency(code: Locale.current.identifier))
                    }
                }
            }.toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        Focused = false
                    }
                }
            }
            .navigationTitle("Temperature Convert")
        }
    }
}
struct Temperature_conversion_Previews:PreviewProvider{
    static var previews: some View {
        Temperature_conversion()
    }
}

