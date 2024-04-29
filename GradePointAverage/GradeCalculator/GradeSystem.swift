//
//  GradeSystem.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 28.04.24.
//

/// System of grades
enum GradeSystem: CaseIterable {
    enum Direction {
        case forward
        case back
    }
    
    case five
    case ten
    case twelve
}

struct Pad {
    static let ten: [[ButtonType]] = [
        [.memory(.m1), .memory(.m2), .memory(.m3), .settings],
        [.grade(Grade(description: "1")), .grade(Grade(description: "2")), .grade(Grade(description: "3")), .up],
        [.grade(Grade(description: "4")), .grade(Grade(description: "5")), .grade(Grade(description: "6")), .down],
        [.grade(Grade(description: "7")), .grade(Grade(description: "8")), .grade(Grade(description: "9")), .clear],
        [.grade(Grade(description: "10")), .back],
    ]
    
    static let five: [[ButtonType]] = [
        [.memory(.m1), .memory(.m2), .memory(.m3), .settings],
        [.grade(Grade(description: "1")), .up],
        [.grade(Grade(description: "2")), .down],
        [.grade(Grade(description: "3")),.clear],
        [.grade(Grade(description: "4")), .grade(Grade(description: "5")), .back],
    ]
    
    static let eleven: [[ButtonType]] = [
        [.memory(.m1), .memory(.m2), .memory(.m3), .settings],
        [.grade(Grade(description: "1")), .grade(Grade(description: "2")), .grade(Grade(description: "3")), .up],
        [.grade(Grade(description: "4")), .grade(Grade(description: "5")), .grade(Grade(description: "6")), .down],
        [.grade(Grade(description: "7")), .grade(Grade(description: "8")), .grade(Grade(description: "9")), .clear],
        [.grade(Grade(description: "10")), .grade(Grade(description: "11")), .grade(Grade(description: "12")), .back],
    ]
    
    let allCases = [Pad.eleven, Pad.ten, Pad.five]
}
