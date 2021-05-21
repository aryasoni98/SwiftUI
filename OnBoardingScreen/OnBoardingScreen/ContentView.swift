//
//  ContentView.swift
//  OnBoardingScreen
//
//  Created by Arya Soni on 21/05/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        
        if currentPage > totalPages{
            Home()
        }
        else{
            WalkthroughScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Home Page  . . .

struct Home: View {
    
    var body: some View{
        
        Text("Welcome To Home !!!")
            .font(.title)
            .fontWeight(.heavy)
    }
}

// WalkThrough Screen . . .


struct WalkthroughScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View{
        
        // For Slide Animation ...
        
        ZStack{
                        
            if currentPage == 1{
                ScreenView(image: "image1", title: "Step 1", detail: "", bgColor: Color("color1"))
            }
            
            if currentPage == 2{
                ScreenView(image: "image2", title: "Step 2", detail: "", bgColor: Color("color2"))
            }
            
            if currentPage == 3{
                ScreenView(image: "image3", title: "Step 3", detail: "", bgColor: Color("color3"))
            }
        }
        .overlay{
            
            // Buttom  . .
            
            Button(action: {
                withAnimation(.easeInOut){
                    
                    if currentPage <= totalPages{
                        currentPage += 1
                    }
                }
            }, label: {
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                // Circlular slider  . . .
                
                    .overlay(
                        
                        ZStack{
                            
                            Circle()
                                .stroke(Color.black.opacity(0.04),lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                                .stroke(Color.white,lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-15)
                    )
            })
            .padding(.bottom,20)
            
            ,alignment: .bottom
            
        )
    }
}
    
struct ScreenView: View {
        
    var image:  String
    var title: String
    var detail: String
    var bgColor: Color
        
    @AppStorage("currentPage") var currentPage = 1
        
    var body: some View{
        VStack(spacing: 20){
                
            HStack{
                    
                if currentPage == 1{
                    Text("Hello Member")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                        // Letter Spacing . . .
                        .kerning(1.4)
                }
                else{
                    // Back Button . . .
                    
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                            
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding()

            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            Text(title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                .padding(.top)
            
            Text("Welcome To On Boarding Screen ")
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 120)
        }
        .background(bgColor.cornerRadius(10).ignoresSafeArea())
    }
}
    
// Total Pages . . .
var totalPages = 3
