//
//  Scene.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

public struct Scene: Identifiable, Equatable, Codable {
    public let id: Int?
    public let name: String?
    public let image: UserImage?
    public let imageId: Int?
    public let bluetoothAddress: String?
    public let keymap: String?
    public let devices: [Device]?
    public let startMacro: Macro?
    public let stopMacro: Macro?
    public let macros: [Macro]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case imageId = "image_id"
        case bluetoothAddress = "bluetooth_address"
        case keymap
        case devices
        case startMacro = "start_macro"
        case stopMacro = "stop_macro"
        case macros
    }
    
    public init(id: Int? = nil, name: String? = nil, image: UserImage? = nil, imageId: Int? = nil, bluetoothAddress: String? = nil, keymap: String? = nil, devices: [Device]? = nil, startMacro: Macro? = nil, stopMacro: Macro? = nil, macros: [Macro]? = nil) {
        self.id = id
        self.name = name
        self.image = image
        self.imageId = imageId
        self.bluetoothAddress = bluetoothAddress
        self.keymap = keymap
        self.devices = devices
        self.startMacro = startMacro
        self.stopMacro = stopMacro
        self.macros = macros
    }
}
