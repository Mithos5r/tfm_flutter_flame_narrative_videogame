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
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      child: Image.asset("assets/images/logos/personaje.png"),
                    ),
                    SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        child: Image.asset("assets/images/logos/arrugas.png")),
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
