//
//  DeviceType.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

public enum DeviceType: String, Codable, Hashable, Sendable {
    case display
    case amplifier
    case player
    case integration
    case other
}
