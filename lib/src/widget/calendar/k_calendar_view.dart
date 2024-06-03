import 'package:flutter/material.dart';
import 'package:flutter_component/flutter_component.dart';

class KCalendarView extends StatelessWidget {
  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', "Thu", 'Fri', 'Sat'];

  KCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios_rounded, size: 16),
            KText(text: DateTime.now().month.toString()),
            const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ],
        ),
        const SpaceView(),
        Table(
          textDirection: TextDirection.ltr,
          children: [
            TableRow(
                children: days
                    .map(
                      (e) => InkWell(
                        onTap: () {},
                        child: Center(
                          child: KText(
                            text: e,
                            textStyle: KTextStyles.textStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                    .toList()),
          ],
        )
      ],
    );
  }
}
