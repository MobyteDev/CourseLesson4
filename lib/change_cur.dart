import 'package:flutter/material.dart';
import 'package:flutter_lesson_4/web_socket.dart';

class Modal {
  static mainBottomSheet(BuildContext context, WebSocket ws) {
    CurrencyType item;

    return showBottomSheet(
        backgroundColor: Theme.of(context).backgroundColor,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                      diameterRatio: 1.5,
                      itemExtent: 40,
                      useMagnifier: true,
                      magnification: 1.5,
                      onSelectedItemChanged: (index) {
                        item = CurrencyType.values[index];
                        print(item);
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                          childCount: CurrencyType.values.length,
                          builder: (context, index) {
                            return Center(
                              child: Text(
                                  WebSocket
                                      .currencyName[CurrencyType.values[index]],
                                  style: Theme.of(context).textTheme.headline1),
                            );
                          })),
                ),
                GestureDetector(
                  onTap: () {
                    ws.reSub(item);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        child: Text(
                      "Изменить",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
