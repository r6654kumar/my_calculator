import 'package:flutter/material.dart';
import 'package:my_calculator/pages/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_calculator/pages/drawer.dart';
class HomePage extends StatefulWidget {
@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
var userInput = '';
var answer = '';

// Array of button
final List<String> buttons = [
	'C','+/-','%','<-','7','8','9','/','4','5','6','x','1','2','3','-','0','.','=','+',
];

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: new AppBar(
		title: new Text("Calculator"),
	), //AppBar
  drawer:MyDrawer(),
	backgroundColor: Colors.white,
	body: Column(
		children: <Widget>[
		Expanded(
			child: Container(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
					Container(
					padding: EdgeInsets.all(20),
					alignment: Alignment.centerRight,
					child: Text(
						userInput,
						style: TextStyle(fontSize: 18, color: Colors.black),
					),
					),
					Container(
					padding: EdgeInsets.all(15),
					alignment: Alignment.centerRight,
					child: Text(
						answer,
						style: TextStyle(
							fontSize: 30,
							color: Colors.black,
							fontWeight: FontWeight.bold),
					),
					)
				]),
			),
		),
		Expanded(
			flex: 3,
			child: Container(
			child: GridView.builder(
				itemCount: buttons.length,
				gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
					crossAxisCount: 4),
				itemBuilder: (BuildContext context, int index) {
					// Clear Button
					if (index == 0) {
					return MyButton(
						buttontapped: () {
						setState(() {
							userInput = '';
							answer = '';
						});
						},
						buttonText: buttons[index],
						color: Colors.purple[50],
						textColor: Colors.black,
					);
					}

					// +/- button
					else if (index == 1) {
					return MyButton(
            buttontapped: (){
              setState(() {
                if(userInput!='-'){
                  userInput += '-';
                }
              });
            },
						buttonText: buttons[index],
						color: Colors.purple[50],
						textColor: Colors.black,
					);
					}
					// % Button
					else if (index == 2) {
					return MyButton(
						buttontapped: () {
						setState(() {
							userInput += buttons[index];
						});
						},
						buttonText: buttons[index],
						color: Colors.purple[50],
						textColor: Colors.black,
					);
					}
					// Delete Button
					else if (index == 3) {
					return MyButton(
						buttontapped: () {
						setState(() {
							userInput =
								userInput.substring(0, userInput.length - 1);
						});
						},
						buttonText: buttons[index],
						color: Colors.purple[50],
						textColor: Colors.black,
					);
					}
					// Equal_to Button
					else if (index == 18) {
					return MyButton(
						buttontapped: () {
						setState(() {
							equalPressed();
						});
						},
						buttonText: buttons[index],
						color: Colors.purple[50],
						textColor: Colors.black,
					);
					}

					// other buttons
					else {
					return MyButton(
						buttontapped: () {
						setState(() {
							userInput += buttons[index];
						});
						},
						buttonText: buttons[index],
						color: isOperator(buttons[index])
							? Colors.purple[50]
							: Colors.white,
						textColor
							: Colors.black,
					);
					}
				}), // GridView.builder
			),
		),
		],
	),
	);
}

bool isOperator(String x) {
	if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
	return true;
	}
	return false;
}

// function to calculate the input operation
void equalPressed() {
	String finaluserinput = userInput;
	finaluserinput = userInput.replaceAll('x', '*');

	Parser p = Parser();
	Expression exp = p.parse(finaluserinput);
	ContextModel cm = ContextModel();
	double eval = exp.evaluate(EvaluationType.REAL, cm);
	answer = eval.toString();
}
}
