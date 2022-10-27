import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_interview/view/pages/drawer.dart';
import 'package:odc_interview/view_model/bloc/states.dart';

import '../../../view_model/bloc/home/home_cubit.dart';
import '../../components/core/style.dart';


class NavBottomBar extends StatefulWidget {
  const NavBottomBar({Key? key}) : super(key: key);

  @override
  State<NavBottomBar> createState() => _NavBottomBarState();
}

class _NavBottomBarState extends State<NavBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, CubitState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          HomeCubit myCubit = HomeCubit.get(context);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: secondary,
                leading: IconButton(onPressed: (){ myCubit.drawerKey.currentState!.openDrawer(); }, icon: Padding(padding: EdgeInsets.all(6), child: Image.asset('assets/img/drawer.png',))),
                title: myCubit.currentIndex == 0 ? Image.asset('assets/img/logo.png', width: 70, height: 70,) : myCubit.currentIndex == 1 ? const Text('My Tickets') : const Text('Search'),
                  centerTitle: true,
                  elevation: 0.0,
              ),
              key: myCubit.drawerKey,
              drawer: drawer(context),
              bottomNavigationBar:  BottomNavigationBar(
                //type: BottomNavigationBarType.fixed,
                /*selectedIconTheme: IconThemeData(color: kPrimaryMagentaColor),
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
                selectedItemColor: Colors.black,
                */
                showSelectedLabels: false,
                showUnselectedLabels: false,
                      items: [
                        BottomNavigationBarItem(
                            icon: Image(image: AssetImage(myCubit.currentIndex == 0 ? 'assets/img/homeActive.png' : 'assets/img/home.png') , width: 24, height: 24,),
                            label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Image(image: AssetImage(myCubit.currentIndex == 1 ? 'assets/img/ticketsActive.png' : 'assets/img/tickets.png') , width: 24, height: 24,),
                            label: 'Tickets'),
                        BottomNavigationBarItem(
                            icon: Image(image: AssetImage(myCubit.currentIndex == 2 ? 'assets/img/searchActive.png' : 'assets/img/search.png') , width: 24, height: 24,),
                            label: 'Search'),
                      ],
                      backgroundColor: secondary,
                      unselectedItemColor: Colors.grey,
                      onTap: (index) {
                       // myCubit.changeScreenIndex(index);
                        setState(() {
                          myCubit.currentIndex = index;
                        });
                      },
                      currentIndex: myCubit.currentIndex,
                    ),
                      body: myCubit.screens[myCubit.currentIndex],
            ),
          );
        },
    );
  }
}
