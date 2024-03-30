//
//  GradeCalculatorBuilder.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 30.03.24.
//

import SwiftUI

class GradeCalculatorBuilder {
    static func makeCalculatorView() -> some View {
        let calculator = AverageCalculator(grades: [])
        let viewModel = GradeCalculatorViewModel(calculator: calculator)
        return GradeCalculatorView(viewModel: viewModel)
    }
}
