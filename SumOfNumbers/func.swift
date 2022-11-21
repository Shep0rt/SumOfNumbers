//
//  func.swift
//  Swiftme-FirstApp
//
//  Created by Pavel Michka on 18.11.2022.
//
import Foundation

func readArrayNumber() -> [Double] {
    print("Введите список чисел, после каждого числа жми 'enter', после завершения введи в консоль 'done'")
    var resultNumber: [Double] = []
    var status = true
    
    while status {
        let oneNumber = readLine()
        switch oneNumber {
        case "done":
            status = false
        default:
            if Double(oneNumber!) != nil {
                resultNumber.append(Double(oneNumber!)!)
            } else {
                print("Вы допустили ошибку при вводе, попроуйте еще раз")
            }
        }
    }
    return resultNumber
}

func readNumber() -> Double {
    print("Введите число на которое будет пременена операция:")
    var resultNumber = 0.0
    var status = true

    while status {
        let oneNumber = readLine()
        if Double(oneNumber!) != nil {
            resultNumber = Double(oneNumber!)!
            status = false
        } else {
            print("Вы допустили ошибку при вводе, попроуйте еще раз")
        }
    }
    return resultNumber
}

func getOperation() -> String {
    print("Введите операцию из списка: + - * / ^")
    var operation = ""
    var status = true
    while status {
        let getOperation = readLine()
        if getOperation != nil && getOperation! == "-" || getOperation! == "+" || getOperation! == "*" || getOperation! == "/" || getOperation! == "^"{
            operation = getOperation!
            status = false
        } else {
            print("Вы допустили ошибку при вводе операции, попроуйте еще раз")
        }
    }
    return operation
}

func calc (number1: [Double], number2: Double, operation: String) -> [Double] {
    var result: [Double] = []
    switch operation {
    case "+":
        result = number1.map({$0 + number2})
        break
    case "-":
        result = number1.map({$0 - number2})
        break
    case "*":
        result = number1.map({$0 * number2})
        break
    case "/":
        result = number1.map({$0 / number2})
        break
    case "^":
        result = number1.map({pow($0, number2)})
    default:
        print("Неизвестная операция")
        result = calc(number1: number1, number2: number2, operation: getOperation())
    }
    return result
}
