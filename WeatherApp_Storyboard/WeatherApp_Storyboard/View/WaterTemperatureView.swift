// Виджет для отображения температуры воды
import SwiftUI


struct WaterTemperatureView: View {
    let data: WaterTemperatureData

    var body: some View {
        VStack(alignment: .leading) {
            Text("Уровень воды:")
                .font(.headline)
            Text("\(data.waterTemp, specifier: "%.1f")м")
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}
