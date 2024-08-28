//
//  Action.swift
//  ReduxDemo
//
//  Created by Praful Mahajan on 20/11/23.
//

import Foundation

enum Action {
    case IncrementAction
    case DecrementAction
    case AddAction(value: Int)
    case IncrementAsyncAction
    case AddTaskAction(task: Task)
}
