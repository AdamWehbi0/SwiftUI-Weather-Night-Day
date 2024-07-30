import SwiftUI


struct ContentView: View{
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            
            BackgroundView(isNight: $isNight )
            
            VStack(spacing: 8){
                
                CityNameView(cityName: "Cupertino, CA")
                
                VStack{
                    
                    CurrWeather(currClimate: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                currTemp: "79")
                
                }
                .padding(.bottom,40)
                HStack(spacing:15){
                    
                    WeatherDayView(dayOfWeek: "MON",
                                   imageName: "cloud.sun.fill",
                                   temp: 79)
                    
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.rain.fill",
                                   temp: 30)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temp: 93)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.sun.fill",
                                   temp: 79)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.sun.fill",
                                   temp: 79)
                    
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label:{
                    ButtonOneLabel(buttonText:"Change Day Time",
                                   textColor: .blue,
                                   backgroundColor: .white)
                }
                
                Spacer()
            }
        }

    }
}

struct ContentView_Previews:
    PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek).font(.system(size: 16, 
                                         weight: .medium))
                .foregroundColor(Color.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40,height:40)
            
            Text("\(temp)°").font(.system(size: 32, weight: .medium))
                .foregroundColor(Color.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? Color.black : Color.blue, isNight ? Color.gray : Color("lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityNameView: View {
    
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct CurrWeather: View{
    
    var currClimate: String
    var currTemp: String
    
    var body: some View{
        Image(systemName: currClimate)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(currTemp)°")
            .padding()
            .font(.system(size: 70, weight: .bold))
            .foregroundColor(.white)
    }
}



