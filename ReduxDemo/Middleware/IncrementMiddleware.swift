//
//  IncrementMiddleware.swift
//  ReduxDemo
//
//  Created by Praful Mahajan on 20/11/23.
//

import Foundation

func incrementMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case .IncrementAsyncAction:
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                dispatch(.IncrementAction)
            }
        default:
            break
        }
    }
}
