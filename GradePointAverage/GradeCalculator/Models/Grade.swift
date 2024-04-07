//
//  Grade.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 30.03.24.
//

struct Grade: Hashable {
    
    let description: String
    let value: Int
    
    init?(description: String, value: Int? = nil) {
        guard let value = Int(description) else { return nil }
        self.description = description
        self.value = value
    }
}
