import 'package:flutter/material.dart';

class CartandListtileUsage extends StatelessWidget {
  const CartandListtileUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart and Listtile"),
      ),
      body: Center(
        child: listViewUsage(),
      ),
    );
  }

  //list view farklı türde elemanlar alır SingeChilsScrollView almaz. tek farkları budur. çalışma mantıkları aynıdır.

  ListView listViewUsage() {
    return ListView(
      children: [
        Column(
          children: [
            singleElementList(),
            singleElementList(),
            singleElementList(),
            singleElementList(),
            singleElementList(),
            singleElementList(),
            singleElementList(),
            singleElementList(),
          ],
        ),
        Text("Hello"),
        ElevatedButton(onPressed: () {}, child: Text("Button"))
      ],
    );
  }

  SingleChildScrollView singleChildScrollViewUsage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          singleElementList(),
          singleElementList(),
          singleElementList(),
          singleElementList(),
          singleElementList(),
          singleElementList(),
          singleElementList(),
          singleElementList(),
        ],
      ),
    );
  }

  Column singleElementList() {
    return Column(
      children: [
        Card(
          color: Colors.blue[100],
          shadowColor: Colors.red,
          elevation: 17,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.add)),
            title: Text("başlık kısmı"),
            subtitle: Text("alt başlık kısmı"),
            trailing: Icon(Icons.real_estate_agent),
          ),
        ),
        Divider(
          color: Colors.red,
          thickness: 1,
          height: 30,
          //indent ve endindent çizginin sağdan ve soldan uzunluğunu kısaltmamıza yarar
          indent: 50,
          endIndent: 60,
        )
      ],
    );
  }
}
