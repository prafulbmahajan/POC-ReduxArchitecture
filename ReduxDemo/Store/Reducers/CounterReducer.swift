//
//  CounterReducer.swift
//  ReduxDemo
//
//  Created by Praful Mahajan on 20/11/23.
//

import Foundation

func counterReducer(_ state: CounterState, _ action: Action) -> CounterState {

    var state = state
    switch action {
    case .IncrementAction:
        state.counter += 1
    case .DecrementAction:
        state.counter -= 1
    case .AddAction(let value):
        state.counter += value
    default:
        break
    }

    return state
}
