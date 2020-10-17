import 'package:flutter/material.dart';
import 'package:hardware/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodaysDealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Today's deals",
        ),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: () async {
          FirebaseAuth auth = FirebaseAuth.instance;
          FirebaseUser user = await auth.currentUser();
          String uid = user.uid.toString();
          return uid;
        }(),
        builder: (ctx, futuresnapshot) {
          if (futuresnapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          return StreamBuilder(
              stream: Firestore.instance
                  .collection('home/${futuresnapshot.data}/today_deal')
                  .snapshots(),
              builder: (ctx, chatsnaphot) {
                if (chatsnaphot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                final chatdocs = chatsnaphot.data.documents;
                return ListView.builder(
                  itemCount: chatdocs.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        color: Colors.grey[200],
                        height: 50,
                        width: double.infinity,
                        child: Text(
                          chatdocs[index]['name'],
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/Home_screen');
                            },
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    chatdocs[index]['image1'],
                                    height: 170,
                                    width: 170,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    bottom: 20,
                                    right: 10,
                                    left: 10,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 160,
                                      color: Colors.black54,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        chatdocs[index]['name1'],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 26),
                                        overflow: TextOverflow.fade,
                                        softWrap: true,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                              height: 200,
                              width: 1,
                              child: VerticalDivider(color: Colors.grey)),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/Home_screen');
                            },
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    chatdocs[index]['image2'],
                                    height: 170,
                                    width: 170,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    bottom: 20,
                                    right: 10,
                                    left: 10,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 160,
                                      color: Colors.black54,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        chatdocs[index]['name2'],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 26),
                                        overflow: TextOverflow.fade,
                                        softWrap: true,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/Home_screen');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.grey[200],
                          height: 50,
                          width: double.infinity,
                          child: Text(
                            'show more list    > > >',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,color: Colors.black,
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
