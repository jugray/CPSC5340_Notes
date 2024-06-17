//
//  NoteModel.swift
//  Notes
//
//  Created by Justin Gray on 6/15/24.
//

import Foundation
import FirebaseFirestoreSwift


struct NoteModel: Codable, Identifiable {
    @DocumentID var id : String?
    var title : String
    var notesdata : String
}
