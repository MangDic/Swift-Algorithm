import Foundation

let genres = ["classic", "pop", "classic", "classic", "pop"]
let plays = [500, 600, 150, 800, 2500]

print(solution(genres, plays))

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var answer = [Int]()
    
    var music = [String: recordData]()
    
    for i in 0...genres.count - 1 {
        if music[genres[i]] == nil {
            music[genres[i]] = recordData(sum: plays[i], musics: [musicData(index: i, plays: plays[i])])
        }
        else {
            music[genres[i]]!.sum += plays[i]
            music[genres[i]]!.musics.append(musicData(index: i, plays: plays[i]))
        }
    }
    
    for key in music.keys {
        let sortedData = music[key]?.musics.sorted {$0.plays > $1.plays}
        music[key]?.musics = sortedData!
    }
    
    let sortedRecord = music.sorted{$0.1.sum > $1.1.sum}
    
    for data in sortedRecord {
        if data.value.musics.count == 1 {
            answer.append(data.value.musics[0].index)
        }
        else {
            for i in 0...1 {
                answer.append(data.value.musics[i].index)
            }
        }
    }
    
    return answer
}

struct recordData {
    var sum: Int
    var musics: [musicData]
}

struct musicData {
    var index: Int
    var plays: Int
}
