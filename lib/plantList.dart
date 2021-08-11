import 'package:flutter/material.dart';
// import 'package:internship_app/main.dart';

// void main() {
//   runApp(
    // plantList(
    //   items: List<ListItem>.generate(
    //     1000, 
        
    //     // ignore: unrelated_type_equality_checks
    //     (i) => i<0 && i>105 == 0 
    //     ?HeadingItem(readData(documentId))
    //     //     ? HeadingItem('Heading $i')
    //     //     : MessageItem('Sender $i', 'Message body $i'),
    //   ),
    // ),
//   );
// }

// ignore: camel_case_types
class plantList extends StatelessWidget {
  final List<ListItem> items;

  const plantList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const title = 'Mixed List';

    return Scaffold(
      // title: title,
   
        // appBar: AppBar(
        //   // title: const Text(title),
        // ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
      );
  
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class BodyItem implements ListItem {
  // final String sender;
  final String body;

  BodyItem(this.body);

  @override
  // Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);

  @override
  Widget buildTitle(BuildContext context) {
    // ignore: todo
    // TODO: implement buildTitle
    throw UnimplementedError();
  }
}