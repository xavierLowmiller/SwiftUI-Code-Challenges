import SwiftUI

private let values: [Double] = [10, 42, 13, 37, 27, 60]

struct Challenge6: View {
	let data: [Double]
	@State private var pct: CGFloat = 0

	init(data: [Double] = values) {
		self.data = data
	}

	var body: some View {
		ZStack {
			Chart(data: data, pct: pct)
				.stroke(lineWidth: 2)
				.fill(Color.red)
			PointIndicator(data: data, pct: pct)
				.fill(Color.red)
		}
		.onAppear {
			withAnimation(.easeInOut(duration: 2)) {
				self.pct = 1
			}
		}
	}
}

struct Chart: Shape {
	let data: [Double]
	var pct: CGFloat

	var animatableData: CGFloat {
		get { pct }
		set { pct = newValue }
	}

	func path(in rect: CGRect) -> Path {
		data
			.path(in: rect)
			.trimmedPath(from: 0, to: pct)
	}
}

struct PointIndicator: Shape {
	let data: [Double]
	var pct: CGFloat

	var animatableData: CGFloat {
		get { pct }
		set { pct = newValue }
	}

	func path(in rect: CGRect) -> Path {

		let endPoint: CGRect = pct == 0
			? .zero
			: data
				.path(in: rect)
				.trimmedPath(from: pct - 0.000000001, to: pct)
				.boundingRect

		let box = CGRect(x: endPoint.midX - 5, y: endPoint.midY - 5,
										 width: 10, height: 10)

		return Path(ellipseIn: box)
	}
}

struct Challenge6_Previews: PreviewProvider {
	static var previews: some View {
		Challenge6(data: values)
			.frame(width: 300, height: 200)
			.objcIOStyle()
	}
}

private extension Array where Element == Double {
	func chart(in rect: CGRect) -> [CGPoint] {
		guard
			let min = values.min(),
			let max = values.max()
			else { return [] }

		return enumerated().map { (index, value) in

			let x = CGFloat(index) * rect.size.width / CGFloat(values.count - 1)
			let y = rect.height - rect.height * CGFloat((value - min) / (max - min))

			return CGPoint(x: x, y: y)
		}
	}

	func path(in rect: CGRect) -> Path {
		Path {
			$0.addLines(chart(in: rect))
		}
	}
}
