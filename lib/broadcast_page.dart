import 'package:flutter/material.dart';
import 'package:flutter_lesson_4/change_cur.dart';
import 'currency.dart';
import 'web_socket.dart';

class BroadcastPage extends StatelessWidget {
  WebSocket ws = WebSocket();
  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.headline1;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: StreamBuilder(
            stream: ws.getStream(),
            builder: (context, snapshot) {
              print("Snapshot:::");
              print(snapshot.data);
              Currency cur = snapshot.data ?? Currency.empty();
              return Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: GestureDetector(
                  onTap: () async {
                    Modal.mainBottomSheet(context,ws);
                  },
                  child: CurrencyCard(
                    style: style,
                    currency: cur,
                  ),
                ),
              ));
            }));
  }
}

class CurrencyCard extends StatelessWidget {
  final Currency currency;
  final TextStyle style;

  const CurrencyCard({Key key, this.currency, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 100,
                  child: Center(child: Text(currency.from, style: style))),
              Icon(
                Icons.arrow_forward,
                color: style.color,
                size: style.fontSize,
              ),
              Container(
                  width: 100,
                  child: Center(child: Text(currency.to, style: style))),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: currency.rised ? Colors.green : Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(
                  // currency.price.toStringAsFixed(2) + "\$",
                  currency.price.toStringAsFixed(2) + '\$',
                  style: style),
            ),
          )
        ],
      ),
    );
  }
}
