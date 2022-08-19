import 'package:thukha/model/item.dart';

import '../model/order.dart';
import '../model/shop.dart';

const popShop = "https://images-platform.99static.com//YJQkKp22e8n0PHJlYbCvpH1pElc=/130x64:936x870/fit-in/590x590/99designs-contests-attachments/93/93135/attachment_93135953";
const skuProfit = "https://images-platform.99static.com//7nSmR0ty6OpJURaZb9AVBoPzMnk=/360x114:860x614/fit-in/500x500/99designs-contests-attachments/57/57021/attachment_57021024";
const manyAndMe = "https://images-platform.99static.com//4ycuXrwyFwnAszAH7gp1Tv-Di8k=/121x102:1374x1355/fit-in/500x500/99designs-contests-attachments/109/109130/attachment_109130494";
const shopStar = "https://images-platform.99static.com//Fq4T2G3Hev2aZK5JtRQQ6-1xf0c=/204x2204:1599x3599/fit-in/500x500/99designs-contests-attachments/72/72894/attachment_72894672";
const finerHund = "https://images-platform.99static.com//iV7JTEDk353Q0wgunwNYXYiw7UQ=/241x245:792x796/fit-in/500x500/99designs-contests-attachments/91/91553/attachment_91553593";


final List<Shop> shopList = [
  Shop(
    id: "1", 
    name: "Pop Shop", 
    image: popShop,
    ),
  Shop(
    id: "2", 
    name: "SKU Profit ", 
    image: skuProfit,
    ),
  Shop(
    id: "3", 
    name: "Many & Me", 
    image: manyAndMe,
    ),
  Shop(
    id: "4", 
    name: "Shop Star", 
    image: shopStar,
    ),
  Shop(
    id: "1", 
    name: "Finer Hund", 
    image: finerHund,
    ),
];

List<Order> mockOrderList = List.generate(
  2, (index){
    return Order(
    id: "$index", 
    itemsList: List.generate(3, (index){
      return Item(
        id: "$index", 
        name: "Medicine $index", 
        count: "${index + 1}",
        dateTime: DateTime.now().toString(),
      );
    }), 
    ownerID: "$index", 
    dateTime: DateTime.now(),
    );
  },
  );