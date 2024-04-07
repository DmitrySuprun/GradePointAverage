//
//  GradeCalculatorViewModel.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 30.03.24.
//

import Foundation

final class GradeCalculatorViewModel: ObservableObject {
    
    let buttons: [[ButtonType]] = [
        [.memory(.m1), .memory(.m2), .memory(.m3), .settings],
        [.grade(Grade(description: "7")), .grade(Grade(description: "8")), .grade(Grade(description: "9")), .reserve],
        [.grade(Grade(description: "4")), .grade(Grade(description: "5")), .grade(Grade(description: "6")), .reserve],
        [.grade(Grade(description: "1")), .grade(Grade(description: "2")), .grade(Grade(description: "3")), .clear],
        [.grade(Grade(description: "0")), .grade(Grade(description: "10")), .back],
    ]
    
    // Published
    @Published var displayedGrades = ""
    @Published var gradePointAverage = 0.0
    @Published var gradesCount = "0"
    @Published var currentMemory = ""
    
    // Dependencies
    let calculator: IAverageCalculator
    
    // MARK: - Init
    
    init(calculator: IAverageCalculator) {
        self.calculator = calculator
    }
    
    // MARK: - Public properties
    
    func didTap(button: ButtonType) {
        switch button {
        case .clear:
            calculator.resetCalculator()
        case .back:
            calculator.removeLastGrade()
        case .grade(let grade):
            guard let grade else { break }
            calculator.appendNew(grade: grade)
        case .memory(let memory):
            currentMemory = memory.description
        default:
            break
        }
        updateUI()
    }
    
    // MARK: - Private
    
    private func updateUI() {
        displayedGrades = calculator.grades
        gradePointAverage = calculator.fetchGradeAverage()?.value ?? 0.0
        gradesCount = String(calculator.grades.count)
    }
}
