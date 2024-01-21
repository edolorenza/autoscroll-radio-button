//
//  RadioButton.swift
//  autoscroll radio button
//
//  Created by Edo Lorenza on 21/01/24.
//

import SwiftUI

struct RadioButton: View {
    
    let id: String
    let callback: (String)->()
    let selectedID : String
    let size: CGFloat
    let color: Color

    init(
        _ id: String,
        callback: @escaping (String)->(),
        selectedID: String,
        size: CGFloat = 25,
        color: Color = Color.primary
        ) {
        self.id = id
        self.size = size
        self.color = color
        self.selectedID = selectedID
        self.callback = callback
    }

    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.selectedID == self.id ? "largecircle.fill.circle" : "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                    
                Text(id)
                    .font(Font.system(size: 20))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(self.color)
        .id(id)
    }
}


struct RadioButtonGroup: View {

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let items : [String]
    @Binding var selectedId: String
    let callback: (String) -> ()

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false){
                VStack {
                    ForEach(0..<items.count) { index in
                        RadioButton(self.items[index], callback: self.radioGroupCallback, selectedID: self.selectedId)
                            .padding(.vertical, 8)
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        proxy.scrollTo(selectedId, anchor: .bottom)
                    }
                }
            }
        }
    }

    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
        self.mode.wrappedValue.dismiss()
    }
}
