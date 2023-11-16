import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Stack(children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColoredBox(
                      color: Colors.blue,
                      child: SizedBox(
                        height: 52,
                        width: 32,
                        child: Image.asset("/images/logos/personaje.png"),
                      ),
                    ),
                    ColoredBox(
                      color: Colors.red,
                      child: SizedBox(
                        height: 52,
                        width: 57,
                        child: Image.asset("/images/logos/arrugas.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      title: Text('Capitulo $index'),
                    ),
                    itemCount: 12,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
