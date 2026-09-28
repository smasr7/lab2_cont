//5.2

double area(double r) {
  //We want to find an area of a circle.
  //Area eqeauls r * r * pi

  /*  So first we calculate the r squared.
      then we multiply pi value which is 3.14.
    */

  return r * r * 3.14;
}

//5.4
/// **How to build your own LLM**
///
/// What you need:
///   *'money'*
///   *'knowledge'*
///
void myLLM() {}

//5.3
class IValidate {
  IValidate._();

  /// Checks whether [email] exists or not.
  ///
  /// Parameters [email] mustnt be null
  ///
  /// Returns true if email doesnt exist in the list
  ///
  /// Generates an error if email is empty

  static bool existingEmail(String email) {
    List<String> emails = ["a.sobirjonov@newuu.uz"];
    if (email.isEmpty) throw ArgumentError('Email cannot be empty');

    if (emails.contains(email)) {
      return true;
    }

    return false;
  }
}

//5.5
class OldCalculator {
  /// Adds two numbers.
  ///
  /// This one is old, please use [sum] instead.
  @deprecated
  int add(int a, int b) => a + b;

  /// Adds two numbers the new way.
  int sum(int a, int b) => a + b;

  /// Gives the name of this class as a string.
  @override
  String toString() => 'OldCalculator';
}

//5.6
/// Converts temperature between Celsius and Fahrenheit.
///
/// Example:
/// ```dart
/// var c = TemperatureConverter();
/// c.toFahrenheit(100); // 212.0
/// ```
class TemperatureConverter {
  /// Converts [celsius] to Fahrenheit.
  ///
  /// Returns the temperature in Fahrenheit.
  double toFahrenheit(double celsius) => celsius * 9 / 5 + 32;

  /// Converts [fahrenheit] to Celsius.
  ///
  /// Returns the temperature in Celsius.
  double toCelsius(double fahrenheit) => (fahrenheit - 32) * 5 / 9;
}

//6.2 and 6.3
class Person {
  String name;
  int age;

  // this one is the default constructor which is asked in the second question
  //Person(this.name, this.age);
  Person(String name, int age)
    : assert(age >= 0 && age <= 120, 'Age should be between 0 and 120'),
      name = NonEmpty(name),
      age = age;

  static String NonEmpty(String s) {
    if (s.isEmpty) {
      throw ArgumentError('Name musnt be empty');
    }
    return s;
  }
}

//6.5
class Scoreboard {
  double _score;
  String name;

  Scoreboard(this._score, this.name);

  double get score => _score;

  set score(double s) {
    if (s < 0) {
      throw ArgumentError("Score cant be negative");
    }

    _score = s;
  }
}

//6.4
class AppSettings {
  // static final is made only one time (when first used), so we always have one object
  // dart isolates dont share memory so its safe from threads problem
  static final AppSettings _instance = AppSettings._internal();

  String language = 'uz';

  // private constructor, nobody outside can make a new one
  AppSettings._internal();

  // this always gives back the same object
  factory AppSettings() => _instance;
}

//6.6
class UserDto {
  final String name;
  final int id;

  // const + final means the object cant change after its created
  const UserDto(this.name, this.id);
}

//7.2
enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

//7.3
String dayLabel(Day day) => switch (day) {
  Day.monday => 'Mon',
  Day.tuesday => 'Tue',
  Day.wednesday => 'Wed',
  Day.thursday => 'Thu',
  Day.friday => 'Fri',
  Day.saturday || Day.sunday => 'Ura, dam olish',
};

//7.4 (enum with interface)
abstract class Describable {
  String describe();
}

enum CupSize implements Describable {
  small(200),
  medium(300),
  large(400);

  final int ml;
  const CupSize(this.ml);

  @override
  String describe() => '$name cup holds $ml ml';

  // computed value, ml to liters
  double get liters => ml / 1000;
}

//7.5
// byName throws ArgumentError if the name is wrong, so we catch it and give null
Day? parseDay(String s) {
  try {
    return Day.values.byName(s);
  } on ArgumentError {
    return null;
  }
}

//7.7
enum TrafficLight {
  red,
  green,
  yellow;

  // every state knows which one is next
  TrafficLight get next => switch (this) {
    TrafficLight.red => TrafficLight.green,
    TrafficLight.green => TrafficLight.yellow,
    TrafficLight.yellow => TrafficLight.red,
  };
}

//8.2
class Animal {
  void makeSound() => print('Some animal sound');
}

class Dog extends Animal {
  @override
  void makeSound() => print('Woof woof');
}

//8.3
class Machine {
  final String brand;
  Machine(this.brand);
}

