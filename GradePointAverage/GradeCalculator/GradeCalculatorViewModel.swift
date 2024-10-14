//
//  GradeCalculatorViewModel.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 30.03.24.
//

import Foundation

final class GradeCalculatorViewModel: ObservableObject {
    
    var buttons: [[ButtonType]] = Pad.ten
    
    // Published
    @Published var displayedGrades = ""
    @Published var gradePointAverage = 0.0
    @Published var gradesCount = "0"
    @Published var currentMemory = "M1"
    
    @Published var isSettingsPresented = false
    
    // Dependencies
    let calculator: IAverageCalculator
    
    // MARK: - Init
    
    init(calculator: IAverageCalculator) {
        self.calculator = calculator
    }
    
    // MARK: - Public methods
    
    func didTap(button: ButtonType) {
        switch button {
        case .clear:
            calculator.resetCurrentMemory()
        case .back:
            calculator.removeLastGrade()
        case .grade(let grade):
            guard let grade else { break }
            calculator.appendNew(grade: grade)
        case .memory(let memory):
            calculator.setCurrentMemory(memory)
        case .settings:
            isSettingsPresented = true
        case .up:
            calculator.resetCalculator()
            changeGradeSystem(.forward)
        case .down:
            calculator.resetCalculator()
            changeGradeSystem(.back)
        }
        updateUI()
    }
    
    func changeGradeSystem(_ direction: GradeSystem.Direction) {
        switch direction {
        case .forward:
            buttons = Pad.five
        case .back:
            buttons = Pad.ten
        }
        updateUI()
    }
    
    // MARK: - Private
    
    private func updateUI() {
        displayedGrades = calculator.grades
        gradePointAverage = calculator.fetchGradeAverage()?.value ?? 0.0
        gradesCount = String(calculator.getGradesCount())
        currentMemory = calculator.getCurrentMemory().description
    }
}
