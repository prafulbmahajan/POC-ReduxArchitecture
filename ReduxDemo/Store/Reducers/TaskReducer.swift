//
//  TaskReducer.swift
//  ReduxDemo
//
//  Created by Praful Mahajan on 20/11/23.
//

import Foundation

func taskReducer(_ state: TaskState, _ action: Action) -> TaskState {
    var state = state

    switch action {
    case .AddTaskAction(let task):
        state.tasks.append(task)
    default:
        break
    }


    return state
}
