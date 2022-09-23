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
                Button(action: typeSeven) {
                    Text("C")
                        .frame(maxWidth: 100)
                }
                Button(action: typeEight) {
                    Text("^")
                        .frame(maxWidth: 100)
                }
                Button(action: typeNine) {
                    Text("(")
                        .frame(maxWidth: 100)
                }
                Button(action: typeDiv) {
                    Text(")")
                        .frame(maxWidth: 100)
                }
            }
            HStack {
                Button(action: typeSeven) {
                    Text("7")
                        .frame(maxWidth: 100)
                }
                Button(action: typeEight) {
                    Text("8")
                        .frame(maxWidth: 100)
                }
                Button(action: typeNine) {
                    Text("9")
                        .frame(maxWidth: 100)
                }
                Button(action: typeDiv) {
                    Text("/")
                        .frame(maxWidth: 100)
                }
            }
            HStack {
                Button(action: typeFour) {
                    Text("4")
                        .frame(maxWidth: 100)
                }
                Button(action: typeFive) {
                    Text("5")
                        .frame(maxWidth: 100)
                }
                Button(action: typeSix) {
                    Text("6")
                        .frame(maxWidth: 100)
                }
                Button(action: typeMul) {
                    Text("*")
                        .frame(maxWidth: 100)
                }
            }
            HStack {
                Button(action: typeOne) {
                    Text("1")
                        .frame(maxWidth: 100)
                }
                Button(action: typeTwo) {
                    Text("2")
                        .frame(maxWidth: 100)
                }
                Button(action: typeThree) {
                    Text("3")
                        .frame(maxWidth: 100)
                }
                Button(action: typeMinus) {
                    Text("-")
                        .frame(maxWidth: 100)
                }
            }
            HStack {
                Button(action: typeZero) {
                    Text("0")
                        .frame(maxWidth: 100)
                }
                Button(action: typeComma) {
                    Text(".")
                        .frame(maxWidth: 100)
                }
                Button(action: typeSolve) {
                    Text("=")
                        .frame(maxWidth: 100)
                }
                Button(action: typePlus) {
                    Text("+")
                        .frame(maxWidth: 100)
                }
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
