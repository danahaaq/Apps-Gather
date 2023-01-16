//
//  WeSplit App.swift
//  Test
//
//  Created by Aldanah Alqbbani on 22/06/1444 AH.
//

import SwiftUI

struct WeSplitApp:View {
    @FocusState private var amountIsFocused: Bool
    @State var text:String = ""
    @State var tapCount = 0
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 10
    let tipPercentages = [0,10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var body: some View{
        NavigationView{
            Form {
                Section("Amount"){
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "SA"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                        
                    }
                }
                Section("How much tip do you want to leave?"){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Total Amount"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
           
            .navigationTitle("WeSplit App")
        }
        
    }
}
struct WeSplitApp_Previews:PreviewProvider{
    static var previews: some View {
        WeSplitApp()
    }
}
