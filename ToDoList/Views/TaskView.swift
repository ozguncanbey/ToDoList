//
//  TaskView.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 16.08.2023.
//

import SwiftUI

struct TaskView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject private var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
//                Color("Background")
//                    .edgesIgnoringSafeArea(.all)
                Text("New Task")
                    .font(.system(size: 32))
                    .bold()
                    .padding()
                    
                Form {
                    TextField("Title", text: $viewModel.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    DatePicker("Date", selection: $viewModel.date, in: Date()...)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                    Button("Save") {
                        
                        if viewModel.canSave() {
                            viewModel.save()
                            action: do { self.presentationMode.wrappedValue.dismiss() }
                        } else {
                            viewModel.showAlert = true
                        }
                        
                    }.padding()
                        .frame(width: CGFloat.dWidth/1.2, height: 50, alignment: .center)
                        .font(.title2)
                        .background()
                        .cornerRadius(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 0)
                        }
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text("Please fill the title!"))
                }
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskView()
            
//            TaskView()
//                .environment(\.colorScheme, .dark)
        }
    }
}
