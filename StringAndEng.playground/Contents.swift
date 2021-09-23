import Foundation

let s = "999999"

solution(s)

func solution(_ s:String) -> Int {
    
    var answer = ""
    var engCount = 0
    var engStr = ""
    
    for i in s {
        if engCount != 0 {
            engCount -= 1
            continue
        }
        if let convertedNumber = Int(String(i)) {
            answer += "\(convertedNumber)"
            print("\(i) , EngCount : \(engCount), EngStr : \(engStr)")
        }
        else {
            if engStr.count == 2 {
                let tempEng = getEng(eng: engStr)
                engStr = ""
                engCount = tempEng.dist - 1
                answer += "\(tempEng.value)"
                print("\(i) , EngCount : \(engCount), EngStr : \(engStr)")
            }
            else {
                engStr += String(i)
                print("\(i) , EngCount : \(engCount), EngStr : \(engStr)")
            }
        }
    }
    
    print(answer)
    
    return Int(answer)!
}

func getEng(eng: String) -> Eng {
    var chagedEng = Eng(value: 0, dist: 0)
    switch eng {
    case "ze":
        chagedEng = Eng(value: 0, dist: 2)
    case "on":
        chagedEng = Eng(value: 1, dist: 1)
    case "tw":
        chagedEng = Eng(value: 2, dist: 1)
    case "th":
        chagedEng = Eng(value: 3, dist: 3)
    case "fo":
        chagedEng = Eng(value: 4, dist: 2)
    case "fi":
        chagedEng = Eng(value: 5, dist: 2)
    case "si":
        chagedEng = Eng(value: 6, dist: 1)
    case "se":
        chagedEng = Eng(value: 7, dist: 3)
    case "ei":
        chagedEng = Eng(value: 8, dist: 3)
    default:
        chagedEng = Eng(value: 9, dist: 2)
    }
    
    return chagedEng
}

struct Eng {
    let value: Int
    let dist: Int
}
