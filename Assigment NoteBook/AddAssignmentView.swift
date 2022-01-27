//
//  AddAssignmentView.swift
//  Assigment NoteBook
//
//  Created by Student on 1/19/22.
//

import SwiftUI

struct AddAssignmentView: View {
    
    @ObservedObject var AssignmentList: assignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @State private var startDate = Date()
    
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["Computer Science", "English", "Math", "History"]
    
    
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course)
                            
                        
                        
                        
                    }
                }
                .listRowBackground(Color.red)
                .foregroundColor(.black)
                TextField("Description", text: $description)
                    .listRowBackground(Color.white)
                
                DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                    .listRowBackground(Color.white)
                    .foregroundColor(.black)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    .listRowBackground(Color.blue)
                    .foregroundColor(.black)
                
            }
            .navigationBarTitle("Add New Assingment Item", displayMode: .inline).font(.headline)
            
            
            .navigationBarItems(trailing: Button("Save") {
                
                if course.count > 0 &&  description.count > 0 {
                    
                    let item = AssigmentItem(id: UUID(), course: course,
                                             description: description, dueDate: dueDate, startDate: startDate)
                    
                    AssignmentList.items.append(item)
                    
                    presentationMode.wrappedValue.dismiss()
                }
            }).foregroundColor(.red)
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(AssignmentList: assignmentList())
        
    }
}
