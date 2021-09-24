
import Foundation

let places = [["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var map = [[String]](repeating: [String](repeating: "0", count: 5), count: 5)
var startArray = [dot]()
var visit = [[Bool]]()
var distMap = [[Int]]()

solution(places)

func solution(_ places:[[String]]) -> [Int] {
    
    var answer = [Int]()
    
    for place in places {
        
        startArray = [dot]()
        map = [[String]](repeating: [String](repeating: "0", count: 5), count: 5)
        var xCnt = 0
        var yCnt = 0
        var flag = false
        
        for i in place {
            for j in i {
                
                map[xCnt][yCnt] = String(j)
                if j == "P" {
                    startArray.append(dot(x: xCnt, y: yCnt, dist: 0))
                }
                yCnt += 1
            }
            xCnt += 1
            yCnt = 0
        }
        for start in startArray {
            visit = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)
            distMap = [[Int]](repeating: [Int](repeating: 10000, count: 5), count: 5)
            if !bfs(start: start) {
                flag = true
                break
            }
        }
        if flag {
            answer.append(0)
        }
        else {
            answer.append(1)
        }
    }
    
    return answer
}

func bfs(start: dot) -> Bool{
    var queue = [dot]()
    visit[start.x][start.y] = true
    
    queue.append(start)
    
    while queue.count != 0 {
        var point = queue[0]
        queue.remove(at: 0)
        
        if map[point.x][point.y] == "P" {
            if point.dist <= 2 && point.dist != 0{
                return false
            }
        }
        
        for i in 0...3 {
            let nx = point.x + dx[i]
            let ny = point.y + dy[i]
            if nx < 0 || ny < 0 || nx >= 5 || ny >= 5 {
                continue
            }
            if visit[nx][ny] {
                continue
            }
            if map[nx][ny] == "X" {
                continue
            }
            if distMap[nx][ny] > point.dist + 1 {
                distMap[nx][ny] = point.dist + 1
            }
            visit[nx][ny] = true
            queue.append(dot(x: nx, y: ny, dist: distMap[nx][ny]))
        }
    }
    
    return true
}

struct dot {
    let x: Int
    let y: Int
    let dist: Int
}
