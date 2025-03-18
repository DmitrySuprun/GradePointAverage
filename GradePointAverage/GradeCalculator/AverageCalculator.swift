//
//  AverageCalculator.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 30.03.24.
//

private extension Constants {
    static let gradesSeparator = " "
}

/// Calculator
protocol IAverageCalculator: AnyObject {
    /// Current grades as a string
    var grades: [Grade] { get }
    /// Appends a new grade to the current memory.
    func appendNew(grade: Grade)
    /// Removes the last grade from the current memory.
    func removeLastGrade()
    /// Resets grades in the current memory.
    func resetCurrentMemory()
    /// Reset calculator state
    func resetCalculator()
    /// Fetches the average grade value for the current memory.
    /// - Returns: `GradeAverage` if the average could be calculated, otherwise `nil`.
    func fetchGradeAverage() -> GradeAverage?
    /// Sets the working memory for the calculator.
    func setCurrentMemory(_ memory: Memory)
    /// Memory of calculator state
    func getCurrentMemory() -> Memory
    /// Grades count for calculate average value
    func getGradesCount() -> Int
}

/// Calculator
final class AverageCalculator {
    
    // MARK: - Properties
    private var gradesStorage: [Memory: [Grade]] = [:]
    private var currentMemory: Memory = .m1

    // MARK: - Initialization
    init(grades: [Grade] = []) {
        gradesStorage[currentMemory] = grades
    }
}

// MARK: - Average Calculation Logic
extension AverageCalculator: IAverageCalculator {
    
    var grades: [Grade] {
        getGradesForCurrentMemory()
    }
    
    func appendNew(grade: Grade) {
        if gradesStorage[currentMemory] == nil {
            gradesStorage[currentMemory] = [grade]
        } else {
            gradesStorage[currentMemory]?.append(grade)
        }
    }
    
    func removeLastGrade() {
        guard let grades = gradesStorage[currentMemory], !grades.isEmpty else { return }
        gradesStorage[currentMemory]?.removeLast()
    }
    
    func resetCurrentMemory() {
        gradesStorage[currentMemory]?.removeAll()
    }
    
    func resetCalculator() {
        gradesStorage.removeAll()
        currentMemory = .m1
    }

    func fetchGradeAverage() -> GradeAverage? {
        let grades = getGradesForCurrentMemory()
        guard !grades.isEmpty else { return nil }
        let averageValue = grades.reduce(0.0) { $0 + Double($1.value) } / Double(grades.count)
        return GradeAverage(value: averageValue)
    }
    
    func setCurrentMemory(_ memory: Memory) {
        currentMemory = memory
    }
    
    func getCurrentMemory() -> Memory {
        currentMemory
    }
    
    func getGradesCount() -> Int {
        getGradesForCurrentMemory().count
    }
    
    // MARK: - Private
    
    /// Gets grades for the current memory.
    /// - Returns: An array of `Grade`.
    private func getGradesForCurrentMemory() -> [Grade] {
        return gradesStorage[currentMemory] ?? []
    }
}


