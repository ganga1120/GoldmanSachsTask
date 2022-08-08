//
//  ConnectionManager.swift
//  GoldmanSachsTask
//
//  Created by ggajulapati on 08/08/22.
//

import Reachability

class ConnectionManager {

    static let shared = ConnectionManager()
    private init () {}

    func hasConnectivity() -> Bool {
        do {
            let reachability: Reachability = try Reachability()
            let networkStatus = reachability.connection
            
            switch networkStatus {
            case .unavailable:
                return false
            case .wifi, .cellular:
                return true
            case .none:
                return false
            }
        }
        catch {
            return false
        }
    }
}
