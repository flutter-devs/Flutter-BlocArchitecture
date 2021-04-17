import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/bloc/bottom_nav/bottom_nav_cubit.dart';
import 'package:flutter_bloc_architecture/src/bloc/bottom_nav/checkbox_cubit.dart';
import 'package:flutter_bloc_architecture/src/constants/font_constants.dart';
import 'package:flutter_bloc_architecture/src/constants/string_constant.dart';
import 'package:flutter_bloc_architecture/src/resources/app_colors.dart';
import 'package:flutter_bloc_architecture/src/resources/text_styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: BlocBuilder<CheckboxCubit,bool>(
            builder: (context, isCheckBox) {
               return Checkbox(value: isCheckBox, onChanged: (value){
                 context.read<CheckboxCubit>().selectCheckBox(value);
               });

            }
        ),
        ),
      ),
      bottomNavigationBar:
      BlocBuilder<BottomNavCubit, int>(
    builder: (context, screenIndex) {

      print("screenIndex=${screenIndex}");

      return BottomNavigationBar(
        backgroundColor: Colors.red,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: StringConstant.home
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.work),
              label: StringConstant.help
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.face),
              label: StringConstant.profile
          )
        ],
        currentIndex: screenIndex,
        onTap: (int i) {
          print("index=${i}");
          context.read<BottomNavCubit>().selectTab(i);
        },
        fixedColor: Colors.white,
      );

    }
      ),
    );
  }
}
