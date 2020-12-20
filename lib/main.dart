import 'package:flutter/material.dart';
import 'package:calculator_app/widgets/CalcButton.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(CalcApp());

class CalcApp extends StatefulWidget {
  CalcApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';
  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toStringAsFixed(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculator',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xFF283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _history,
                style: TextStyle(fontSize: 24, color: Color(0xFF545F61)),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'AC',
                    callback: allClear,
                    fillColor: 0xFF64B5F6,
                  ),
                  CalcButton(
                    text: 'C',
                    callback: clear,
                    fillColor: 0xFFE57374,
                  ),
                  CalcButton(
                    text: '%',
                    callback: numClick,
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF6C807F,
                  ),
                  CalcButton(
                    text: '-',
                    callback: numClick,
                    fillColor: 0xFFFFFF88,
                    textColor: 0xFF6C807F,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    callback: numClick,
                    fillColor: 0xFF6C807F,
                  ),
                  CalcButton(
                    text: '8',
                    callback: numClick,
                    fillColor: 0xFF6C807F,
                  ),
                  CalcButton(
                    text: '9',
                    callback: numClick,
                    fillColor: 0xFF6C807F,
                  ),
                  CalcButton(
                    text: '*',
                    callback: numClick,
                    fillColor: 0xFFFFFF88,
                    textColor: 0xFF6C807F,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    callback: numClick,
                    fillColor: 0xFF6C807F,
                  ),
                  CalcButton(
                    text: '5',
                    callback: numClick,
                    fillColor: 0xFF6C807F,
                  ),
                  CalcButton(
                    text: '6',
                    callback: numClick,
                    fillColor: 0xFF6C807F,
                  ),
                  CalcButton(
                    text: '/',
                    callback: numClick,
                    fillColor: 0xFFFFFF88,
                    textColor: 0xFF6C807F,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    callback: numClick,
                    fillColor: 0xFF6C807F,
                  ),
                  CalcButton(
                    text: '2',
                    callback: numClick,
                    fillColor: 0xFF6C807F,
                  ),
                  CalcButton(
                    text: '3',
                    callback: numClick,
                    fillColor: 0xFF6C807F,
                  ),
                  CalcButton(
                    text: '+',
                    callback: numClick,
                    fillColor: 0xFFFFFF88,
                    textColor: 0xFF6C807F,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '.',
                    callback: numClick,
                    fillColor: 0xFF6C807F,
                  ),
                  CalcButton(
                    text: '0',
                    callback: numClick,
                    fillColor: 0xFF6C807F,
                  ),
                  CalcButton(
                    text: '00',
                    callback: numClick,
                    fillColor: 0xFF9C907F,
                  ),
                  CalcButton(
                    text: '=',
                    callback: evaluate,
                    fillColor: 0xFFFFFF88,
                    textColor: 0xFF6C807F,
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() => runApp(SignUpApp());

// class SignUpApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         '/': (context) => SignUpScreen(),
//       },
//     );
//   }
// }

// class SignUpScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[300],
//       body: Center(
//         child: SizedBox(
//           width: 300,
//           child: Card(
//             child: SignUpForm(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SignUpForm extends StatefulWidget {
//   @override
//   _SignUpFormState createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   final _firstNameTextController = TextEditingController();
//   final _lastNameTextController = TextEditingController();
//   final _usernameTextController = TextEditingController();

//   double _formProgress = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           LinearProgressIndicator(value: _formProgress),
//           Text('Sign up', style: Theme
//               .of(context)
//               .textTheme
//               .headline4),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _firstNameTextController,
//               decoration: InputDecoration(hintText: 'First name'),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _lastNameTextController,
//               decoration: InputDecoration(hintText: 'Last name'),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _usernameTextController,
//               decoration: InputDecoration(hintText: 'Username'),
//             ),
//           ),
//           TextButton(
//             style: ButtonStyle(
//               foregroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
//                 return states.contains(MaterialState.disabled) ? null : Colors.white;
//               }),
//               backgroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
//                 return states.contains(MaterialState.disabled) ? null : Colors.blue;
//               }),
//             ),
//             onPressed: null,
//             child: Text('Sign up'),
//           ),
//         ],
//       ),
//     );
//   }
// }
