import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/presentation/loginScreen/widget/text_fomfield.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AddFoodScreen extends StatelessWidget {
  AddFoodScreen({super.key});

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: ListView(children: [
        Container(
          // width: mwidth / 2,
          height: mwidth / 2,
          decoration: BoxDecoration(color: Colors.grey.shade800),
        ),
        khight20,
        const Textfieldwidget(
            labeltext: "Dish Name",
            prefixicon: Icon(Icons.restaurant_menu_outlined)),
        khight10,
        Text("Food type"),
        // Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         Row(
        //           children: [
        //             Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
        //             Text('Veg')
        //           ],
        //         ),
        //         Row(
        //           children: [
        //             Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
        //             Text('Non-veg')
        //           ],
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToggleSwitch(
              minWidth: 120.0,
              minHeight: 70,
              initialLabelIndex: 1,
              cornerRadius: 20.0,
              inactiveBgColor: Colors.grey.shade800,
              activeFgColor: Colors.white,
              // inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: const ['veg', 'Non-veg'],
              icons: const [
                Icons.restaurant_rounded,
                Icons.restaurant_outlined
              ],
              activeBgColors: const [
                [Colors.green],
                [Colors.red]
              ],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          ],
        ),
        khight10,
        const Textfieldwidgetcomment(labeltext: "Say about dish"),
        khight10,
        // const Textfieldwidget(
        //     labeltext: "Restaurant Name",
        //     prefixicon: Icon(Icons.restaurant_menu_outlined)),
        Textfieldwidgetcomment(labeltext: "Ingredients (min-4)"),

        khight10,
        const Textfieldwidget(
            labeltext: "Price", prefixicon: Icon(Icons.attach_money_outlined)),
        const Textfieldwidget(
            labeltext: "Discount",
            prefixicon: Icon(Icons.attach_money_outlined)),
        // Column(
        //   children: [
        //     // const Text(
        //     //   "Is it veg or non-veg",
        //     //   style: TextStyle(fontSize: 18),
        //     // ),
        //     // const Divider(),
        //     RadioListTile(
        //       title: const Text("veg"),
        //       value: "veg",
        //       groupValue: "",
        //       onChanged: (value) {},
        //     ),
        //     RadioListTile(
        //       title: const Text("non-veg"),
        //       value: "non-veg",
        //       groupValue: "",
        //       onChanged: (value) {},
        //     )
        //   ],
        // ),

        Text('Item Catogary'),
        Row(
          children: [
            DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {},
            ),
          ],
        ),
      ]),
    ));
  }
}
