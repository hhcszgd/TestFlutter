
///异步操作,需要导入官方库
///await关键字只有在有标记async标识的时候才会生效
import 'dart:async';

main(List<String> args){

    // testBaseSyntaxOfDart(1, "xxxx");
    // print(hasParaName(para1: 3 , para2: 4));
    // try {
    //   control(9, 0);
    // }on IntegerDivisionByZeroException{
    //   print("para2 can not be 0");
    // }catch  (error ){
    //   print(error);
    // }

    // circle();
    testEpisode();
}

////////函数的声明/////////
// returnType  methodName( para1Type para1 , para2Type para2) {
  
// }
int hasParaName({int para1 , int para2}) {//返回值类型可以省略,因为编辑器会自动推到
  return para1 + para2 ;
}
// 返回值类型可以省略,如下,因为编辑器会自动推倒
// hasParaName({int para1 , int para2}) {
//   return para1 + para2 ;
// }
//当代码块只有一行代码时 , 还可以进一步省略
// hasParaName({int para1 , int para2}) => para1 + para2 ;


void testBaseSyntaxOfDart(int para1 , String para2) {//没有参数名称
    ///变量的声明
  const para1 = "name";//常量
  print("hello");
  final para2 = "name";//常量
  String  para3 = "name";//变量
  var para4 = "name";//变量


  ///基本数据类型
  ///1值类型
  ///int , double ,bool
  int i = 10;
  double d = 2.2;
  bool b = true ;
  ///2集合类型
  ///List , Set , Map 
  List<int> numbers = [1 , 2 , 3, 4 ];
  Set<int> numberSet = {1,3,4,5};
  Map<int,String> mm = {1 : "one" , 2 : "two" , 3 : "three"};

  /// 集合的常用操作
  /// 1,list
    numbers.isEmpty;
    numbers.length;
    numbers.first;
    print(numbers[0]);
    numbers.add(5);
    numbers.removeAt(0);
    print(numbers.length);
  ///2set
    numbers.length;
    numberSet.isEmpty;
    numberSet.add(7);
    numberSet.remove(1);
    var isContain = numberSet.contains(2);
    print(isContain);
    print(numberSet.first);

  
  ///3 map
    mm.isEmpty;
    print(mm[1]);
    mm.entries;//获取所有的键值对
    mm.keys;//获取所有的键
    mm.values;//获取所有的值
    print(mm.entries);
    mm.containsKey(1);
    mm.containsValue("four");
    mm.entries;
    mm.remove(2);
}

///控制语句
double control(int x , int y ) {
  if( y == 0 ){
    throw new IntegerDivisionByZeroException();
  }else{
    return x/y;
  }
}
///循环
circle(){
  var nums = [1,2,3,4,5,6,7,8];
  for(var i = 1 ; i < nums.length ; i++){
    print(i);
  }

  for (var i  in nums) {
    print(i);
  }
}

///面向对象
// 1 创建对象     
 void testEpisode() {
   var episode = Episode(title: "hell world");
   var episode2 = Episode.createObj(22, "tttttt");
   var episode3 = episode2;//浅拷贝
   var episode4 = episode2.clone();//深拷贝,需自己定义
   print(episode.title);
   print(episode2.title);
 }
class Episode { 
  int duration;  
  String title;
  // Episode(int duration , String title)
  // {
  //   this.title = title;
  //   this.duration = duration ;
  // }
  Episode({this.duration = 0 , this.title = ""} );//自动属性赋值,功能同上
  //dart 构造函数不能重载,只能有一个 , 但可以通过工厂方法来替代构造函数,但不能提供默认值,如下
  Episode.createObj(this.duration,this.title);

  //实现深拷贝
  Episode clone() => Episode(title:title , duration: duration);

  //dart没有析构函数 , 采用 运行时 自动垃圾回收机制 
}
// class Movie implements Episode{//implements相当于把Episode当做一个抽象类,必须实现其所有的属性和方法,尽管Episode是一个正常类而不是一个抽象类
//实现所有属性和方法
// }
class SubEpisode extends Episode//继承
{
  String codeType;
  SubEpisode(String codeType , int duration , String title) : super(duration: duration,title: title){
    this.codeType = codeType;
  }

  SubEpisode.otherCreateMethod(): this("mp4" , 33 , "you know");
///重写父类方法
  @override
  SubEpisode clone() => SubEpisode("mp5" , 44 , "you really know");

}

abstract class DeepCopy<T> {//相当于swift的protocol协议
  T clone();
}
class AAA implements DeepCopy<AAA>{
  @override
  clone() {
    // TODO: implement clone
    return this;
  }
}
