
import 'package:flutter/material.dart';
import 'package:sotintas/src/utils/class_helpers/quality.dart';
import 'package:sotintas/src/utils/custom_colors.dart';

class InkDetailQualityList extends StatelessWidget {
  InkDetailQualityList({Key? key}) : super(key: key);

  final List<Quality> _qualities = [
    Quality(const Icon(Icons.brush), "Fácil de aplicar"),
    Quality(const Icon(Icons.air), "Não deixa cheiro"),
    Quality(const Icon(Icons.check), "É só abrir, mexer e pintar"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CustomColors.grey,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          const Text("Diferenciais"),
          SizedBox(
            height: 100,
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    _qualities[index].icon,
                    const SizedBox(width: 10),
                    Text(_qualities[index].name),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
          )
        ],
      ),
    );
  }
}
