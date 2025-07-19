import 'package:flutter/material.dart';
import 'package:my_barber_app/widgets/home/promo_banner.dart';
import 'package:my_barber_app/widgets/home/trending_section.dart';
import 'package:my_barber_app/widgets/home/service_list.dart';
import 'package:my_barber_app/widgets/shared/shared_bar.dart';
import 'package:my_barber_app/widgets/shared/bottom_navigation_bar.dart';
import 'package:my_barber_app/widgets/shared/sirve_filter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchQuery = '';
  String selectedFilter = 'Todos';

  @override
  Widget build(BuildContext context) {
    return MainMenu(
      currentIndex: 0,
      child: SafeArea(
        child: Column(
          children: [
            SimpleSearchBar(
              hintText: 'Buscar servicios de barbería...',
              notificationCount: 2,
              onSearchChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
              onNotificationTap: () {
                print('Ver notificaciones');
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const PromoBanner(),
                    const SizedBox(height: 20),
                    ServiceFilters(
                      initialFilter: selectedFilter,
                      onFilterSelected: (filter) {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const TrendingSection(),
                    const SizedBox(height: 20),
                    const ServiceList(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
