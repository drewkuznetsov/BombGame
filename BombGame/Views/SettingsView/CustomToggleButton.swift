//
//  CustomToggleButton.swift
//  BombGame
//
//  Created by Ylyas Abdywahytow on 2/15/25.
//

import SwiftUI
import Foundation

import SwiftUI

struct CustomToggleButton<Value: RawRepresentable & CaseIterable & Hashable>: View where Value.RawValue == String {
    @Binding var selectedValue: Value
    @Binding var isExpanded: Bool
    let title: String
    
    private var filteredValues: [Value] {
        Value.allCases.filter { $0.rawValue != "none" }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Button {
                withAnimation {
                    isExpanded.toggle()
                }
            } label: {
                HStack {
                    Text(title)
                        .font(.boldRounded(fontSize: 16))
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    Text(selectedValue.rawValue)
                        .font(.regularRounded(fontSize: 16))
                        .foregroundColor(Color.settingsMusic)
                        .padding(.trailing, 10)
                    
                    Image(isExpanded ? "arrow.down" : "ArrowRight")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
                .frame(width:308,height: 49)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.primary.opacity(0.7)))
            }
            .frame(width:308,height: 49)

            if isExpanded {
                VStack(spacing: 0) {
                    Divider()  
                    ForEach(filteredValues, id: \.self) { value in
                        Button {
                            withAnimation {
                                selectedValue = value
                                isExpanded = false
                            }
                        } label: {
                            Text(value.rawValue)
                                .font(.headline)
                                .foregroundColor(Color.settingsMusic)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 40)
                                .padding(.horizontal, 30)
                                .background(Color.primary.opacity(0.7))
                        }
                        Divider()
                    }
                }
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
        .frame(maxWidth: .infinity)
    }
}
