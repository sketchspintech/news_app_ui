import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade400, blurRadius: 5.0),
                ],
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(backgroundColor: Colors.red, radius: 35.0),
                  SizedBox(width: 20.0),
                  Text(
                    'Laravel News App',
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 25.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade400, blurRadius: 5.0),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.info_outline,
                    size: 50.0,
                    color: Colors.grey,
                  ),
                  VerticalDivider(
                    thickness: 1.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Version',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22.0),
                      ),
                      Text(
                        '1.0.0',
                        style: TextStyle(color: Colors.grey, fontSize: 17.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade400, blurRadius: 5.0),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: 50.0,
                    color: Colors.grey,
                  ),
                  VerticalDivider(
                    thickness: 1.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Company',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22.0),
                      ),
                      Text(
                        'Company',
                        style: TextStyle(color: Colors.grey, fontSize: 17.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade400, blurRadius: 5.0),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.mail,
                    size: 50.0,
                    color: Colors.grey,
                  ),
                  VerticalDivider(
                    thickness: 1.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22.0),
                      ),
                      Text(
                        'test@test.com',
                        style: TextStyle(color: Colors.grey, fontSize: 17.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade400, blurRadius: 5.0),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.web,
                    size: 50.0,
                    color: Colors.grey,
                  ),
                  VerticalDivider(
                    thickness: 1.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Website',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22.0),
                      ),
                      Text(
                        'www.testtest.com',
                        style: TextStyle(color: Colors.grey, fontSize: 17.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade400, blurRadius: 5.0),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    size: 50.0,
                    color: Colors.grey,
                  ),
                  VerticalDivider(
                    thickness: 1.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Contact',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22.0),
                      ),
                      Text(
                        '+94 774536974',
                        style: TextStyle(color: Colors.grey, fontSize: 17.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade400, blurRadius: 5.0),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Version',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22.0),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'htrhtr trytryrt rejt rejekw jfkelwj kjfakewjrtu kjfkl jfkldsj fktiwerj rkldkfls jfkewjrf keldklsjf kds fkldjfgkjd vncmvnre fdsndskjheowj kl djwqopr enfdksadnfdkjmshjro kjsnmfndsmfnewkj kjdsnf dsm ncvdmsfnewj fjk klamd,sncdkjwrhjf jkwncsmd nfskjr kjewndskmjn fd,smm d,sfneiowj kjnmdnf nkmdnnmn fmdsnf',
                          style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
