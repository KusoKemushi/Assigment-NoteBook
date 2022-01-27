//
//  ContentView.swift
//  Assigment NoteBook
//
//  Created by Student on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var AssignmentList = assignmentList()
    @State private var showingAddItemView = false
    
    init  () {
        UITableView.appearance().backgroundColor = .black
    }
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(AssignmentList.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            
                            Text(item.description)
                                .foregroundColor(.white)
                        }
                        
                       
                        
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Start Date")
                                .foregroundColor(.white)
                            Spacer()
                            Text(item.dueDate, style: .date)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Due Date")
                                .foregroundColor(.white)
                            Spacer()
                            Text(item.startDate, style: .date)
                                .foregroundColor(.white)
                        }
                    }
                    .listRowBackground(Color.red)
                }
                
                .onMove(perform: { indices, newOffset in
                    
                    AssignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                    
                })
                .onDelete(perform: { indexSet in
                    
                    AssignmentList.items.remove(atOffsets: indexSet)
                    
                })
                
                
            }
            .navigationBarTitle("Things", displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {showingAddItemView = true}) {Image(systemName: "plus")}).foregroundColor(.red)
            .sheet(isPresented: $showingAddItemView, content: {
                AddAssignmentView(AssignmentList: AssignmentList)
                
            })
        }
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssigmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
    var startDate = Date()
    var courseColor = Int()
    
}


