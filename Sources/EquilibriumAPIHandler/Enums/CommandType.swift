//
//  CommandType.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

public enum CommandType: String, Codable {
    case ir
    case bluetooth
    case network
    case script
}
