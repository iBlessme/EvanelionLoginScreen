//
//  ContentView.swift
//  EvaLoginScreen
//
//  Created by iBlessme on 05.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct MainView: View{
    
    @State var login = ""
    @State var pass = ""
    @State var nerv = false
    @State var showGit = false
    @State var showAlert = false
    
    var body: some View{
        ZStack{
            //Фон
            Color.black.ignoresSafeArea(.all)
            
            Image("eva02")
                .resizable()
                .frame(width: 300, height: 500)
                .offset(x: -80, y: -180)
            
            Circle()
                .foregroundColor(Color.red)
                .frame(width: 900, height: 1000)
                .offset(x: 0, y: 400)
            
            Image("nerv")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(20)
                .overlay(
                RoundedRectangle(cornerRadius: 200)
                    .stroke(Color(red: 0.852, green: 0.004, blue: 0.138), lineWidth: 3))
                .rotationEffect(.degrees(nerv ? 0 : 360))
                .offset(x: 130, y: -340)
                .onAppear(){
                    withAnimation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: false)){
                        nerv.toggle()
                    }
                        
                }
            
            VStack{
                TextField("Login", text: $login)
                    .disableAutocorrection(true)
                    .foregroundColor(.white)
                    .font(.title2)
//                    .offset(x: 10, y: 0)
                    .frame(width: 300, height: 30)
                
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 200)
                        .stroke(Color.orange, lineWidth: 5))
                    .background(Color(.init(gray: 0.1, alpha: 0.2)).cornerRadius(200))
                    .padding()
                
                SecureField("Password", text: $pass)
                    .foregroundColor(.white)
                    .font(.title2)
//                    .offset(x: 10, y: 0)
                    .frame(width: 300, height: 30)
                
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 200)
                        .stroke(Color.orange, lineWidth: 5))
                    .background(Color(.init(gray: 0.1, alpha: 0.2)).cornerRadius(200))
                
            }
            .offset(x: -30, y: 100)
            if login == "Vladik" && pass == "1234"{
            Button{
                self.showGit.toggle()
            }label: {
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 40, height: 50)
                    .foregroundColor(Color.white)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 200).stroke(Color.orange, lineWidth: 5))
            }
            .background(Color(.init(gray: 0.1, alpha: 0.2)).cornerRadius(200))
            .offset(x: 100, y: 250)
            }
            else{
                Button{
                    self.showAlert.toggle()
                }label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 40, height: 50)
                        .foregroundColor(Color.orange)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 200).stroke(Color.orange, lineWidth: 5))
                }
                .background(Color(.init(gray: 0.1, alpha: 0.2)).cornerRadius(200))
                .offset(x: 100, y: 250)
            }
            
            
            
            
            
                
            
        }
        .alert("Неверные данные", isPresented: $showAlert){
            Button{
                self.showAlert.toggle()
            }label: {
                Text("OK")
            }
        }
        .sheet(isPresented: $showGit){
            GitView()
        }
    }
}

struct GitView: View{
    var body: some View{
        ZStack{
            Color(.init(gray: 0.1, alpha: 0.4)).ignoresSafeArea(.all)
            Text("👨🏻‍💻 https://github.com/iBlessme")
                .foregroundColor(Color.purple)
                .font(.system(size: 20, weight: .bold))
        }
    }
}
