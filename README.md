- [creating variables in dart](#variables)
- [ flutter stateless widget ](#stl)
- [basic helloworld code](#hello)
## variables
```
// ways to declare variales in darrt 
 int days = 30;
 String name = "aashir";
 double pi = 3.14;awan
 bool ismale = true;
 var day = "tuesday"; // dynamic data type (var) we can assign it string/num
 // we can declare constants whose values donot change
 const pi = 3.14;
 final int days = 30; // we can variable a final variable whose value doesn't change throughout program
```
## stl
write stl and press enter then IDE will generate a stateless widget here replace  widget name with your your app name in both (class and constructor)
### build 
@override 
widget build(BuildContext context){
....
}
This is very important because all ui is written under build 
## hello
```
void main() {        //we have to declare function on starting of dart program
  print('Hello, World!');  //same as python just an addition of semicolon(;)
}
```
