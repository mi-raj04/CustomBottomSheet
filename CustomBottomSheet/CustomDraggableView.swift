//
//  ContentView.swift
//  CustomBottomSheet
//
//  Created by mind on 18/04/24.
//

import SwiftUI

struct CustomDraggableView: View {
    //MARK: - Properties
    @State private var startingOffset: CGFloat = UIScreen.main.bounds.height * 0.8
    @State private var currentOffset:CGFloat = 0
    @State private var endOffset:CGFloat = 0
    
    //MARK: - Body
    var body: some View {
        ZStack{
            Color.indigo.ignoresSafeArea()
            DraggableView()
                .offset(y:startingOffset)
                .offset(y:currentOffset)
                .offset(y:endOffset)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()){
                                currentOffset = value.translation.height
                            }
                        }
                    
                        .onEnded{ value in
                            withAnimation(.spring()){
                                if currentOffset < -150{
                                    endOffset = -startingOffset
                                }else if endOffset != 0 && currentOffset > 150 {
                                    endOffset = .zero
                                }
                                currentOffset = 0
                            }
                        }
                )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CustomDraggableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDraggableView()
    }
}

struct DraggableView: View {
    var body: some View {
        VStack(spacing: 20){
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("SignUp")
                .font(.headline)
                .fontWeight(.semibold)
            Image(systemName: "flame")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 100)
            Text("SwiftUI is a modern and intuitive framework by Apple for building user interfaces across their platforms, empowering developers with declarative syntax and live previews")
                .multilineTextAlignment(.center)
            
            Text("CREATE ACCOUNT")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.cornerRadius(30))
    }
}
