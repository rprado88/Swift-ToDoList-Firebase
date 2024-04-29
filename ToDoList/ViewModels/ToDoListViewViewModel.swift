//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Rodrigo Prado on 22/04/24.
//

import Foundation
import FirebaseFirestore

/// ViewModel for list of items view
/// Primary tabs
class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String){
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
