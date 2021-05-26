//
//  TodoItem.swift
//  firestoreTODO
//
//  Created by Guyleaf on 2021/5/26.
//

import Foundation
import FirebaseFirestoreSwift

struct TodoItem: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let isFinished: String
    let expiredTime: Date
}
