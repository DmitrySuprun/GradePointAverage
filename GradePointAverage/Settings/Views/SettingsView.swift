//
//  SettingsView.swift
//  GradePointAverage
//
//  Created by Dmitriy Suprun on 6.05.24.
//

import SwiftUI

/// Settings calculator
struct SettingsView: View {
    
    // MARK: - Properties
    
    @State private var gradeSystems = ["Coming soon..."]
    @State private var selection: String?
    
    // Для доступа к dismiss
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            VStack {
                List(gradeSystems, id: \.self ,selection: $selection) { item in
                    Text(item)
                }
            }
            .navigationTitle("Settings")
            .navigationBarItems(leading: Button(action: {
                dismiss()  // Закрывает окно
            }) {
                Text("Back")
                    .foregroundColor(.blue)
            })
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    SettingsView()
}
