//
//  RangeSliderView.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 22.04.2025.
//

import SwiftUI

struct RangeSliderView: View {
    @Binding var selection: ClosedRange<CGFloat>
    var range: ClosedRange<CGFloat>
    var minimumDistance: CGFloat = 0
    var tint: Color = .indigo
    let circleSize: CGFloat = 20
    
    @State private var slider1: GestureProperties = .init()
    @State private var slider2: GestureProperties = .init()
    @State private var indicatorWidth: CGFloat = 0
    @State private var isInitial: Bool = false
    @State private var isDragging = false
    
    var body: some View {
        GeometryReader { reader in
            let maxSliderWidth = reader.size.width - circleSize * 2
            let minimumDistance = minimumDistance == 0 ? 0 : (minimumDistance / (range.upperBound - range.lowerBound)) * maxSliderWidth
            VStack {
                HStack {
                    Text(Int(selection.lowerBound) < 3 ? "\(Int(selection.lowerBound)) year" : "\(Int(selection.lowerBound)) years")
                    Spacer()
                    Text("\(Int(selection.upperBound)) year")
                }
                .padding()
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(tint.tertiary)
                    .frame(height: 5)
                
                //Sliders
                HStack(spacing: 0) {
                    Circle()
                        .fill(tint)
                        .frame(width: circleSize, height: circleSize)
                        .contentShape(.rect)
                        .overlay {
                            Circle()
                                .fill(Color.white)
                                .frame(width: circleSize / 2, height: circleSize / 2)
                        }
                        .overlay(alignment: .leading) {
                            
                            Rectangle()
                                .fill(tint)
                                .frame(width: indicatorWidth, height: 5)
                                .offset(x: circleSize)
                                .allowsHitTesting(false)
                        }
                        .offset(x: slider1.offset)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    isDragging = true
                                    var translation = value.translation.width + slider1.lastStoredOffset
                                    translation = min(max(translation, 0), slider2.offset - minimumDistance)
                                    slider1.offset = translation
                                    
                                    calculateNewRange(reader.size)
                                } .onEnded { _ in
                                    isDragging = false
                                
                                    slider1.lastStoredOffset = slider1.offset
                                }
                        )
                    Circle()
                        .fill(tint)
                        .frame(width: circleSize, height: circleSize)
                        .contentShape(.rect)
                        .overlay {
                            Circle()
                                .fill(Color.white)
                                .frame(width: circleSize / 2, height: circleSize / 2)
                        }
                        .offset(x: slider2.offset)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    isDragging = true
                                    var translation = value.translation.width + slider2.lastStoredOffset
                                    translation = min(max(translation, slider1.offset + minimumDistance), maxSliderWidth)
                                    slider2.offset = translation
                                    
                                    calculateNewRange(reader.size)
                                } .onEnded { _ in
                                    isDragging = false
                                    slider2.lastStoredOffset = slider2.offset
                                }
                        )
                }
            }
            .frame(maxHeight: .infinity)
            .task {
                guard !isInitial else { return }
                isInitial = true
                try? await Task.sleep(for: .seconds(0))
                let maxWidth = reader.size.width - circleSize * 2
                
                let start = selection.lowerBound.interpolate(inputRange: [range.lowerBound, range.upperBound], outputRange: [0, maxWidth])
                let end = selection.upperBound.interpolate(inputRange: [range.lowerBound, range.upperBound], outputRange: [0, maxWidth])
                
                slider1.offset = start
                slider1.lastStoredOffset = start
                
                slider2.offset = end
                slider2.lastStoredOffset = end
                
                calculateNewRange(reader.size)
            }
            .onChange(of: selection) {
                guard !isDragging else { return } // Если пользователь сам двигает слайдеры - не обновлять
                updateSliderPositions(reader.size)
            }
        }
        }
        .frame(height: 20)
    }
    private func calculateNewRange(_ size: CGSize) {
        indicatorWidth = slider2.offset - slider1.offset
        
        let maxWidth = size.width - circleSize * 2
        
        let startProgress = slider1.offset / maxWidth
        let endProgress = slider2.offset / maxWidth
        
        let newRangeStart = range.lowerBound.interpolated(towards: range.upperBound, amount: startProgress)
        let newRangeEnd = range.lowerBound.interpolated(towards: range.upperBound, amount: endProgress)
        
        selection = newRangeStart...newRangeEnd
    }
    private func updateSliderPositions(_ size: CGSize) {
        let maxWidth = size.width - circleSize * 2
        let start = selection.lowerBound.interpolate(
            inputRange: [range.lowerBound, range.upperBound],
            outputRange: [0, maxWidth]
        )
        let end = selection.upperBound.interpolate(
            inputRange: [range.lowerBound, range.upperBound],
            outputRange: [0, maxWidth]
        )
        
        slider1.offset = start
        slider1.lastStoredOffset = start
        slider2.offset = end
        slider2.lastStoredOffset = end
        
        indicatorWidth = slider2.offset - slider1.offset
    }

    private struct GestureProperties {
        var offset: CGFloat = 0
        var lastStoredOffset: CGFloat = 0
    }
}



#Preview {
    @Previewable @State var selection: ClosedRange<CGFloat> = 0...40
    RangeSliderView(selection: $selection, range: 0...40, minimumDistance: 0)
}

extension CGFloat {
    func interpolate(inputRange: [CGFloat], outputRange: [CGFloat]) -> CGFloat {
        let x = self
        let length = inputRange.count - 1
        if x<=inputRange[0]{
            return outputRange[0]
        }
        for index in 1...length {
            let x1 = inputRange[index-1]
            let x2 = inputRange[index]
            
            let y1 = outputRange[index-1]
            let y2 = outputRange[index]
            
            if x <= inputRange[index]{
                let y = y1 + ((y2-y1) / (x2-x1)) * (x-x1)
                return y
            }
        }
        return outputRange[length]
    }
}
