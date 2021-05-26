//
//  TodoViewModel.swift
//  firestoreTODO
//
//  Created by Guyleaf on 2021/5/26.
//

import Foundation
import FirebaseFirestore

class TodoViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var isFinished: String = ""
    @Published var expiredTime: Date = Date()
    @Published var todoItem: TodoItem?
    private let db: Firestore

    init() {
        self.db = Firestore.firestore()
    }
    
    private func insertTodo() {
        let todo = TodoItem(name: self.name, isFinished: self.isFinished, expiredTime: self.expiredTime)
        do {
            let docReference = try db.collection("todo").addDocument(from: todo)
            print(docReference.documentID)
        }
        catch {
            print(error)
        }
    }
    
    func submit() {
        self.insertTodo()
    }
    
    func getTodo() {
        self.db.collection("todo").getDocuments { QuerySnapshot, Error in
            
            guard let snapshot = QuerySnapshot else { return }
            
            self.todoItem = snapshot.documents.compactMap { element in
                try? element.data(as: TodoItem.self)
            }.last
        }
    }
}
