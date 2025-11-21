class CourseModel{
  final String? id;
  final String? courseCode;
  final String name;
  final String symbol;
  final String description;

  CourseModel({
    this.id, 
    this.courseCode, 
    required this.name, 
    required this.symbol, 
    required this.description,
  });

  factory CourseModel.fromMap(Map<String, dynamic> map){
    return CourseModel(
      id: map['id']??'', 
      courseCode: map['courseCode']??'',
      name: map['name']??'',
      symbol: map['symbol']??'', 
      description: map['description']??'',
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'courseCode': courseCode,
      'name': name,
      'symbol': symbol,
      'description': description,
    };
  }
}