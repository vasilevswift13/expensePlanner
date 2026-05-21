// добавляю изменения попытка номер 2 для gitHub
// ну вроде получилось
import SwiftUI

struct DemoStackView: View {

    var body: some View {
        VStack {
            HeaderView()
            HStack(spacing: 10) {
                TileView(
                    text: "Apple Watch",
                    subtext: "Series X",
                    color: .gray,
                    paddingSide: .leading
                )
                TileView(
                    text: "iPhone",
                    subtext: "Series X",
                    color: .orange,
                    paddingSide: .trailing
                )
            }
        }
    }
}

#Preview {
    DemoStackView()
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Выберите")
                .font(.system(.largeTitle))
                .fontWeight(.black)
                .padding(.leading)
            Text("свой девайс")
                .font(.system(.largeTitle))
                .fontWeight(.black)
                .padding(.leading)
        }
    }
}

struct TileView: View {
    let text: String
    let subtext: String
    let color: Color
    let paddingSide: Edge.Set

    @State var selected = false

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(selected ? Color.red : color)
                .cornerRadius(10)
            VStack {
                Text(text)
                    .font(.system(.largeTitle))
                    .fontWeight(.black)
                Text(subtext)
                    .font(.system(.largeTitle))
                    .fontWeight(.black)
            }
            .foregroundStyle(Color.white)
            .padding()
            .cornerRadius(10)
        }
        .padding(paddingSide, 10)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 250, maxHeight: 250)
        .fixedSize(horizontal: false, vertical: true)
        .onTapGesture {
            print("tapped \(text + " " + subtext)")
            selected.toggle() // сменить значение на противоположное
        }
    }
}
