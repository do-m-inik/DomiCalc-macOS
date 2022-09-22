//
//  ContentView.swift
//  DomiCalc macOS
//
//  Created by Dominik Schäfer on 22.09.22.
//

import SwiftUI

struct ContentView: View {
    @State var textInput: String = ""
    
    var body: some View {
        VStack {
            Text("0")
            TextField("Text Input", text: $textInput)
            HStack {
                Button("7", action: typeSeven)
                Button("8", action: typeEight)
                Button("9", action: typeNine)
                Button("/", action: typeDiv)
            }
            HStack {
                Button("4", action: typeFour)
                Button("5", action: typeFive)
                Button("6", action: typeSix)
                Button("*", action: typeMul)
            }
            HStack {
                Button("1", action: typeOne)
                Button("2", action: typeTwo)
                Button("3", action: typeThree)
                Button("-", action: typeMinus)
            }
            HStack {
                Button("0", action: typeZero)
                Button(".", action: typeComma)
                Button("=", action: typeSolve)
                Button("+", action: typePlus)
            }
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
