import SwiftUI

// Виджет для отображения влажности
struct HumidityView: View {
    let data: HumidityData

    var body: some View {
        VStack(alignment: .leading) {
            Text("Влажность:")
                .font(.headline)
            Text("\(data.humidity)%")
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}
