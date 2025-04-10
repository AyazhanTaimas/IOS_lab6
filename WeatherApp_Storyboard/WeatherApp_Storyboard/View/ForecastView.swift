import SwiftUI

struct ForecastView: View {
    let data: ForecastData

    var body: some View {
        VStack(alignment: .leading) {
            Text("Прогноз на 5 дней:")
                .font(.headline)
            ForEach(data.list.prefix(5).indices, id: \.self) { index in
                Text("День \(index + 1): \(data.list[index].temp, specifier: "%.1f")°C, \(data.list[index].description)")
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(10)
    }
}
