import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListviewUsage extends StatelessWidget {
  ListviewUsage({Key? key}) : super(key: key);

  List<Student> allStudents = List.generate(
      500,
      (index) => Student(index + 1, "Student name : ${index + 1}",
          "Student surname : ${index + 1}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
      ),
      body: listviewSepareted(),
    );
  }

  ListView listviewSepareted() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        //çizdiğimiz çizgileri 1.elemandan değil 4. elemandan başlarmasın için aşağıdaki satırı yazdık
        var yeniIndex = index + 1;
        if (yeniIndex % 4 == 0) {
          return Divider(
            thickness: 2,
            color: Colors.teal,
          );
        }
        return SizedBox();
      },
      itemBuilder: (BuildContext context, int index) {
        var currentStudent = allStudents[index];
        return Card(
          color: index % 2 == 0 ? Colors.orange[100] : Colors.purple[100],
          child: ListTile(
            onTap: () {
              print("elaman tıklandı : ${index}");
              EasyLoading.showToast("${index + 1}. element clicked",
                  duration: Duration(seconds: 1),
                  dismissOnTap: true,
                  toastPosition: EasyLoadingToastPosition.bottom);
            },
            title: Text(currentStudent.name),
            subtitle: Text(currentStudent.surname),
            leading: CircleAvatar(
              child: Text(currentStudent.id.toString()),
            ),
          ),
        );
      },
      itemCount: allStudents.length,
    );
  }

  ListView listviewBuilder() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var currentStudent = allStudents[index];
        return Card(
          color: index % 2 == 0 ? Colors.orange[100] : Colors.purple[100],
          child: ListTile(
            onTap: () {
              print("elaman tıklandı : ${index}");
            },
            title: Text(currentStudent.name),
            subtitle: Text(currentStudent.surname),
            leading: CircleAvatar(
              child: Text(currentStudent.id.toString()),
            ),
          ),
        );
      },
      itemCount: allStudents.length,
    );
  }

  ListView classicListview() {
    return ListView(
      children: allStudents
          .map(
            (Student std) => ListTile(
              title: Text(std.name),
              subtitle: Text(std.surname),
              leading: CircleAvatar(
                child: Text(std.id.toString()),
              ),
            ),
          )
          .toList(),
    );
  }
}

class Student {
  final int id;
  final String name;
  final String surname;

  Student(this.id, this.name, this.surname);
}
