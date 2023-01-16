//
//  BetterRest.swift
//  Test
//
//  Created by Aldanah Alqbbani on 23/06/1444 AH.
//

import SwiftUI
import CoreML

struct BetterSleep: View {
    //for Users entry info
    @State private var wake_Up = Date.now
    @State private var sleep_Amount = 8.0
    @State private var Coffee_Cups = 1
    // for the alert
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View{
        NavigationView{
            Form(){
//                VStack(alignment: .leading,spacing: 20){
                    Section("When do you want to wake up?"){
                        DatePicker("", selection: $wake_Up, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    Section("Desired amount of sleep?"){
                        Stepper("\(sleep_Amount.formatted()) hours", value: $sleep_Amount, in: 4...12, step: 0.25)
                    }
                    Section("Daily Coffee Cups"){
                        Stepper("\(Coffee_Cups) Cup", value: $Coffee_Cups, in: 1...10)
                        
                    }
                HStack{
                    Text("Your ideal bedtime is ")
                        .foregroundColor(.red)
                    Text("\(alertMessage)")
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                }
//                .alert(alertTitle, isPresented: $showingAlert) {
//                    Button("OK") {
//
//                    }
//                } message: {
//                    Text(alertMessage)
//                }
            }.navigationTitle("Better Sleep App")
            .toolbar {
                    Button("Calculate", action: calculateBedtime)
                }
        }
    }
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wake_Up)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleep_Amount, coffee: Double(Coffee_Cups))
            let sleepTime = wake_Up - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}
struct BetterSleep_Previews:PreviewProvider{
    static var previews: some View {
        BetterSleep()
    }
}

