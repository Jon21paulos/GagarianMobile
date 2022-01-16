import 'package:flutter/material.dart';
import 'package:gagarian_mobile/Store/badge_incrementer.dart';
import 'package:gagarian_mobile/Store/fetch_catagories.dart';
import 'package:gagarian_mobile/Store/fetch_item.dart';
import 'package:provider/provider.dart';

import 'addto_shopingcart.dart';

class CustomCatagories extends StatefulWidget {
  CustomCatagories(  {Key? key}) : super(key: key);

  @override
  State<CustomCatagories> createState() => _CustomCatagoriesState();
}

class _CustomCatagoriesState extends State<CustomCatagories> {
  @override
  void initState() {
    context.read<FetchCatagories>().fetchCatagories;
    context.read<FetchItem>().fetchItems("products");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.blue,
      onRefresh: () async {
        context.read<FetchCatagories>().initialValues();
        context.read<FetchCatagories>().fetchCatagories;
        context.read<FetchItem>().fetchItems("products");
        context.read<BadgeIncrementer>().initialValue();
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 150,
              child: Consumer<FetchCatagories>(
                  builder: (context,value,child){
                    return value.catagories.isEmpty? const Center(
                      child: CircularProgressIndicator(
                        valueColor:AlwaysStoppedAnimation<Color>(Colors.orange),
                      ),
                    ):
                    ListView.builder(
                      itemCount: value.catagories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: (){
                            context.read<FetchItem>().fetchItems("itemsbycategory/"+value.catagories[index].id.toString());
                            context.read<FetchItem>().initialValues();
                          },
                          child: Column(
                            children: [
                              Image.network("https://media.springernature.com/full/springer-cms/rest/v1/img/18893370/v1/height/320"),
                              // Image.network("https://gagarianrest.herokuapp.com"+value.catagories[index].image.toString()),
                              Text(
                                value.catagories[index].name.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ),
            Flexible(
              child: Consumer<FetchItem>(
                builder: (context,value,child){
                  return value.items.isEmpty&&context.read<FetchCatagories>().catagories.isNotEmpty?  Column(
                    children: const [
                      CircularProgressIndicator(
                        valueColor:AlwaysStoppedAnimation<Color>(Colors.orange),
                      ),
                      SizedBox(height: 400,)
                    ],
                  ):
                  ListView.builder(
                    itemCount: value.items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: (){
                        print(value.items[index].image2);
                      },
                      child: Card(
                        color: Colors.white70,
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Text(value.items[index].name.toString()
                                    ,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                  Text(value.items[index].slug.toString()
                                    ,style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Image.network("https://media.springernature.com/full/springer-cms/rest/v1/content/18927786/data/v1",
                                    width: 100,
                                    height: 100,
                                  ),
                                  SizedBox(width: 10,),
                                  Image.network("https://media.springernature.com/full/springer-cms/rest/v1/content/18927786/data/v1",
                                    width: 100,
                                    height: 100,
                                  ),
                                  SizedBox(width: 10,),
                                  Image.network("https://media.springernature.com/full/springer-cms/rest/v1/content/18927786/data/v1",
                                    width: 100,
                                    height: 100,
                                  ),

                                  const SizedBox(width: 20),

                                ],
                              ),
                              Column(
                                children: [

                                  Text(value.items[index].description.toString()
                                    ,style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text("price " + value.items[index].price.toString()
                                    ,style: TextStyle(fontSize: 15),
                                  ),
                                  Text("# " + value.items[index].tag.toString()
                                    ,style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              customAddButtom(context)
                            ],
                          ),

                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
            // SizedBox(height: 400,)
          ],
        ),
      ),
    );
  }
}
