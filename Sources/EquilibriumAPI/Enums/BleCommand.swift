//
//  BleCommand.swift
//  EquilibriumAPI
//
//  Created by Leo Wehrfritz on 24.06.25.
//

public enum BleCommand: String, Codable {
    case advertise
    case connect
    case devices
    case disconnect
}
