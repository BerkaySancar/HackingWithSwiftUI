//
//  FileManager+Extension.swift
//  Bucketlist
//
//  Created by Berkay Sancar on 9.12.2022.
//

import Foundation

extension FileManager {
    
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
