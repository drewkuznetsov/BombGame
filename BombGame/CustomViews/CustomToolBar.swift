//
//  CustomToolBarView.swift
//  BombGame
//
//  Created by Андрей Кузнецов on 11.02.2025.
//

import SwiftUI

//MARK: Custom ToolBar

struct CustomToolBar: View {
    
    var title: String
    
    var leftButtonIcon: String
    var leftButtonAction: () -> Void
    
    var rightButtonIcon: String
    var rightButtonAction: () -> Void
    
    var body: some View {
        
        VStack {
            
            HStack{
                
                ToolBarButton(icon: leftButtonIcon, action: leftButtonAction)
                
                Spacer()
                
                ToolBarTitle(title: title)
                
            
                Spacer()
                
                ToolBarButton(icon: rightButtonIcon, action: rightButtonAction)
                
            }
            
//            Spacer()
        }
        .padding(.top, 70)
    }
}

//MARK: ToolBar Title

struct ToolBarTitle : View {
    
    var title: String
    
    var body: some View {
        
        Text(title)
            .font(Font.boldRounded(fontSize: 40))
    }
}

//MARK: ToolBar Button

struct ToolBarButton: View {
    
    var icon: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(15)
                .foregroundColor(.black)
        }
    }
}

struct CustomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        
        CustomToolBar(title: "Hellow",
                      leftButtonIcon: "Arrow", leftButtonAction: {
            // left button action
        },
                      rightButtonIcon: "Pause") {
            // right button action
        }
    }
}
