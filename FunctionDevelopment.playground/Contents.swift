import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var answer = [Int]()
    var startIndex = 0
    
    var copyProgresses = progresses
    
    while startIndex < progresses.count {
        var count = 0
        for index in startIndex...progresses.count-1 {
            copyProgresses[index] += speeds[index]
            if copyProgresses[index] >= 100 && index == startIndex {
                startIndex += 1
                count += 1
            }
        }
        
        if count != 0 {
            answer.append(count)
        }
    }
    
    return answer
}
