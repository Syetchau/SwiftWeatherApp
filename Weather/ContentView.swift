//
//  ContentView.swift
//  Weather
//
//  Created by LiewSyetChau on 5/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cityVM = CityViewViewModel()
    
    let color1 = CGColor(red: 138/255,
                         green: 194/255,
                         blue: 249/255,
                         alpha: 1)
    
    let color2 = CGColor(red: 107/255,
                         green: 136/255,
                         blue: 239/255,
                         alpha: 1)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack(spacing: 0) {
                MenuHeaderView(cityViewModel: cityVM)
                    .padding()
                
                ScrollView(showsIndicators: false) {
                    CityView(cityVM: cityVM)
                }.padding(.top, 10)
                
            }.padding(.top, 40)
        }.background(LinearGradient(gradient: Gradient(
            colors: [Color(self.color1), Color(self.color2)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
