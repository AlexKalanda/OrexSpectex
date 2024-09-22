//
//  FirestoreService.swift
//  OrexSpectex
//
//  Created by admin on 22/9/2024.
//

import Foundation
import FirebaseFirestore

final class FirestoreService {
    static let shared = FirestoreService(); private init() {}
    private let db = Firestore.firestore()
    private var users: CollectionReference { db.collection("users") }
    
    // создание пользователя
    func createUser(id: String,
                    email: String,
                    name: String = "",
                    surname: String = "",
                    company: String = "",
                    number : Int = 0) async throws {
        let user = UserModel(id: id, name: name, surname: surname, number: number, company: company, email: email)
        try await users.document(id).setData( user.representation )
    }
    
    // метод получение пользователя
    func getUser(byId id: String) async throws -> UserModel {
        let snapshot = try await users.document(id).getDocument()
        guard let data = snapshot.data() else { throw FirestoreErrorCode(.dataLoss) }
        guard let user = UserModel(data: data) else { throw FirestoreErrorCode(.invalidArgument) }
        return user
    }
}
