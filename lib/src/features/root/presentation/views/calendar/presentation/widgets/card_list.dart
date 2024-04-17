import 'package:flutter/cupertino.dart';
import '../../data/models/remote/month_temp/month_temp_model.dart';
import 'card.dart';

class CardList extends StatelessWidget {
  final MonthTempModel tempModel;
  const CardList({super.key, required this.tempModel});

  @override
  Widget build(BuildContext context) {
    List<ListElement> list = tempModel.list ?? [];
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return CardTemp(element: list[index], country: tempModel.city?.name ?? "");
      },
    );
  }
}
