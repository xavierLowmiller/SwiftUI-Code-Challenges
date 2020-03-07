import SwiftUI

struct ObjcIOStyle: ViewModifier {
	private let topColor = Color(red: 88 / 255, green: 206 / 255, blue: 217 / 255)
	private let bottomColor = Color(red: 0 / 255, green: 96 / 255, blue: 100 / 255)

	func body(content: Content) -> some View {
		ZStack {
			LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .top, endPoint: .bottom)
				.edgesIgnoringSafeArea(.all)

			content
				.padding()
				.background(
					Color.white
						.cornerRadius(15)
						.shadow(radius: 10)
			)
		}
	}
}


extension View {
	func objcIOStyle() -> some View {
		self.modifier(ObjcIOStyle())
	}
}
