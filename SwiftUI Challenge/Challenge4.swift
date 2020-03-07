//
//  Challenge4.swift
//  SwiftUI Challenge
//
//  Created by Xaver Lohmüller on 03.03.20.
//  Copyright © 2020 Xaver Lohmüller. All rights reserved.
//

import SwiftUI

extension HorizontalAlignment {
	private enum ColumnAlignment: AlignmentID {
		static func defaultValue(in context: ViewDimensions) -> CGFloat {
			context[HorizontalAlignment.center]
		}
	}

	static let column = HorizontalAlignment(ColumnAlignment.self)
}

struct Challenge4: View {
	var body: some View {
		VStack(alignment: .column) {
			HStack {
				Text("100 m").font(Font.body.bold())
					.alignmentGuide(.column) { d in d[.trailing] }
				Text("Usain Bolt")
			}
			HStack {
				Text("5 km").font(Font.body.bold())
					.alignmentGuide(.column) { d in d[.trailing] }
				Text("Joshua Cheptegei")
			}
			HStack {
				Text("10 km").font(Font.body.bold())
					.alignmentGuide(.column) { d in d[.trailing] }
				Text("Rhonex Kipruto")
			}
			HStack {
				Text("Marathon").font(Font.body.bold())
					.alignmentGuide(.column) { d in d[.trailing] }
				Text("Eliud Kipchoge")
			}
		}
	}
}


struct Challenge4_Previews: PreviewProvider {
	static var previews: some View {
		Challenge4().objcIOStyle()
	}
}
