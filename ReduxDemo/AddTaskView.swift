//
//  AddTaskView.swift
//  ReduxDemo
//
//  Created by Praful Mahajan on 20/11/23.
//

import SwiftUI

struct AddTaskView: View {

    @EnvironmentObject var store: Store<AppState>
    @State private var name: String = ""

    struct Props {

        //props
        let task: [Task]
        //dispatch
        let onTaskAdded: (Task) -> Void
    }

    private func map(state: TaskState) -> Props {
        Props(task: state.tasks, onTaskAdded: { task in
            store.dispatch(action: .AddTaskAction(task: task))
        })
    }


    var body: some View {

        let props = map(state: store.state.taskState)

        VStack {
            TextField("Enter Task", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Add") {
                let task = Task(title: self.name)
                props.onTaskAdded(task)
            }

            List(props.task, id: \.id) { task in
                Text(task.title)
            }

            Spacer()
        }.padding()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: counterReducer, state: CounterState())
        return AddTaskView().environmentObject(store)
    }
}
