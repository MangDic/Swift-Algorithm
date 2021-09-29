import Foundation

let numbers = "011"


var visit = [Bool]()
var numberArray = [Int]()
var baseDist = 0
var count = 0
var decimalMap = [Int:Bool]()

solution(numbers)

func solution(_ numbers:String) -> Int {
    
    count = numbers.count
    
    for number in numbers {
        numberArray.append(Int(String(number))!)
    }
    for dist in 1...count {
        baseDist = dist
        visit = [Bool](repeating: false, count: count)
        dfs(dist: 0, str: "")
    }
    
    return decimalMap.count
}

func dfs(dist: Int, str: String) {
    if dist == baseDist {
        let numberValue = Int(str)
        if checkDecimal(number: numberValue!) {
            decimalMap[numberValue!] = true
        }
    }
    else {
        for index in 0...count-1 {
            if !visit[index] {
                visit[index] = true
                dfs(dist: dist + 1, str: str + "\(numberArray[index])")
                visit[index] = false
            }
        }
    }
}

func checkDecimal(number: Int) -> Bool {
    var cnt = 0
    
    if number == 0 || number == 1{
        return false
    }
    for i in 1...number {
        if number%i == 0 {
            cnt += 1
        }
        if cnt > 2 {
            return false
        }
    }
    
    return true
}
