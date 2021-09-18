import Foundation

let priorities = [1, 1, 9, 1, 1, 1]
let location = 0

solution(priorities, location)

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var printerArray = [Printer]()
    var count = 0
    var answer = 0
    var removeIndex = 0
    var currentIndex = 0
    
    for index in 0...priorities.count-1 {
        printerArray.append(Printer(prioritie: priorities[index], index: index))
    }
    
    while count < priorities.count {
        var currentData = Printer(prioritie: -1, index: 0)
        currentIndex = removeIndex
        
        for _ in 0...printerArray.count-1 {
            if currentIndex == printerArray.count {
                currentIndex = 0
            }
            if printerArray[currentIndex].prioritie > currentData.prioritie {
                currentData = printerArray[currentIndex]
                removeIndex = currentIndex
            }
            currentIndex += 1
        }
        count += 1
        
        if currentData.index == location {
            answer = count
            break
        }
        printerArray.remove(at: removeIndex)
    }
    
    return answer
}

struct Printer {
    let prioritie: Int
    let index: Int
}
