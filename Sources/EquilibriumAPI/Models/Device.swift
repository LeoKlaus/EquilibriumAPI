//
//  Device.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

import Foundation

public struct Device: Identifiable, Equatable, Codable, Hashable, Sendable {
    
    public var id: Int?
    public let name: String
    public let manufacturer: String?
    public let model: String?
    public let type: DeviceType
    public let bluetoothAddress: String?
    public let image: UserImage?
    public let imageId: Int?
    public let commands: [Command]?
    public let scenes: [Scene]?
    public let macros: [Macro]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case manufacturer
        case model
        case type
        case bluetoothAddress = "bluetooth_address"
        case image
        case imageId = "image_id"
        case commands = "commands"
        case scenes
        case macros
    }
    
    public init(id: Int? = nil, name: String, manufacturer: String? = nil, model: String? = nil, type: DeviceType, bluetoothAddress: String? = nil, image: UserImage? = nil, imageId: Int? = nil, commands: [Command]? = nil, scenes: [Scene]? = nil, macros: [Macro]? = nil) {
        self.id = id
        self.name = name
        self.manufacturer = manufacturer
        self.model = model
        self.type = type
        self.bluetoothAddress = bluetoothAddress
        self.image = image
        self.imageId = imageId
        self.commands = commands
        self.scenes = scenes
        self.macros = macros
    }
}
