//
//  CommandGroupType.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

public enum CommandGroupType: String, Codable {
    case volume
    case navigation
    case transport
    case coloredButtons = "colored_buttons"
    case channel
    case power
    case numeric
    case other
}
