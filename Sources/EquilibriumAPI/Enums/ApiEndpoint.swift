//
//  ApiEndpoint.swift
//  EquilibriumAPI
//
//  Created by Leo Wehrfritz on 26.06.25.
//

public enum ApiEndpoint: RawRepresentable {
    case commands
    case command(id: Int)
    case sendCommand(id: Int)
    
    case devices
    case device(id: Int)
    
    case bluetoothDevices
    case bluetoothStartAdvert
    case bluetoothStartPairing
    case bluetoothConnect(address: String)
    case bluetoothDisconnect
    
    case images
    case image(id: Int)
    
    case macros
    case macro(id: Int)
    
    case scenes
    case scene(id: Int)
    case currentScene
    case startScene(id: Int)
    case setCurrentScene(id: Int)
    case stopCurrentScene
    
    case info
    
    public var rawValue: String {
        switch self {
        case .commands:
            "/commands"
        case .command(let id):
            "/commands/\(id)"
        case .sendCommand(let id):
            "/commands/\(id)/send"
        case .devices:
            "/devices"
        case .device(let id):
            "/devices/\(id)"
        case .bluetoothDevices:
            "/bluetooth/devices"
        case .bluetoothStartAdvert:
            "/bluetooth/start_advertisement"
        case .bluetoothStartPairing:
            "/bluetooth/start_pairing"
        case .bluetoothConnect(let address):
            "/bluetooth/connect/\(address)"
        case .bluetoothDisconnect:
            "/bluetooth/disconnect"
        case .images:
            "/images"
        case .image(let id):
            "/images/\(id)"
        case .macros:
            "/macros"
        case .macro(let id):
            "/macros/\(id)"
        case .scenes:
            "/scenes"
        case .scene(let id):
            "/scenes/\(id)"
        case .currentScene:
            "/scenes/current"
        case .startScene(let id):
            "/scenes/\(id)/start"
        case .setCurrentScene(let id):
            "/scenes/\(id)/set_current"
        case .stopCurrentScene:
            "/scenes/stop"
        case .info:
            "/info"
        }
    }
    
    public init?(rawValue: String) {
        return nil
    }
}
