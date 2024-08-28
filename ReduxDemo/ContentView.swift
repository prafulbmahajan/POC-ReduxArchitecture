//
//  ContentView.swift
//  ReduxDemo
//
//  Created by Praful Mahajan on 20/11/23.
//

import SwiftUI

struct ContentView: View {

    @State private var isPresented: Bool = false
    @EnvironmentObject var store: Store<AppState>

    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
        let onIncrementAsync: () -> Void
    }

    private func map(state: CounterState) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(action: .IncrementAction)
        }, onDecrement: {
            store.dispatch(action: .DecrementAction)
        }, onAdd: {
            store.dispatch(action: .AddAction(value: $0))
        }, onIncrementAsync: {
            store.dispatch(action: .IncrementAsyncAction)
        })
    }

    var body: some View {

        let props = map(state: store.state.counterState)

        VStack {

            Spacer()

            Text("\(props.counter)")
            Button("Increment") {
                props.onIncrement()
            }
            Button("Decrement") {
                props.onDecrement()
            }
            Button("Add") {
                props.onAdd(100)
            }

            Spacer()

            Button("Add Task") {
                self.isPresented = true
            }

            Button("Increment Async") {
                props.onIncrementAsync()
            }

            Spacer()
        }.sheet(isPresented: $isPresented) {
            AddTaskView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: counterReducer, state: CounterState())
        return ContentView().environmentObject(store)
    }
}
