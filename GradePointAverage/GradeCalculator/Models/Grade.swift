//
//  Grade.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 30.03.24.
//

/// Grade
struct Grade: Hashable {
    
    // MARK: - Properties
    
    /// Text description of grade for display on calculator text fields
    let description: String
    /// Value for calculating average grade
    let value: Int
    
    // MARK: - Init
    
    /// If description can't convert to calculating value (aka "A" --/--> 1)  init return nil
    /// init?(description: "A") -> nil
    /// init?(description: "A", value: 1) -> instance
    init?(description: String, value: Int? = nil) {
        guard let value = Int(description) else { return nil }
        self.description = description
        self.value = value
    }
}
