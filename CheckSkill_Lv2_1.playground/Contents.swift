
let s = "3people   unFollowed me"

solution(s)

func solution(_ s:String) -> String {
    
    var answer = ""
    var upCnt = 0
    
    for str in s {
        var temp = ""
        if str == " " {
            temp = " "
            upCnt = 0
            
        }
        else {
            if upCnt == 0 {
                temp = str.uppercased()
                upCnt += 1
            }
            else {
                temp = str.lowercased()
            }
        }
        
        answer += temp
    }
    return answer
}
