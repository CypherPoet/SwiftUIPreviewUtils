// StatefulWrapper.swift
//
// Created by CypherPoet.
// ✌️
//
    

import SwiftUI


public struct StatefulWrapper<
    StateValue,
    Content: View
> {
    @State
    private var value: StateValue
  
    @ViewBuilder
    public var content: (Binding<StateValue>) -> Content

    
    // MARK: - Init
    public init(
        _ value: StateValue,
        content: @escaping (Binding<StateValue>) -> Content
    ) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}


extension StatefulWrapper: View {

    public var body: some View {
        content($value)
    }
}


#if DEBUG

struct StatefulPreviewWrapper_Previews: PreviewProvider {
    
    struct ScoreButton: View {
        
        @Binding
        var score: Int
        
        
        var body: some View {
            Button(
                action: {
                    score += 1
                },
                label: {
                    Text("Increment Score")
                }
            )
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
    }
    
    
    static var previews: some View {
        
        StatefulWrapper(0) { currentScore in
            VStack {
                Text("Current Score: \(currentScore.wrappedValue)")
                
                ScoreButton(score: currentScore)
            }
        }
    }
}

#endif
