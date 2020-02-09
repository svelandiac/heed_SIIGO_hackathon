import 'package:flutter/material.dart';

class ProductsSummaryWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Cantidad de productos:'),
              Spacer(),
              Text('92')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: <Widget>[
              Text('Producto más barato:'),
              Spacer(),
              Text('\$6.500',)
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: <Widget>[
              Text('Producto más costoso:'),
              Spacer(),
              Text('\$62.700', overflow: TextOverflow.ellipsis,)
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: <Widget>[
              Text('Promedio precios:'),
              Spacer(),
              Text('\$45.221')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: <Widget>[
              Text('Total ventas 7 días:'),
              Spacer(),
              Text('\$2\'577.800')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: <Widget>[
              Text('Total ventas 30 días:'),
              Spacer(),
              Text('\$65\'647.100')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: <Widget>[
              Text('Total impuestos 7 dias:'),
              Spacer(),
              Text('\$523.150')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: <Widget>[
              Text('Total impuestos 30 dias:'),
              Spacer(),
              Text('\$3\'865.900')
            ],
          ),
        ],
      ),
    );
  }
}