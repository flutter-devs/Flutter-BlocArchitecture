//import 'package:flutter_bloc_architecture/src/bloc/base_state_bloc.dart';
//import 'package:flutter/material.dart';
//
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Center(
//        child: Container(
//          child: Counter(),
//        ),
//      ),
//    );
//  }
//}
//
//class Counter extends StatefulWidget {
//  _CounterState createState() => _CounterState();
//}
//
//class _CounterState extends State<Counter> {
//  BaseStateBloc<int> counterBloc;
//
//  void initState() {
//    super.initState();
//    counterBloc = BaseStateBloc<int>(0);
//  }
//
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(),
//      body: Center(
//        child: Column(
//          children: <Widget>[
//            Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Center(
//                    child: BlocBuilder<int>(
//                        baseStateBloc: counterBloc,
//                        widget: (value) {
//                          return Text("$value");
//                        }))),
//            MaterialButton(
//              color: Theme.of(context).primaryColor,
//              child: Text(
//                'Add',
//                style: TextStyle(color: Colors.white),
//              ),
//              onPressed: () => counterBloc.changeState(state: (int value) {
//                ++value;
//                return value;
//              }),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
