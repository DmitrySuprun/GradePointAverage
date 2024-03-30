//
//  GradeCalculatorViewModel.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 30.03.24.
//

import Foundation

final class GradeCalculatorViewModel: ObservableObject {
    
    // Published
    @Published var displayedGrades = ""
    @Published var gradePointAverage = 0.0
    @Published var gradesCount = ""
    @Published var currentMemory = ""
    
    // Dependencies
    let calculator: IAverageCalculator
    
    // MARK: - Init
    
    init(calculator: IAverageCalculator) {
        self.calculator = calculator
    }
    
    // MARK: - Public properties
    
    func didTap(button: CalculatorButton) {
        switch button {
        case .clear:
            calculator.resetCalculator()
        case .back:
            calculator.removeLastGrade()
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten:
            guard let gradeValue = Int(button.rawValue) else { break }
            let newGrade = Grade(value: gradeValue)
            calculator.appendNew(grade: newGrade)
        case .memory1, .memory2, .memory3:
            currentMemory = button.rawValue
        }
        updateUI()
    }
    
    // MARK: - Private
    
    private func updateUI() {
        displayedGrades = calculator.grades
        gradePointAverage = calculator.fetchGradeAverage()?.value ?? 0.0
    }
}