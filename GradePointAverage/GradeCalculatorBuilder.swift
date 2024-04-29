//
//  GradeCalculatorBuilder.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 30.03.24.
//

import SwiftUI

/// Builder main view
class GradeCalculatorBuilder {
    
    /// Make main grade calculator view
    /// - Returns: grade calculator view
    static func makeCalculatorView() -> some View {
        let calculator = AverageCalculator()
        let viewModel = GradeCalculatorViewModel(calculator: calculator)
        return GradeCalculatorView(viewModel: viewModel)
    }
}
