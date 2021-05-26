//
//  Song.swift
//  firebaseTest
//
//  Created by Guyleaf on 2021/5/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Song: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let singer: String
    let url: String
}
