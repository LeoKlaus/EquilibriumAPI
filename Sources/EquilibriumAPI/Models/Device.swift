//
//  Device.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

public struct Device: Identifiable, Equatable, Codable, Hashable {
    public let id: Int?
    public let name: String
    public let manufacturer: String?
    public let model: String?
    public let type: DeviceType
    public let image: UserImage?
    public let imageId: Int?
    public let commandGroups: [CommandGroup]?
    public let scenes: [Scene]?
    public let macros: [Macro]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case manufacturer
        case model
        case type
        case image
        case imageId = "image_id"
        case commandGroups = "command_groups"
        case scenes
        case macros
    }
    
    public init(id: Int? = nil, name: String, manufacturer: String? = nil, model: String? = nil, type: DeviceType, image: UserImage? = nil, imageId: Int? = nil, commandGroups: [CommandGroup]? = nil, scenes: [Scene]? = nil, macros: [Macro]? = nil) {
        self.id = id
        self.name = name
        self.manufacturer = manufacturer
        self.model = model
        self.type = type
        self.image = image
        self.imageId = imageId
        self.commandGroups = commandGroups
        self.scenes = scenes
        self.macros = macros
    }
}
