//
//  ContentView.swift
//  CellWithDelete
//
//  Created by Pasan Induwara Edirisooriya on 3/1/21.
//

import SwiftUI

enum SwipeHorizontalDirection: String {
    case left, right, none
}

struct ContentView: View {
    @State var swipeHorizontalDirection: SwipeHorizontalDirection = .none { didSet { print(swipeHorizontalDirection) } }
    @State private var drag: CGSize = .zero
    var body: some View {
        ZStack {
            HStack{
                Spacer()
                Button(action: {
                    print("Delete button was tapped")
                }) {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 44, height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .accentColor(.red)
                }
            }
            .padding(.trailing, 30.0)
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .frame(width: UIScreen.main.bounds.width - 30, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
                
                VStack(alignment: .center, spacing: 10, content: {
                    HStack{
                        Text("Notification Title")
                            .font(.custom("Roboto-Bold", size: 13.0))
                        Spacer()
                    }
                    HStack{
                        Text("Lorem ipsum dolor sit amet, ne omnesque eleifend per. Sed possim cotidieque.Qui at esse quaerendum mediocritatem, per et hendrerit liberavisse.Lorem ipsum dolor sit amet, ne omnesque eleifend per. Sed possim cotidieque.Qui at esse quaerendum mediocritatem, per et hendrerit liberavisse.")
                            .font(.custom("Roboto-Regular", size: 11.0))
                            .lineLimit(3)
                            .lineSpacing(5.0)
                        Spacer()
                    }.frame(height: 54, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    HStack{
                        Spacer()
                        Text("26 Dec 2020 , 5.22 PM")                   .font(.custom("Roboto-Regular", size: 10.0))
                        
                    }
                })
                
                .padding( 30.0)
                .frame(height: 95, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .offset(drag)
            .animation(.default)
            .gesture(
                DragGesture()
                    .onChanged {
                        if $0.startLocation.x > $0.location.x {
                            self.swipeHorizontalDirection = .left
                            self.drag = .init(width: -80, height: 0)
                        } else if $0.startLocation.x == $0.location.x {
                            self.swipeHorizontalDirection = .none
                        } else {
                            self.swipeHorizontalDirection = .right
                            self.drag = .zero
                        }
                    })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