class Robot extends Machine {
  final int power;

  // super.brand sends brand to the parent directly, no need for : super(brand)
  Robot(super.brand, this.power);
}

//8.4
class Shape {
  String name;
  Shape(this.name);

  double area() => 0;
}

class Polygon extends Shape {
  int sides;
  Polygon(super.name, this.sides);
}

class Triangle extends Polygon {
  double base, height;
  Triangle(this.base, this.height) : super('Triangle', 3);

  @override
  double area() => 0.5 * base * height;
}

//8.5
abstract class Employee {
  String name;
  Employee(this.name);

  // every child MUST write this one
  double salary();

  // this one is ready, children can just use it
  void info() => print('$name gets ${salary()}');
}

class Manager extends Employee {
  Manager(super.name);

  @override
  double salary() => 5000;
}

class Intern extends Employee {
  Intern(super.name);

  @override
  double salary() => 800;
}

//8.6
// final class: nobody outside this file can extend or implement it
final class SecretKey {
  final String value;
  SecretKey(this.value);
}

// base class: outside this file it can be extended but not implemented
// (inside the same file dart allows everything, so the error shows only from another file)
base class Account {
  void open() => print('Account opened');
}

//9.2
abstract interface class DBConnector {
  void connect();
  void close();
}

class MySQLConnector implements DBConnector {
  @override
  void connect() => print('Connected to MySQL');

  @override
  void close() => print('MySQL connection closed');
}

//9.3
mixin Flyable {
  void fly() => print('Flying in the sky');
}

class Bird with Flyable {}

//9.4
mixin Walker {
  void walk() => print('Walking');
}

mixin Swimmer {
  void swim() => print('Swimming');
}

class Duck with Walker, Swimmer, Flyable {}

//9.5
// on Animal means only Animal (or its children) can use this mixin
mixin Barker on Animal {
  void barkTwice() {
    makeSound();
    makeSound();
  }
}

class LoudDog extends Dog with Barker {}

//9.6
class Logger {
  void log(String msg) => print('LOG: $msg');
}

// implements: we only take the shape, so we must write log() by ourself
class FileLogger implements Logger {
  @override
  void log(String msg) => print('FILE: $msg');
}

mixin LoggerMixin {
  void log(String msg) => print('MIXIN LOG: $msg');
}

// with: we take the real code, no need to write it again
class Service with LoggerMixin {}

//10.2
// Shape is from 8.4
class Circle extends Shape {
  double r;
  Circle(this.r) : super('Circle');

  @override
  double area() => r * r * 3.14;
}

class Rectangle extends Shape {
  double w, h;
  Rectangle(this.w, this.h) : super('Rectangle');

  @override
  double area() => w * h;
}

//10.3
void checkType(Object obj) {
  // is checks the type, and dart also promotes obj to that type inside the if
  if (obj is String) {
    print('String, length is ${obj.length}');
  } else if (obj is int) {
    print('int, doubled is ${obj * 2}');
  } else {
    print('Some other type');
  }
}

// as forces the type, it crashes if the type is wrong
Circle toCircle(Shape s) => s as Circle;

//10.4
class Repository<T> {
  final List<T> _items = [];

  void add(T item) => _items.add(item);

  List<T> getAll() => _items;

  int get count => _items.length;
}

//10.5
sealed class ApiResult {}

class Success extends ApiResult {
  final String data;
  Success(this.data);
}

class Failure extends ApiResult {
  final String message;
  Failure(this.message);
}

// no default case needed, compiler knows all the children of sealed class
String showResult(ApiResult r) => switch (r) {
  Success s => 'Got data: ${s.data}',
  Failure f => 'Error: ${f.message}',
};

//10.6
abstract class DiscountStrategy {
  double apply(double price);
}

class NoDiscount implements DiscountStrategy {
  @override
  double apply(double price) => price;
}

class TenPercentOff implements DiscountStrategy {
  @override
  double apply(double price) => price * 0.9;
}

class Cart {
  DiscountStrategy strategy;
  Cart(this.strategy);

  // cart doesnt care which strategy it is, it just calls apply
  double total(double price) => strategy.apply(price);
}

//11.2
Future<String> fetchUserData() async {
  // pretend we are asking a database
  await Future.delayed(const Duration(seconds: 2));
  return 'User: Asad, id 1024';
}

//11.3
Future<String> doTask(String name, int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
  return '$name finished';
}

Future<void> runAllTasks() async {
  // all three start together, so it takes around 3 sec not 6
  final results = await Future.wait([
    doTask('Task A', 1),
    doTask('Task B', 2),
    doTask('Task C', 3),
  ]);
  print(results.join(', '));
}

