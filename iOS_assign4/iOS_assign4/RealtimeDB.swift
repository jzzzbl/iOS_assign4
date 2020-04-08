//
//  RealtimeDB.swift
//  iOS_assign4
//
//  Created by Jezebel Torres on 2020-04-08.
//  Copyright © 2020 Sandra Mannila. All rights reserved.
//

import Foundation
import FirebaseDatabase


class RealtimeDB {
    var rootReference: DatabaseReference
    
    init() {
        
        rootReference = Database.database().reference()
        
    }
    func get(leaf: String, complete: @escaping ([String: Any]) -> Void) {
        
        let value = rootReference.child(leaf).observe(.value) {
           (snapshot) in
            guard let userDict = snapshot.value as? [String: Any]
                else {
                    print("Failed to find any actions.")
                    return
            }
            complete(userDict)
        }
        print(value)
    }
}
