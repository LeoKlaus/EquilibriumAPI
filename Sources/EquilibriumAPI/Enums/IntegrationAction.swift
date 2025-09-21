//
//  IntegrationAction.swift
//  EquilibriumAPI
//
//  Created by Leo Wehrfritz on 21.09.25.
//

public enum IntegrationAction: String, Codable, Hashable, Sendable {
    case toggleLight = "toggle_light"
    case brightnessUp = "brightness_up"
    case brightnessDown = "brightness_down"
}
