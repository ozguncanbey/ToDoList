//
//  TaskView.swift
//  ToDoList
//
//  Created by Özgün Can Beydili on 16.08.2023.
//

import SwiftUI

struct TaskView: View {
    @State private var date = Date()
    @State private var text = ""
    
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
                    TextField("Title", text: $text)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    DatePicker("", selection: $date, in: Date()...)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                    Button("Save") {
                        
                    }.padding()
                        .frame(width: UIScreen.main.bounds.size.width/1.2, height: 50, alignment: .center)
                        .font(.title2)
                        .background()
                        .cornerRadius(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 0)
                        }
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
