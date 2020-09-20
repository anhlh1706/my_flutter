import 'dart:async';

void main(List<String> arguments) {
  trySomething();
}

void trySomething() {
  // for (var i = 0; i < 4; i++) {
  //   print(i);
  // }
  var per = Person('boy', 22);
  print(per.name);
  print(per.age);

  // per.setName('Some name');
  print(per.getName);
  per.setName = 'Another name';
  print(per.getName);
}

String greeting(String name, [int age]) =>
    'Hi ${name} ${age ?? ""}'; // age now optional

class Person {
  String name;
  int age = 22;

  Person(this.name, this.age);

  String get getName => name;
  set setName(String value) => name = value;
}
