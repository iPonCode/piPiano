//
//  Array+SafeAccess.swift
//  piPiano
//
//  Created by Simón Aparicio on 27/01/2023.
//  Copyright © 2018 iPon.es All rights reserved.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index < endIndex && index >= 0 else { return nil }
        return self[index]
    }
}
