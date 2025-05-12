//
//  FiltersView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 22.04.2025.
//

import SwiftUI

struct FiltersView: View {
    @State private var selectedGym: Gym?
    @State private var selectedType: Bool?
    @State private var selectedSex: Sex?
    @State private var experienceSelection: ClosedRange<CGFloat> = 0...30
    @Binding var showFilterSheet: Bool
    
    var coaches: [Coach]
    @State var foundCoaches: [Coach] = []
    
    var body: some View {
        NavigationStack {
            Form{
                Section("Gyms") {
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            Button() {
                                selectedGym = nil
                            } label: {
                                Text("All gyms")
                            }
                            .scaledToFit()
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(selectedGym == nil ? Color.indigo.opacity(0.2) : Color.white)
                            .foregroundColor(selectedGym == nil ? Color.indigo : Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.indigo, lineWidth: selectedGym == nil ? 0 : 1)
                            )
                            .cornerRadius(30)
                            .padding(.leading)
                            
                            
                            Button() {
                                selectedGym = .ddxGallery
                            } label: {
                                Text("DDX Saint-Petersburg Gallery")
                            }
                                .scaledToFit()
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(selectedGym == .ddxGallery ? Color.indigo.opacity(0.2) : Color.white)
                                .foregroundColor(selectedGym == .ddxGallery ? Color.indigo : Color.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.indigo, lineWidth: selectedGym == .ddxGallery ? 0 : 1)
                                )
                                .cornerRadius(30)
                                .padding(.leading, 10)
                            
                            Button() {
                                selectedGym = .ddxMurino
                            } label: {
                                Text("DDX Murino")
                            }
                                .scaledToFit()
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(selectedGym == .ddxMurino ? Color.indigo.opacity(0.2) : Color.white)
                                .foregroundColor(selectedGym == .ddxMurino ? Color.indigo : Color.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.indigo, lineWidth: selectedGym == .ddxMurino ? 0 : 1)
                                )
                                .cornerRadius(30)
                                .padding(.leading, 10)
                            
                            Button() {
                                selectedGym = .ddxPlaza
                            } label: {
                                Text("DDX Plaza")
                            }
                                .scaledToFit()
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(selectedGym == .ddxPlaza ? Color.indigo.opacity(0.2) : Color.white)
                                .foregroundColor(selectedGym == .ddxPlaza ? Color.indigo : Color.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.indigo, lineWidth: selectedGym == .ddxPlaza ? 0 : 1)
                                )
                                .cornerRadius(30)
                                .padding(.leading, 10)
                        }
                        .bold(false)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.horizontal, -16)
                }
                Section("Type") {
                    ScrollView(.horizontal) {
                        HStack {
                            Button() {
                                selectedType = nil
                            } label: {
                                Text("Don't care")
                            }
                            .scaledToFit()
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(selectedType == nil ? Color.indigo.opacity(0.2) : Color.white)
                            .foregroundColor(selectedType == nil ? Color.indigo : Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.indigo, lineWidth: selectedType == nil ? 0 : 1)
                            )
                            .cornerRadius(30)
                            .padding(.leading, 10)
                            
                            Button() {
                                selectedType = true
                            } label: {
                                Text("Personal")
                            }
                            .scaledToFit()
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(selectedType == true ? Color.indigo.opacity(0.2) : Color.white)
                            .foregroundColor(selectedType == true ? Color.indigo : Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.indigo, lineWidth: selectedType == true ? 0 : 1)
                            )
                            .cornerRadius(30)
                            .padding(.leading, 10)
                            
                            Button() {
                                selectedType = false
                            } label: {
                                Text("Group")
                            }
                            .scaledToFit()
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(selectedType == false ? Color.indigo.opacity(0.2) : Color.white)
                            .foregroundColor(selectedType == false ? Color.indigo : Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.indigo, lineWidth: selectedType == false ? 0 : 1)
                            )
                            .cornerRadius(30)
                            .padding(.leading, 10)
                        }
                        .bold(false)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.horizontal, -16)
                }
                Section("Sex") {
                    ScrollView(.horizontal) {
                        HStack {
                            Button() {
                                selectedSex = nil
                            } label: {
                                Text("Don't care")
                            }
                            .scaledToFit()
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(selectedSex == nil ? Color.indigo.opacity(0.2) : Color.white)
                            .foregroundColor(selectedSex == nil ? Color.indigo : Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.indigo, lineWidth: selectedSex == nil ? 0 : 1)
                            )
                            .cornerRadius(30)
                            .padding(.leading, 10)
                            
                            Button() {
                                selectedSex = .male
                            } label: {
                                Text("Man")
                            }
                            .scaledToFit()
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(selectedSex == .male ? Color.indigo.opacity(0.2) : Color.white)
                            .foregroundColor(selectedSex == .male ? Color.indigo : Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.indigo, lineWidth: selectedSex == .male ? 0 : 1)
                            )
                            .cornerRadius(30)
                            .padding(.leading, 10)
                            
                            Button() {
                                selectedSex = .female
                            } label: {
                                Text("Woman")
                            }
                            .scaledToFit()
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(selectedSex == .female ? Color.indigo.opacity(0.2) : Color.white)
                            .foregroundColor(selectedSex == .female ? Color.indigo : Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.indigo, lineWidth: selectedSex == .female ? 0 : 1)
                            )
                            .cornerRadius(30)
                            .padding(.leading, 10)
                        }
                        .bold(false)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.horizontal, -16)
                }
                Section("Experience") {
                    RangeSliderView(selection: $experienceSelection, range: 0...30)
                        .padding(.bottom, 70)
                }
            }
            .formStyle(.columns)
            .bold()
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button() {
                        showFilterSheet = false
                    } label: {
                        Text("Back")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button() {
                        selectedGym = nil
                        selectedType = nil
                        selectedSex = nil
                        experienceSelection = 0...30
                    } label: {
                        Text("Reset")
                    }
                }
            }
            .navigationTitle("Filters")
            .navigationBarTitleDisplayMode(.inline)
            
            Spacer()
            
            Button() {
                showFilterSheet = false
                //add filtering later
            } label: {
                Text("Show \(foundCoaches.count) coaches")
            }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.indigo)
                .foregroundColor(.white)
                .cornerRadius(30)
                .padding(.horizontal)
        }
        }
        
}

#Preview {
    FiltersView(showFilterSheet: .constant(false), coaches: [
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
    ])
}
