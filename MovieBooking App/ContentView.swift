//
//  ContentView.swift
//  MovieBooking App
//
//  Created by Harry Kwesi De Graft on 22/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           Home()
        }
    }
}

struct Movie {
    let id: Int
    let name: String
    let time: String
    let image: String
}


struct Home: View {
    let movies: [Movie] = [
           Movie(id: 0, name: "Jurassic World", time: "1h 12m", image: "r11"),
           Movie(id: 1, name: "Oceans 8", time: "1h 12m", image: "r12"),
           Movie(id: 2, name: "Inception", time: "2h 28m", image: "r13"),
           Movie(id: 3, name: "The Dark Knight", time: "2h 32m", image: "r14"),
           Movie(id: 4, name: "Avatar", time: "2h 42m", image: "r15"),
           Movie(id: 5, name: "Titanic", time: "3h 14m", image: "r16"),
           Movie(id: 6, name: "Interstellar", time: "2h 49m", image: "r17"),
           Movie(id: 7, name: "The Shawshank Redemption", time: "2h 22m", image: "r18"),
           Movie(id: 8, name: "The Godfather", time: "2h 55m", image: "r19"),
           Movie(id: 9, name: "Pulp Fiction", time: "2h 34m", image: "r20"),
           Movie(id: 10, name: "Forrest Gump", time: "2h 22m", image: "r21"),
           Movie(id: 11, name: "The Matrix", time: "2h 16m", image: "r22"),
       ]

   
    
    var body: some View {
        
        VStack(spacing: 15){
            
            HStack{
                
                VStack(alignment: .leading, spacing: 15){
                    
                    Text("Browse")
                        .font(.largeTitle)
                    
                    Button(action: {
                        
                    }, label: {
                        HStack{
                            Text("Movies in New York")
                            Image(systemName:"chevron.down").font(.body)
                        }
                    }).foregroundColor(.black)
                    
                }
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("menu")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }.padding(.top, 15)
            
            SearchView()
                .padding()
            HStack{
                
                Text("All movies")
                Button(action: {
                    
                }) {
                    HStack(spacing:10){
            
                        Text("Filter")
                       
                        Image("filter")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 12, height: 12)
                         
                    }
                }.foregroundColor(.black)
            }.padding(.bottom,15)

            
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment:.leading, spacing: 12){
                    ScrollView(.horizontal, showsIndicators: false){
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ForEach(movies, id: \.id) { movie in
                            MovieCard(movie: movie)
                        }
                    }
                    .padding()
                }
                }.padding(.horizontal, 15)
                  
            }.padding(.bottom,15)
            
        }
        
    }
}


struct SearchView: View {
    
    @State var txt = ""
    
    var body: some View {
        
        HStack(spacing:15){
            Image(systemName: "magnifyingglass").font(.body)
            TextField("Search Movies", text: $txt)
        }
        .padding()
        .foregroundColor(.black)
        .background(Color("Color"))
        .cornerRadius(25)
    }
}



struct MovieCard: View {
    let movie: Movie
    
    @State var show = false

    var body: some View {
        VStack {
            Image(movie.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 140)
                .cornerRadius(10)
                .onTapGesture {
                    self.show.toggle()
                }

            Text(movie.name)
                .font(.caption2).lineLimit(1)
                .padding(.top, 8)

            Text(movie.time)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 10)
        .cornerRadius(10)
        .shadow(radius: 5)
        .sheet(isPresented: $show) {
            Detail()
        }
    
    }
}


struct Detail : View {
    
    @State var selected = "23"
    var body: some View{
        
        VStack{
            Image("header")
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(height: 200)
            
            VStack{
                
                VStack(spacing: 15){
                    
                    Text("The Joker")
                        .foregroundColor(.black)
                    
                    HStack(spacing: 15){
                        
                        
                        HStack{
                            Image(systemName: "star.fill").font(.caption)
                            Text("4.9")
                        }
                        HStack{
                            Image(systemName: "clock")
                            Text("98 min")
                        }
                        HStack{
                            Image("film")
                            Text("ODEON")
                        }
                     }
                    
                    Divider()
                        .padding(.vertical,15)
                    
                    Text("Arthur Fleck, a party clown, leads an impoverished life with his ailing mother. However, when society shuns him and brands him as a freak, he decides to embrace the life of crime and chaos.")
                        .font(.caption)
                }.padding()
                    .background(Color("Color"))
                    .foregroundColor(Color.black.opacity(0.5))
                    .cornerRadius(25)
                
                HStack(spacing:10){
                    ForEach(dates, id: \.date){ i in
                        
                        Button(action: {
                            self.selected = i.date
                        }) {
                            
                            VStack(spacing: 10){
                                
                                Text(i.day)
                                Text(i.date)
                            }.padding()
                        }
                        .foregroundColor(self.selected == i.date ? Color.white : Color.gray)
                        .background(self.selected == i.date ? Color.blue: Color.clear)
                        .cornerRadius(10)
                    }
                }.padding(.vertical, 25)
                
                HStack(spacing:15){
                    
                    Text("$23")
                    
                    Button(action: {
                        
                    }) {
                        Text("Book Now")
                            .padding(.vertical, 20)
                            .padding(.horizontal,35)
                    }
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Capsule())
                }.padding(.top,15)
                
            }.padding(.horizontal,15)
        }
    }
}


struct DateType {
    let id: Int
    let date: String
    let day: String
}

let dates: [DateType] = [
    DateType(id: 0, date: "23", day: "Mon"),
    DateType(id: 1, date: "24", day: "Tue"),
    DateType(id: 2, date: "25", day: "Wed"),
    DateType(id: 3, date: "26", day: "Thu"),
    DateType(id: 4, date: "27", day: "Fri")
]




#Preview {
    ContentView()
}


