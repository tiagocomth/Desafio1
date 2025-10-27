//
//  PriorityEnum.swift
//  Desafio1
//
//  Created by Thiago de Jesus on 23/10/25.
//

import Foundation
import SwiftUI

enum Priority: Int, CaseIterable {
    case critical = 1
    case high
    case medium
    case low
    case veryLow
    
    var color: Color {
        switch self {
        case .critical:
            return .red
        case .high:
            return .orange
        case .medium:
            return .yellow
        case .low:
            return .green
        case .veryLow:
            return .blue
        }
    }
}
