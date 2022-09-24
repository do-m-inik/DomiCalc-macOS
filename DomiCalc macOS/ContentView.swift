//
//  ContentView.swift
//  DomiCalc macOS
//
//  Created by Dominik Schäfer on 22.09.22.
//

import SwiftUI

struct ContentView: View {
    @State var textInput: String = ""
    @State var toBeParsedArray: [String] = [] // Array that gets parsed to a calculation
    func buttonInput(charInput: String) {
        if("1234567890+-=".contains(charInput)) { // Check if number/operation is supported
            toBeParsedArray.append(charInput)
        }
    }
    var body: some View {
        VStack {
            Text(toBeParsedArray // Array dispayed in calculator
                    .joined(separator: "")) // Replaces newline after each array element to nothing
            TextField("Text Input", text: $textInput)
            HStack {
                Button(action: {buttonInput(charInput: "C")}) {
                    Text("C")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "^")}) {
                    Text("^")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "(")}) {
                    Text("(")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: ")")}) {
                    Text(")")
                        .frame(maxWidth: 100)
                }
            }
            HStack {
                Button(action: {buttonInput(charInput: "7")}) {
                    Text("7")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "8")}) {
                    Text("8")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "9")}) {
                    Text("9")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "/")}) {
                    Text("/")
                        .frame(maxWidth: 100)
                }
            }
            HStack {
                Button(action: {buttonInput(charInput: "4")}) {
                    Text("4")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "5")}) {
                    Text("5")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "6")}) {
                    Text("6")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "*")}) {
                    Text("*")
                        .frame(maxWidth: 100)
                }
            }
            HStack {
                Button(action: {buttonInput(charInput: "1")}) {
                    Text("1")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "2")}) {
                    Text("2")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "3")}) {
                    Text("3")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "-")}) {
                    Text("-")
                        .frame(maxWidth: 100)
                }
            }
            HStack {
                Button(action: {buttonInput(charInput: "0")}) {
                    Text("0")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: ".")}) {
                    Text(".")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "=")}) {
                    Text("=")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "+")}) {
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
