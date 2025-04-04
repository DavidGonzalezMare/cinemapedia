import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.movie_outlined, color: colors.primary),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Cinemapedia", style: titleStyle),
                    const Spacer(), // Toma todo el espacio disponible.
                    IconButton(
                      onPressed: () {

                      }, 
                      icon: Icon(Icons.search))
                  ],
                ))));
  }
}
