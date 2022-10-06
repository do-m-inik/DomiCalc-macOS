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
    func textInputFunc() { // Function for the text input
        var equalSignIsTyped = false // Check if the equal sign is typed in the textfield
        for charInInputString in textInput { // Every char gets into the button input function
            let charInInputStringAsString = String(charInInputString) // The foreach loop converts the string to chars. This must be reverted.
            buttonInput(charInput: charInInputStringAsString)
            if(charInInputStringAsString == "=") {
                equalSignIsTyped = true
            }
        }
        if (equalSignIsTyped == false) {
            buttonInput(charInput: "=")
        }
    }
    func buttonInput(charInput: String) {
        if("1234567890+-".contains(charInput)) { // Check if number/operation is supported
            toBeParsedArray.append(charInput)
        } else if("C".contains(charInput)) { // Removes all elements of the to be parsed array
                toBeParsedArray.removeAll()
        } else if("<".contains(charInput) && !toBeParsedArray.isEmpty) { // Deletes the last array element to delete the last char
                toBeParsedArray.removeLast()
        } else if("=".contains(charInput)) { // Start of parsing algorithm
            toBeParsedArray.append(charInput)
            var parsedArray: [String] = [] // Start of init
            var savedNumbers: [Int64] = []
            var calcResult = Int64(0)
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
            parsedArray.append("?") // Marking the end of the calculation
            var lastElem = "#"
            parsedArray.insert("+", at: 1)
            for elem in parsedArray {
                if(Int64(elem) != nil) { // Check if element is a number
                    savedNumbers.append(Int64(elem) ?? Int64(0)) // Saves the numbers of the equation in a seperate Int64 array
                }
                if(Int64(lastElem) == nil && lastElem != "#") { // Checking the operator
                    switch(lastElem) {
                    case "+":
                        for elemInSavedNumbers in savedNumbers {
                            calcResult += elemInSavedNumbers
                        }
                    case "-":
                        for elemInSavedNumbers in savedNumbers {
                            calcResult -= elemInSavedNumbers
                        }
                    default:
                        if(0 == 0) {} // Do nothing if the operator is not plus or minus
                    }
                    savedNumbers.removeAll()
                }
                lastElem = elem
            }
            toBeParsedArray.append(String(calcResult)) // Result gets printed to the input
        }
    }
    var body: some View {
        VStack {
            Text(toBeParsedArray // Array dispayed in calculator
                    .joined(separator: "")) // Replaces newline after each array element to nothing
            HStack {
                TextField("Text Input", text: $textInput)
                    .onSubmit { // Executes the textfield if the RETURN key is typed.
                        textInputFunc()
                    }
                Button(action: textInputFunc) { // Seperated Calc button if someone does not want to press the RETURN key
                    Text("Calc")
                        .frame(maxWidth: 40)
                }
            }
            HStack {
                Button(action: {buttonInput(charInput: "C")}) {
                    Text("C")
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
                Button(action: {buttonInput(charInput: "<")}) {
                    Text("<")
                        .frame(maxWidth: 100)
                }
            }
            HStack {
                Button(action: {buttonInput(charInput: "^2")}) {
                    Text("^2")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "^y")}) {
                    Text("^y")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "%")}) {
                    Text("%")
                        .frame(maxWidth: 100)
                }
                Button(action: {buttonInput(charInput: "!")}) {
                    Text("!")
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
