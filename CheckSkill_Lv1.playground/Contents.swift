import UIKit

let n = 0

solution(n)

func solution(_ n:Int) -> Int {
    
    if n == 0 {
        return 0
    }
    
    var answer = 0
    var oddCount = 0
    
    for number in 1...n {
        for subNumber in 1...n {
            if number * subNumber == n {
                answer += number
                oddCount += 1
            }
        }
    }
    
    return answer
}

