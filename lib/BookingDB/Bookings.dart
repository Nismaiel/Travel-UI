class Bookingdb {
  int id;
  String name;
  int price;
  String image;
  String start;
  String end;
  int rate;


  Bookingdb({this.name, this.id, this.price, this.image,this.start,this.end,this.rate});


  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'start':start,
      'end':end,
      'rate':rate,
    };
    return map;
  }

  Bookingdb.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    price = map['price'];
    image = map['image'];
    start=map['start'];
    end=map['end'];
    rate=map['rate'];
  }
}
