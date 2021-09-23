import Foundation

let orders = ["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"]
let course = [2,3,5]


var menuMap = [String:Int]()
var baseDist = 0
var menuCount = 0
var sortedOrder = [Character]()
var visit = [Bool]()

//solution(orders, course)

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var answer = [String]()
    var tempCount = -1
    for order in orders {
        menuCount = order.count
        sortedOrder = order.sorted(by: <)
        if tempCount < menuCount {
            tempCount = menuCount
        }
        for i in 2...menuCount {
            baseDist = i
            visit = [Bool](repeating: false, count: menuCount)
            getMenuByCourse(dist: 0, currentIndex: 0 ,menu: "")
        }
    }
    
    for index in course {
        var tempArray = [Order]()
        for key in menuMap.keys {
            if menuMap[key]! >= 2 && key.count == index{
                tempArray.append(Order(key: key, value: menuMap[key]!))
            }
        }
        
        let sortedTempArray = tempArray.sorted{$0.value > $1.value}
        if sortedTempArray.count != 0 {
            let maxCount = sortedTempArray[0].value
            for item in sortedTempArray {
                if item.value == maxCount {
                    answer.append(item.key)
                }
                else {
                    continue
                }
            }
        }
    }
    
    let sortedAnswer = answer.sorted(by: <)
    
    print(sortedAnswer)
    
    return sortedAnswer
}

func getMenuByCourse(dist: Int, currentIndex: Int, menu: String) {
    if dist == baseDist {
        
        let sortedMenu = String(menu.sorted(by: <))
        if menuMap[sortedMenu] == nil {
            menuMap[sortedMenu] = 1
        }
        else {
            menuMap[sortedMenu]! += 1
        }
        
    }
    else {
        for index in currentIndex...menuCount-1 {
            if !visit[index] {
                visit[index] = true
                getMenuByCourse(dist: dist + 1,currentIndex: index, menu: menu + String(sortedOrder[index]))
                visit[index] = false
            }
        }
    }
}

struct Order {
    var key: String
    var value: Int
}
