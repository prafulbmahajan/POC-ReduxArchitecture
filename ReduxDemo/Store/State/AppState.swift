//
//  AppState.swift
//  ReduxDemo
//
//  Created by Praful Mahajan on 20/11/23.
//

import Foundation

protocol ReduxState { }

struct AppState: ReduxState {
    var counterState = CounterState()
    var taskState = TaskState()
}
