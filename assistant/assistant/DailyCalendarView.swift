//
//  DailyCalendarView.swift
//  assistant
//
//  Created by Marian John on 1/20/25.
//


import SwiftUI

struct DailyCalendarView: View {
    let hours = Array(0..<24)
    let currentDate = Date()
    
    var body: some View {
        VStack {
            // Date Header
            HStack {
                Button(action: {
                    // Navigate to the previous day
                }) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text(currentDate, style: .date)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    // Navigate to the next day
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
            
            // Time Slots
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(hours, id: \.self) { hour in
                        HStack {
                            Text("\(hour % 12 == 0 ? 12 : hour % 12) \(hour < 12 ? "AM" : "PM")")
                                .font(.headline)
                                .frame(width: 80, alignment: .leading)
                            
                            Divider()
                            
                            Text("No Events") // Placeholder for event details
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                            
                            Spacer()
                        }
                        .frame(height: 60)
                        .padding(.horizontal)
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                    }
                }
                .padding()
            }
            
            // Add Event Button
            Button(action: {
                // Add event action
            }) {
                Text("Add Event")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .background(Color(UIColor.secondarySystemBackground))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DailyCalendarView()
    }
}