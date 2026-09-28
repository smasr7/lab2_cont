//5.2

double area(double r){
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
void myLLM(){}

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
      List<String>emails = ["a.sobirjonov@newuu.uz",];
      if (email.isEmpty) throw ArgumentError('Email cannot be empty');
      
      if (emails.contains(email)){
          return true;
      }

      return false;
  }

}

//6.2 and 6.3
class Person{
    String name;
    int age;

    // this one is the default constructor which is asked in the second question
    //Person(this.name, this.age);
    Person(String name, int age)
      :assert(age >= 0 && age <= 120, 'Age should be between 0 and 120'),
          name = NonEmpty(name),
          age = age;

    static String NonEmpty(String s){
        if (s.isEmpty) {
            throw ArgumentError('Name musnt be empty');
        }
        return s;
    }
}

//6.5
class Scoreboard{
    double _score;
    String name;

    Scoreboard(this._score, this.name);

    double get score => _score;

    set score(double s){
      if (s < 0){
        throw ArgumentError("Score cant be negative");
      }

      _score = s;

    }

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

//7.4

void main(){
    print(area(5));
    var p = Person('Asad', 20);
    print('${p.name}, ${p.age}');  

    for (final day in Day.values){
      print('${day.name}');
    }
}

