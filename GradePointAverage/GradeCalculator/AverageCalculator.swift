//
//  AverageCalculator.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 30.03.24.
//

protocol IAverageCalculator: AnyObject {
    var grades: String { get }
    func appendNew(grade: Grade)
    func removeLastGrade()
    func resetCalculator()
    func fetchGradeAverage() -> GradeAverage?
}

final class AverageCalculator {
    
    // MARK: - Private
    private var gradesStorage: [Grade]
    
    // MARK: - Init
    init(_ grades: [Grade] = []) {
        self.gradesStorage = grades
    }
}

// MARK: - IAverageCalculatorService

extension AverageCalculator: IAverageCalculator {
    
    var grades: String {
        gradesStorage.map { String($0.value) }.joined(separator: " ")
    }
    
    func appendNew(grade: Grade) {
        gradesStorage.append(grade)
    }
    
    func removeLastGrade() {
        guard !gradesStorage.isEmpty else { return }
        gradesStorage.removeLast()
    }
    
    func resetCalculator() {
        gradesStorage.removeAll()
    }
    
    func fetchGradeAverage() -> GradeAverage? {
        if gradesStorage.isEmpty {
            return nil
        }
        let averageValue = Double(gradesStorage.reduce(0) { $0 + $1.value }) / Double(gradesStorage.count)
        return GradeAverage(value: averageValue)
    }
}

