//
//  DailyWeatherView.swift
//  Weather
//
//  Created by LiewSyetChau on 7/1/22.
//

import SwiftUI

struct DailyWeatherView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    let color1 = CGColor(red: 138/255,
                         green: 194/255,
                         blue: 249/255,
                         alpha: 1)
    
    let color2 = CGColor(red: 107/255,
                         green: 136/255,
                         blue: 239/255,
                         alpha: 1)
    
    var body: some View {
        ForEach(cityVM.weather.daily) { weather in
            LazyVStack {
                dailyCell(weather: weather)
            }
        }
    }
    
    private func dailyCell(weather: WeatherDaily) -> some View{
        HStack {
            Text(cityVM.getDayFor(timestamp: weather.dt)
                    .uppercased()).frame(width: 50)
            
            Spacer()
            
            Text("\(cityVM.getTempFor(temp: weather.temp.max)) | \(cityVM.getTempFor(temp: weather.temp.min)) °F").frame(width: 150)
            
            Spacer()
            
            cityVM.getWeatherIcon(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
            
        }.foregroundColor(.white)
         .padding(.horizontal, 40)
         .padding(.vertical, 15)
         .background(RoundedRectangle(cornerRadius: 5)
                        .fill(LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color(self.color1),
                                    Color(self.color2)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)))
         .shadow(color: Color.white.opacity(0.1),
                 radius: 2,
                 x: -2,
                 y: -2)
         .shadow(color: Color.black.opacity(0.2),
                 radius: 2,
                 x: 2,
                 y: 2)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
