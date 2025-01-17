import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}