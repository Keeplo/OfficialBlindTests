//
//  main.swift
//  DartGame
//
//  Created by Yongwoo Marco on 2020/10/15.
//

// 다트게임 (1차) 2018 KAKAO BLIND RECRUITMENT

// https://programmers.co.kr/learn/courses/30/lessons/17682
// 해설 : https://tech.kakao.com/2017/09/27/kakao-blind-recruitment-round-1/
// 정리 : https://keeplo.tistory.com/156

import Foundation

func solution(_ dartResult:String) -> Int {
    let numbers = dartResult.split(whereSeparator: {$0.isLetter||$0=="*"||$0=="#"})
    let letters = dartResult.split(whereSeparator: {$0.isNumber})
    print(numbers)
    print(letters)

    var result = numbers.map({Int($0)!})
    print(result)

    for (index, element) in letters.enumerated() {
        for c in String(element) {
            let i = Int(index)
            switch c {
            case "S":
                break
            case "D":
                result[i] *= result[i]
            case "T":
                result[i] *= result[i]*result[i]
            case "*":
                if i != 0 {
                    result[i-1] *= 2
                }
                result[i] *= 2
            case "#":
                result[i] *= -1
            default:
                print("error")
            }
        }
    }

    return result.reduce(0, +)
}

//let dartResult = "1D2S#10S"
//
//print(solution(dartResult))

