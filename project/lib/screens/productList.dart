import 'package:ecommerce/widgets/productListRow.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product List",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _buildProductListPage(),
    );
  }

  _buildProductListPage() {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) {
          if (i == 0) {
            return _buildFilterWidgets(screenSize);
          } else if (i == 4) {
            return SizedBox(
              height: 12,
            );
          } else {
            return _buildProductListRow(screenSize);
          }
        },
      ),
    );
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: EdgeInsets.all(12),
      width: screenSize.width,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFilterButton("Sort"),
              Container(
                color: Colors.black,
                width: 2,
                height: 24,
              ),
              _buildFilterButton("Filter"),
            ],
          ),
        ),
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: (){
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(Icons.arrow_drop_down, color: Colors.black),
          SizedBox(
            width: 2,
          ),
          Text(title)
        ],
      ),
    );
  }

  _buildProductListRow(Size screenSize) {
    return ProductListRow(
      name: "T-shirt",
      price: 150,
      imageUrl:
          "https://3.imimg.com/data3/BK/SS/MY-12397826/polo-t-shirt-500x500.jpg",
    );
  }
}
