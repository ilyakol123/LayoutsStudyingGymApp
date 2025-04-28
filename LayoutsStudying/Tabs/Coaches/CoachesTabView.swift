//
//  CoachesView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 21.04.2025.
//

import SwiftUI

struct CoachesTabView: View {
    
    @State var searchText: String = ""
    
    var coaches: [Coach] = [
        Coach(name: "Ekaterina", sex: .female, experience: 3, isPersonal: true, image: "coach1", isFavorite: false, gym: .ddxPlaza, specialization: "testSpec1", quote: "testQuote1"),
        Coach(name: "Dmitriy", sex: .male, experience: 5, isPersonal: false, isFavorite: true, gym: .ddxPlaza, specialization: "testSpec2", quote: "testQuote2"),
        Coach(name: "Julia", sex: .female, experience: 1, isPersonal: true, image: "coach3", isFavorite: false, gym: .ddxMurino, specialization: "testSpec3", quote: "testQuote3"),
        Coach(name: "Ekaterina", sex: .female, experience: 3, isPersonal: true, image: "coach1", isFavorite: false, gym: .ddxPlaza, specialization: "testSpec1", quote: "testQuote1"),
        Coach(name: "Dmitriy", sex: .male, experience: 5, isPersonal: false, isFavorite: true, gym: .ddxPlaza, specialization: "testSpec2", quote: "testQuote2"),
        Coach(name: "Julia", sex: .female, experience: 1, isPersonal: true, image: "coach3", isFavorite: false, gym: .ddxMurino, specialization: "testSpec3", quote: "testQuote3"),
        Coach(name: "Ekaterina", sex: .female, experience: 3, isPersonal: true, image: "coach1", isFavorite: false, gym: .ddxPlaza, specialization: "testSpec1", quote: "testQuote1"),
        Coach(name: "Dmitriy", sex: .male, experience: 5, isPersonal: false, isFavorite: true, gym: .ddxPlaza, specialization: "testSpec2", quote: "testQuote2"),
        Coach(name: "Julia", sex: .female, experience: 1, isPersonal: true, image: "coach3", isFavorite: false, gym: .ddxMurino, specialization: "testSpec3", quote: "testQuote3"),
        Coach(name: "Ekaterina", sex: .female, experience: 3, isPersonal: true, image: "coach1", isFavorite: false, gym: .ddxPlaza, specialization: "testSpec1", quote: "testQuote1"),
        Coach(name: "Dmitriy", sex: .male, experience: 5, isPersonal: false, isFavorite: true, gym: .ddxPlaza, specialization: "testSpec2", quote: "testQuote2"),
        Coach(name: "Julia", sex: .female, experience: 1, isPersonal: true, image: "coach3", isFavorite: false, gym: .ddxMurino, specialization: "testSpec3", quote: "testQuote3")
    ]
    
    @State var showFilterSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Search", text: $searchText)
                        .textFieldStyle(.plain)
                        .padding(.leading, 30)
                        .overlay(alignment: .leading) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .padding(.leading, 8)
                            }
                        .overlay() {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: UIScreen.main.bounds.width - 20, height: 40)
                                .foregroundColor(.gray.opacity(0.25))
                        }
                        .padding(.vertical, 15)
                
                NavigationLink {
                    PersonalCoachesView(coaches: coaches)
                } label: {
                    HStack {
                        Text("Personal coaches")
                            .font(.title)
                            .foregroundStyle(.black)
                            .bold()
                            .padding(.leading, 5)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.black)
                            .padding(.trailing, 10)
                    }
                }
                    
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(coaches) { coach in
                            CoachView(coach: coach)
                                .frame(width: 200, height: 300)
                                .padding(.horizontal, 5)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                NavigationLink {
                    GroupCoachesView()
                } label: {
                    HStack {
                        Text("Group coaches")
                            .font(.title)
                            .foregroundStyle(.black)
                            .bold()
                            .padding(.leading, 5)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.black)
                            .padding(.trailing, 10)
                    }
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(coaches) { coach in
                            CoachView(coach: coach)
                                .frame(width: 130, height: 200)
                                .padding(.horizontal, 5)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                Spacer()
            }
            .formStyle(.columns)
            .padding(10)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showFilterSheet.toggle()
                    } label: {
                        Image(systemName: "slider.vertical.3")
                        }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Text("Coaches")
                        .font(.title)
                        .bold()
                }
            }
            .sheet(isPresented: $showFilterSheet) {
                FiltersView(showFilterSheet: $showFilterSheet, coaches: coaches)
            }
            
        }
            
    }
}

#Preview {
    CoachesTabView()
}
