import 'package:exodus/features/txApp/core/constants/color.dart';
import 'package:exodus/features/txApp/feature/home/components/favorites_screen_widget.dart';
import 'package:exodus/features/txApp/feature/home/components/topTen_screen_widget.dart';
import 'package:exodus/features/txApp/feature/home/state_managment/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCryptoData(context),
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SafeArea(
          child: Column(
            children: [
              _selectedIndex == 0
                  ? const Expanded(child: TopTen())
                  : const Expanded(
                      child: FavoritesScreen(),
                    )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.buttonColor,
          unselectedItemColor: AppColors.white,
          backgroundColor: AppColors.darkGray,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.star_border), label: '')
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0,
          unselectedFontSize: 0,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
