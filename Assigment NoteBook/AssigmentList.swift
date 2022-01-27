//
//  AssigmentList.swift
//  Assigment NoteBook
//
//  Created by Student on 1/14/22.
//

import Foundation



class assignmentList: ObservableObject {

    @Published var items : [AssigmentItem] {

        didSet {

            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(items) {

                UserDefaults.standard.set(encoded, forKey: "data")

            }

        }

    }
    init() {

            if let items = UserDefaults.standard.data(forKey: "data") {

                let decoder = JSONDecoder()

                if let decoded = try? decoder.decode([AssigmentItem].self, from: items) {

                    self.items = decoded

                    return

                }

            }

            items = []

        }
}
