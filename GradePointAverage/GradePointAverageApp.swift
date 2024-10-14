//
//  GradePointAverageApp.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 20.03.24.
//

import SwiftUI

@main
struct GradePointAverageApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            GradeCalculatorBuilder.makeCalculatorView()
                .environment(\.colorScheme, .light)
        }
    }
}
