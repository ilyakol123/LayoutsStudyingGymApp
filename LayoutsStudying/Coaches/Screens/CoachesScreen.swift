//
//  CoachesView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 21.04.2025.
//

import SwiftUI

struct CoachesScreen: View {

    private var viewModel = CoachViewModel()
    @State var searchText: String = ""
    @State var searchViewIsPresented: Bool = false
    @State var showFilterSheet: Bool = false

    var body: some View {
        Form {
            searchField
            personalCoachesLink
            personalCoachesScrollView

            groupCoachesLink
            groupCoachesScrollView
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
                Text("Coach crew")
                    .font(.title)
                    .bold()
            }
        }
        .sheet(isPresented: $showFilterSheet) {
            FiltersView(
                showFilterSheet: $showFilterSheet,
                coaches: viewModel.coaches
            )
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView("Загрузка...")
            }
        }
        .task {
            await viewModel.loadCoaches()
        }
        .alert("Ошибка", isPresented: .constant(viewModel.errorMessage != nil))
        {
            Button("ОК", role: .cancel) { viewModel.errorMessage = nil }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }

    }
    private var searchField: some View {
        NavigationLink {
            //link to search screen
        } label: {
            Text("Search")
                .foregroundStyle(.gray)
                .padding(.leading, 35)
                .overlay(alignment: .leading) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                }
                .contentShape(Rectangle())
                .frame(
                    maxWidth: .infinity,
                    minHeight: 40,
                    alignment: .leading
                )
                .background(.indigo.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .buttonStyle(.plain)
        .padding(.top, 10)
        .padding(.bottom, 15)
        .navigationTitle("")
    }
    private var personalCoachesLink: some View {
        NavigationLink {
            CoachesGreedScreen(coaches: viewModel.coaches)
        } label: {
            HStack {
                Text("Personal coaches")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .bold()
                    .padding(.leading, 5)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.black)
                    .padding(.trailing, 10)
            }
        }
    }
    private var personalCoachesScrollView: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.coaches) { coach in
                    VStack {
                        CoachView(coach: coach)
                            .overlay(alignment: .bottomLeading) {
                                CoachExpView(coach: coach)
                            }
                            .frame(width: 200, height: 300)
                            .padding(.horizontal, 5)

                        HStack {
                            CoachTextView(coach: coach)
                                .padding(.top, -35)
                                .padding(.leading, 7)
                            Spacer()
                        }
                    }
                    .padding(.top, -35)
                    .padding(.bottom, 30)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
    private var groupCoachesLink: some View {
        NavigationLink {
            CoachesGreedScreen(coaches: viewModel.coaches)
        } label: {
            HStack {
                Text("Group coaches")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .bold()
                    .padding(.leading, 5)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.black)
                    .padding(.trailing, 10)
            }
        }
    }
    private var groupCoachesScrollView: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.coaches) { coach in
                    VStack {
                        CoachView(coach: coach)
                            .frame(width: 130, height: 200)
                            .padding(.horizontal, 5)
                        HStack {
                            Text("\(coach.name)")
                                .padding(.top, -25)
                                .padding(.leading, 7)
                            Spacer()
                        }
                    }
                    .padding(.top, -20)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    CoachesScreen()
}
