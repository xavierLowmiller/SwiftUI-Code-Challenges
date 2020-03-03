//
//  Challenge2.swift
//  SwiftUI Challenge 1
//
//  Created by Xaver Lohmüller on 21.02.20.
//  Copyright © 2020 Xaver Lohmüller. All rights reserved.
//

import SwiftUI

struct Challenge2: View {
	let bars: Int
	let totalBars: Int

	var body: some View {
		HStack {
			ForEach(0..<self.totalBars) { index in
				RoundedRectangle(cornerRadius: .greatestFiniteMagnitude)
					.divided(by: CGFloat(index + 1) / CGFloat(self.totalBars) )
					.foregroundColor(index < self.bars ? .black : .gray)
			}
		}
	}
}

extension Shape {
	func divided(by amount: CGFloat) -> Divided<Self> {
		Divided(shape: self, amount: amount)
	}
}

struct Divided<S: Shape>: Shape {
	var shape: S
	var amount: CGFloat
	func path(in rect: CGRect) -> Path {
		shape.path(in: rect.divided(atDistance: amount * rect.height,
																from: .maxYEdge).slice)
	}
}

struct Challenge2_Previews: PreviewProvider {
	static var previews: some View {
		Challenge2(bars: 2, totalBars: 5)
			.frame(width: 150, height: 90)
	}
}
