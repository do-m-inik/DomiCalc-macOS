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
    var calcResult = Int64(0)
    func buttonInput(charInput: String) {
        if("1234567890+-".contains(charInput)) { // Check if number/operation is supported
            toBeParsedArray.append(charInput)
        } else if("=".contains(charInput)) { // Start of parsing algorithm
            toBeParsedArray.append(charInput)
            var parsedArray: [String] = [] // Start of init
            parsedArray.append("#")
            var posInParsedArray = 0
            var lastChar = parsedArray[posInParsedArray] // End of init
            for charInUnparsedArray in toBeParsedArray {
                if("1234567890".contains(charInUnparsedArray)) {
                    if("1234567890".contains(lastChar)) { // Appends current number to build the number in one array element
                        parsedArray[posInParsedArray] = parsedArray[posInParsedArray] + charInUnparsedArray
                    } else { // Goes forward because the last char was not a number
                        posInParsedArray += 1
                        parsedArray.append(charInUnparsedArray)
                    }
                } else if("+-=".contains(charInUnparsedArray)) {
                    posInParsedArray += 1
                    parsedArray.append(charInUnparsedArray)
                }
                lastChar = charInUnparsedArray // Saves the current char to use it for the next iteration
            }
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
