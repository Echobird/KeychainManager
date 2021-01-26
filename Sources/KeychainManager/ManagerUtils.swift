//
//  File.swift
//  
//
//  Created by Konstantin Babin on 26.01.2021.
//
import Foundation

internal enum StandartDataTypes: String {
    case int
    case uInt
    case float
    case double
    case bool
    case string
    case data
}

extension KeychainManager {
    internal static func decodedResult(from data: Data, forType type: StandartDataTypes) -> Any? {
        var finalResult: Any?
        
        switch type {
        case .int:
            finalResult = try? JSONDecoder().decode(Int.self, from: data)
        case .uInt:
            finalResult = try? JSONDecoder().decode(UInt.self, from: data)
        case .float:
            finalResult = try? JSONDecoder().decode(Float.self, from: data)
        case .double:
            finalResult = try? JSONDecoder().decode(Double.self , from: data)
        case .bool:
            finalResult = try? JSONDecoder().decode(Bool.self, from: data)
        case .string:
            finalResult = String(data: data, encoding: .utf8)
        case .data:
            finalResult = data
        }
        
        return finalResult
    }
    
    internal static func getStringType<T: Codable>(for item: T) -> StandartDataTypes? {
        switch item {
        case is Int:
            return .int
        case is UInt:
            return .uInt
        case is Float:
            return .float
        case is Double:
            return .double
        case is Bool:
            return .bool
        case is String:
            return .string
        default:
            return .data
        }
    }
}

