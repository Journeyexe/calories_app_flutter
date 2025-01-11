import 'package:calories_app_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Buscar por alimento',
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(.5),
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none,
              ),
            ),
            onFieldSubmitted: (value) => Navigator.pushNamed(
              context,
              AppRoutes.list,
              arguments: value,
            ),
          ),
        ),
      ),
    );
  }
}
