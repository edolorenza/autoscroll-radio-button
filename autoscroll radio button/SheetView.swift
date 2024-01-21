//
//  SheetView.swift
//  autoscroll radio button
//
//  Created by Edo Lorenza on 21/01/24.
//

import SwiftUI

struct SheetView: View {
    @Binding var selected: String
    var body: some View {
        HStack {
            RadioButtonGroup(items: [ "Afghanistan", "Albania", "Algeria", "Andorra", "Angola",
                                      "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria",
                                      "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados",
                                      "Belarus", "Belgium", "Belize", "Benin", "Bhutan",
                                      "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei",
                                      "Bulgaria", "Burkina Faso", "Burundi", "Cabo Verde", "Cambodia",
                                      "Cameroon", "Canada", "Central African Republic", "Chad", "Chile",
                                      "China", "Colombia", "Comoros", "Congo", "Costa Rica",
                                      "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark",
                                      "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt"], selectedId: $selected) { selected in
                print("Selected is: \(selected)")
            }
        }
        .padding()
    }
}