//11.4
void listenToTicks() {
  // take(5) cancels the subscription by itself after 5 emissions
  Stream.periodic(const Duration(seconds: 1), (i) => i + 1)
      .take(5)
      .listen(
        (tick) => print('Tick $tick'),
        onDone: () => print('Cancelled after 5 ticks'),
      );
}

//11.5
void transformStream() {
  Stream.fromIterable([1, 2, 2, 3, 4, 4, 5])
      .map((n) => n * 2) // double every number
      .where((n) => n > 4) // keep only the big ones
      .distinct() // remove same numbers that come one after another
      .listen((n) => print('Got $n'));
}

//11.6
Stream<int> riskyStream() async* {
  for (int i = 1; i <= 5; i++) {
    if (i == 3) throw Exception('Bad number $i');
    yield i;
  }
}

void handleStreamError() {
  riskyStream()
      .handleError((e) => print('Error handled: $e'))
      .listen((n) => print('Value $n'));
}

//12.2
int divide(int a, int b) {
  if (b == 0) throw UnsupportedError('Cannot divide by zero');
  return a ~/ b;
}

void safeDivide(int a, int b) {
  try {
    print('Result: ${divide(a, b)}');
  } on UnsupportedError catch (e) {
    print('Caught: $e');
  }
}

//12.3
void checkName(String? name) {
  if (name == null || name.isEmpty) {
    throw ArgumentError('Name cannot be null or empty');
  }
  print('Name is ok: $name');
}

//12.4
void riskyStuff(int type) {
  try {
    if (type == 1) throw FormatException('bad format');
    if (type == 2) throw ArgumentError('bad argument');
    throw Exception('something else');
  } on FormatException {
    print('format problem');
  } on ArgumentError catch (e) {
    print('argument problem: $e');
  } catch (e) {
    // everything else comes here
    print('generic problem: $e');
  }
}

//12.5
void showStackTrace() {
  try {
    checkName('');
  } catch (e, stackTrace) {
    print('Error: $e');
    print('Stack trace:\n$stackTrace');
  }
}

//12.6
void rethrowExample() {
  try {
    checkName(null);
  } catch (e) {
    print('Logging the error first: $e');
    rethrow; // sends the same error up to whoever called this
  }
}

// tests for all the new parts, call extraDemo() from main to run them
Future<void> extraDemo() async {
  // 5
  print(OldCalculator().sum(2, 3));
  print(TemperatureConverter().toFahrenheit(100));

  // 6
  print(AppSettings() == AppSettings());
  const u = UserDto('Asad', 1);
  print('${u.name}, ${u.id}');

  // 7
  print(CupSize.large.describe());
  print(parseDay('friday'));
  print(parseDay('funday'));
  print(TrafficLight.red.next);

  // 8
  Dog().makeSound();
  final robot = Robot('Boston', 90);
  print('${robot.brand}, ${robot.power}');
  print(Triangle(3, 4).area());
  Manager('Ali').info();
  Intern('Vali').info();

  // 9
  MySQLConnector().connect();
  Bird().fly();
  Duck()
    ..walk()
    ..swim()
    ..fly();
  LoudDog().barkTwice();
  FileLogger().log('hi');
  Service().log('hi');

  // 10
  final List<Shape> shapes = [Circle(2), Rectangle(3, 4)];
  for (final s in shapes) {
    print('${s.name}: ${s.area()}');
  }
  checkType('hello');
  checkType(21);
  checkType(3.5);
  print(toCircle(Circle(1)).r);
  final repo = Repository<String>();
  repo.add('one');
  repo.add('two');
  print('${repo.getAll()}, count: ${repo.count}');
  print(showResult(Success('data')));
  print(showResult(Failure('no internet')));
  print(Cart(TenPercentOff()).total(100));

  // 11
  print(await fetchUserData());
  await runAllTasks();
  transformStream();
  handleStreamError();
  listenToTicks();

  // 12
  safeDivide(10, 2);
  safeDivide(10, 0);
  try {
    checkName(null);
  } on ArgumentError catch (e) {
    print('Caught: $e');
  }
  riskyStuff(1);
  riskyStuff(2);
  riskyStuff(3);
  showStackTrace();
  try {
    rethrowExample();
  } catch (e) {
    print('Caught again in the caller: $e');
  }
}

//7.4

void main() {
  print(area(5));
  var p = Person('Asad', 20);
  print('${p.name}, ${p.age}');

  for (final day in Day.values) {
    print('${day.name}');
  }
}
