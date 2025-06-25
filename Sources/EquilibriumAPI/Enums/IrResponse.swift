//
//  IrResponse.swift
//  EquilibriumAPI
//
//  Created by Leo Wehrfritz on 24.06.25.
//

public enum IrResponse: String, Codable {
    case pressKey = "press_key"
    case repeatKey = "repeat_key"
    case shortCode = "short_code"
    case done = "done"
    case cancelled = "cancelled"
    case tooManyRetries = "too_many_retries"
}
