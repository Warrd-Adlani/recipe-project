//
//  Utility.swift
//  RecipePal
//
//  Created by Warrd Adlani on 22/06/2024.
//

import Foundation


final class Utility {
    static var shared = Utility()
    
    private init(){}
    
    var isDebug: Bool {
        return true // TODO
    }
}

func printLog<T>(_ info: T?, forced: Bool = false) {
    if (Utility.shared.isDebug || forced), let info = info {
        if
            let info = info as? Data,
            let stringify = String(data: info, encoding: .utf8)
        {
            print(stringify)
        } else {
            print(info)
        }
    }
}
