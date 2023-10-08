import 'package:citylab/product/navigation/navigation_constants.dart';
import 'package:citylab/screens/city_detail/view/city_detail_view.dart';
import 'package:citylab/screens/city_detail/view/hcity_detail_view.dart';
import 'package:citylab/screens/home/view/home_view.dart';
import 'package:citylab/screens/order_stats/view/order_stats_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._init();
  static RouteGenerator? _instance;
  static RouteGenerator get instance {
    _instance ??= RouteGenerator._init();
    return _instance!;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case NavigationConstants.HOME_VIEW:
        return MaterialPageRoute(builder: (_) => const HomeView());
        
      case NavigationConstants.ORDER_STATS_VIEW:
        return MaterialPageRoute(builder: (_) => OrderStatsView());
        
      case NavigationConstants.CITY_DETAIL_VIEW:
        return MaterialPageRoute(builder: (_) => const CityDetailView());
        
      case NavigationConstants.HCITY_DETAIL_VIEW:
        return MaterialPageRoute(builder: (_) => const HCityDetailView());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
