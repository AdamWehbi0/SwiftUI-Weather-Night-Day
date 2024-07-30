//
//  WeatherButton.swift
//  swift-ui-weather
//
//  Created by Adam Wehbi on 7/2/24.
//

import SwiftUI

struct ButtonOneLabel: View{
    
    var buttonText: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(buttonText)
            .frame(width: 280,height:50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size:20,
                          weight: .bold))
            .cornerRadius(10)
    }
}


struct WeatherButton_Previews: PreviewProvider{
    static var previews: some View{
        ButtonOneLabel(buttonText: "Test Button",
                       textColor: .white,
                       backgroundColor: .blue)
    }
}
