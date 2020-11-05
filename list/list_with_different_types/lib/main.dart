import 'package:flutter/material.dart';

abstract class ListItem{
    Widget buildTitle(BuildContext context);

    Widget buildSubTitle(BuildContext context);
}

class HeadingItem implements ListItem{
    final String heading;

    HeadingItem(this.heading);

    Widget buildTitle(BuildContext context) {
        return Text(heading, style: Theme.of(context).textTheme.headline5);
    }

    Widget buildSubTitle(BuildContext context) => null;
}

class MessageItem implements ListItem {
    
    final String sender;
    final String body;
    
    MessageItem(this.sender, this.body);

    Widget buildTitle(BuildContext context) => Text(sender);

    Widget buildSubTitle(BuildContext context) => Text(body);
}

void main(){
       runApp( MyApp(
            items: List<ListItem>.generate(
                    1000,
                    (i) => i % 6 == 0 ? HeadingItem("HeadingItem $i") : MessageItem("Sender $i", "Message $i") 
            )
    ));
}

class MyApp extends StatelessWidget {
    
    final List<ListItem> items;

    MyApp({Key key, @required this.items }) : super(key: key);

    @override
    Widget build(BuildContext context){
        final title = 'Mixed List';

        return MaterialApp(
                title: title,
                home: Scaffold(
                        appBar: AppBar(

                                title: Text(title),
                        ),
                        body: ListView.builder(
                                itemCount: items.length,
                                itemBuilder: (context, index){
                                    final item = items[index];

                                    return ListTile(
                                            title: item.buildTitle(context),
                                            subtitle: item.buildSubTitle(context),
                                    );
                                },
                        ),
                ),
        );
    }
}
