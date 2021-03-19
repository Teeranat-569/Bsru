import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
            backgroundColor: Colors.purple[50],
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back,color: Colors.purple,),
            ),
            title: Text('หลักสูตรที่เปิดสอน',style: TextStyle(color: Colors.purple),)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              Expanded(
                child: SingleChildScrollView(
                  child: ListTile(
                    title: Column(
                      children: [
                        ft1(),
                        ft2(),
                        ft3(),
                        ft4(),
                        ft5(),
                        ft6(),
                        ft7(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      
    );
  }

  Container ft1() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        backgroundColor: Colors.pink[50],
        title: Text(
          "คณะวิทยาศาสตร์และเทคโนโลยี",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/sci.png'),
          ),
          ExpansionTile(
            title: Text(
              "ระดับการศึกษา : ปริญญาตรี (4 ปี) ภาคปกติ",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            children: [
              ExpansionTile(
                title: Text(
                  "สาขาวิชาเกษตรศาสตร์",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: Text(
                      "สาขาวิชาเกษตรและเทคโนโลยีการเกษตร",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: website('http://site.bsru.ac.th/aat/'),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาวิชาเคมี (วท.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/%E0%B9%80%E0%B8%84%E0%B8%A1%E0%B8%B5-%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B8%AA%E0%B8%A1%E0%B9%80%E0%B8%94%E0%B9%87%E0%B8%88%E0%B8%AF-161816417244708/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/chem/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาวิชาชีววิทยา (วท.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/biologyBSRU/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/bio/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาวิชาวิทยาการคอมพิวเตอร์",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/ComputerScienceBsru/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/comsci/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาวิชาวิทยาศาสตร์ความปลอดภัย",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: Text(
                      "สาขาวิชาอาชีวอนามัยและความปลอดภัย",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: website('http://site.bsru.ac.th/ohs/'),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาวิชาวิทยาศาสตร์และเทคโนโลยีการอาหาร",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/FST.BSRU/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/foodsci/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาวิชาวิทยาศาสตร์สิ่งแวดล้อม",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/EnviBSRU/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://sci.bsru.ac.th/dept/env/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาการแพทย์แผนไทย",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/thaimedbsru/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/ttm/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาคณิตศาสตร์ (วท.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/profile.php?id=100022710410811',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/math/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขานวัตกรรมและเทคโนโลยีพอลิเมอร์",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/%E0%B8%99%E0%B8%A7%E0%B8%B1%E0%B8%95%E0%B8%81%E0%B8%A3%E0%B8%A3%E0%B8%A1%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B9%80%E0%B8%97%E0%B8%84%E0%B9%82%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%A2%E0%B8%B5%E0%B8%9E%E0%B8%AD%E0%B8%A5%E0%B8%B4%E0%B9%80%E0%B8%A1%E0%B8%AD%E0%B8%A3%E0%B9%8C-%E0%B9%80%E0%B8%84%E0%B8%A1%E0%B8%B5%E0%B8%AD%E0%B8%B8%E0%B8%95%E0%B8%AA%E0%B8%B2%E0%B8%AB%E0%B8%81%E0%B8%A3%E0%B8%A3%E0%B8%A1-BSRU-180869215354854/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/polymer/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาจุลชีววิทยา",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/microBSRU/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/micro/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาเทคนิคการแพทย์",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/medicalbsru', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/mt/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาเทคโนโลยีคอมพิวเตอร์อิเล็กทรอนิกส์",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/%E0%B8%AA%E0%B8%B2%E0%B8%82%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%8A%E0%B8%B2%E0%B9%80%E0%B8%97%E0%B8%84%E0%B9%82%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%A2%E0%B8%B5%E0%B8%84%E0%B8%AD%E0%B8%A1%E0%B8%9E%E0%B8%B4%E0%B8%A7%E0%B9%80%E0%B8%95%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B8%AD%E0%B8%B4%E0%B9%80%E0%B8%A5%E0%B9%87%E0%B8%81%E0%B8%97%E0%B8%A3%E0%B8%AD%E0%B8%99%E0%B8%B4%E0%B8%81%E0%B8%AA%E0%B9%8C-%E0%B8%A1%E0%B8%9A%E0%B8%AA-399248717157395/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/cet/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาเทคโนโลยีสารสนเทศและการสื่อสาร",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/ICTBSRU/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/ict/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาฟิสิกส์ (วท.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/%E0%B8%AA%E0%B8%B2%E0%B8%82%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%8A%E0%B8%B2%E0%B8%9F%E0%B8%B4%E0%B8%AA%E0%B8%B4%E0%B8%81%E0%B8%AA%E0%B9%8C-%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%97%E0%B8%A2%E0%B8%B2%E0%B8%A5%E0%B8%B1%E0%B8%A2%E0%B8%A3%E0%B8%B2%E0%B8%8A%E0%B8%A0%E0%B8%B1%E0%B8%8F%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B8%AA%E0%B8%A1%E0%B9%80%E0%B8%94%E0%B9%87%E0%B8%88%E0%B9%80%E0%B8%88%E0%B9%89%E0%B8%B2%E0%B8%9E%E0%B8%A3%E0%B8%B0%E0%B8%A2%E0%B8%B2-118597458858557/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/phy/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาสาธารณสุขศาสตร์",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/phbansomdej/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/ph/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาแอนิเมชั่นและดิจิทัลมีเดีย",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/BSRUAnimationStudios/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://animation.bsru.ac.th/am/site/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขานวัตกรรมการจัดการเกษตรและซัพลายเชน",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/scagim.bsru/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/innoagr/'),
                  )
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              "ระดับการศึกษา : ปริญญาตรี (5 ปี) ภาคปกติ",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            children: [
              ExpansionTile(
                title: Text(
                  "คณิตศาสตร์ (ค.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/matheduBSRU/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/mathed/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "คณิตศาสตร์ (ค.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/matheduBSRU/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/mathed/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "คอมพิวเตอร์ศึกษา (ค.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook('https://www.facebook.com/ComputerEduBSRU/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://comed.bsru.ac.th/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "ฟิสิกส์ (ค.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/%E0%B8%84%E0%B8%9A%E0%B8%9F%E0%B8%B4%E0%B8%AA%E0%B8%B4%E0%B8%81%E0%B8%AA%E0%B9%8C-%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B8%AA%E0%B8%A1%E0%B9%80%E0%B8%94%E0%B9%87%E0%B8%88-BSRU-216717958865862/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/physiced/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "ชีววิทยา (ค.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/Biology-Teacher-BSRU-157493158257614/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/bioed/'),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container ft2() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        backgroundColor: Colors.pink[50],
        title: Text(
          "คณะครุศาสตร์",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/teah.png'),
          ),
          ExpansionTile(
              title: Text(
                "ระดับการศึกษา : ปริญญาตรี (4 ปี) ภาคปกติ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: [
                ExpansionTile(
                  title: Text(
                    "สาขาการวัดประเมินและวิจัยทางการศึกษา (ค.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: website('http://site.bsru.ac.th/eer/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาจิตวิทยาและการแนะแนว (ค.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: website('http://site.bsru.ac.th/psycho/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาเทคโนโลยีดิจิทัลเพื่อการศึกษา (ค.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: facebook(
                          'https://www.facebook.com/DTEBSRU/', 'Facebook'),
                    ),
                    ListTile(
                      title: website('http://site.bsru.ac.th/teched/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาการประถมศึกษา (ค.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: website('http://site.bsru.ac.th/elementary/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาการศึกษาปฐมวัย (ค.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: website('http://site.bsru.ac.th/child/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาวิทยาศาสตร์ทั่วไป (ค.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: website('http://site.bsru.ac.th/gsc/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาศิลปศึกษา (ค.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: facebook(
                          'https://www.facebook.com/%E0%B8%AA%E0%B8%B2%E0%B8%82%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%8A%E0%B8%B2%E0%B8%A8%E0%B8%B4%E0%B8%A5%E0%B8%9B%E0%B8%A8%E0%B8%B6%E0%B8%81%E0%B8%A9%E0%B8%B2-%E0%B8%84%E0%B8%93%E0%B8%B0%E0%B8%84%E0%B8%A3%E0%B8%B8%E0%B8%A8%E0%B8%B2%E0%B8%AA%E0%B8%95%E0%B8%A3%E0%B9%8C-%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%97%E0%B8%A2%E0%B8%B2%E0%B8%A5%E0%B8%B1%E0%B8%A2%E0%B8%A3%E0%B8%B2%E0%B8%8A%E0%B8%A0%E0%B8%B1%E0%B8%8F%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B8%AA%E0%B8%A1%E0%B9%80%E0%B8%94%E0%B9%87%E0%B8%88%E0%B9%80%E0%B8%88%E0%B9%89%E0%B8%B2%E0%B8%9E%E0%B8%A3%E0%B8%B0%E0%B8%A2%E0%B8%B2-856427311081950/',
                          'Facebook'),
                    ),
                    ListTile(
                      title: website('http://site.bsru.ac.th/arted/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาพลศึกษา (ค.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: website('http://site.bsru.ac.th/pe/'),
                    )
                  ],
                ),
              ])
        ],
      ),
    );
  }

  Container ft3() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        backgroundColor: Colors.pink[50],
        title: Text(
          "คณะวิทยาการจัดการ",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/manage.png'),
          ),
          ExpansionTile(
            title: Text(
              "ระดับการศึกษา : ปริญญาตรี (4 ปี) ภาคปกติ",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            children: [
              ExpansionTile(
                title: Text(
                  "สาขาการโฆษณาและธุรกิจบันเทิง (นศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/AdvertisingAndEntertainmentBusinessBsru/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/adent/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาการจัดการธุรกิจระหว่างประเทศ (หลักสูตรนานาชาติ) (บธ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/Inter.Bus.management.BSRU/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/inbm/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาการจัดการโลจิสติกส์ (บธ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/BSRU-Logistic-Management-537151103292790/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/logistics/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาการตลาด (บธ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/MKBSRU2019', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/marketing'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาการท่องเที่ยว (ศศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/groups/302021116501264',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/tour/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาการบริหารทรัพยากรมนุษย์ (บธ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/Hrm-Bsru-225911134579548/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/hrm'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาการบัญชี (บช.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/%E0%B8%BABSRU-%E0%B8%AA%E0%B8%B2%E0%B8%82%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%8A%E0%B8%B2%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%9A%E0%B8%B1%E0%B8%8D%E0%B8%8A%E0%B8%B5-121027618606172/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/accounting/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาการประกอบการธุรกิจ (บธ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/bsru.entrepreneurship',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/entrepreneurs/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาการประชาสัมพันธ์และการสื่อสารองค์การ (นศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/PRCCBSRU/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/prcc/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาการสื่อสารมวลชน (นศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/Masscommbsruchannel/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/mc/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาคอมพิวเตอร์ธุรกิจ (บธ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/bc.msbsru', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://bizcom.bsru.ac.th/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาภาพยนตร์และดิจิทัลมีเดีย (นศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/BSRUfilm/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/fdm/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาเศรษฐศาสตร์ (ศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook('https://www.facebook.com/econbsruofficial',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/econ/'),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container ft4() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        backgroundColor: Colors.pink[50],
        title: Text(
          "คณะมนุษยศาสตร์และสังคมศาสตร์",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/human.png'),
          ),
          ExpansionTile(
            title: Text(
              "ระดับการศึกษา : ปริญญาตรี (4 ปี) ภาคปกติ",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            children: [
              ExpansionTile(
                title: Text(
                  "สาขานาฏยศิลป์ (ศป.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/DanceEduBSRU/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/dance/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขานิติศาสตร์ (น.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/law.bsru', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/law/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาภาษาจีน (ศศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: website('http://chinese.bsru.ac.th/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาภาษาไทย (ศศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/Thaihubsru/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/thai/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาภาษาและวัฒนธรรมเอเชียตะวันออก (ศศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/EastAsianLanguagesAndCulturesBSRU/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/ealc/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาภาษาอังกฤษ (ศศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/EngHumanBSRU', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/english/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขารัฐประศาสนศาสตร์ (รป.บ)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/%E0%B8%AA%E0%B8%B2%E0%B8%82%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%8A%E0%B8%B2%E0%B8%A3%E0%B8%B1%E0%B8%90%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%A8%E0%B8%B2%E0%B8%AA%E0%B8%99%E0%B8%A8%E0%B8%B2%E0%B8%AA%E0%B8%95%E0%B8%A3%E0%B9%8C-%E0%B8%A1%E0%B8%A3%E0%B8%A0%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B8%AA%E0%B8%A1%E0%B9%80%E0%B8%94%E0%B9%87%E0%B8%88%E0%B9%80%E0%B8%88%E0%B9%89%E0%B8%B2%E0%B8%9E%E0%B8%A3%E0%B8%B0%E0%B8%A2%E0%B8%B2-214659068590306/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/padm/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาสังคมศาสตร์เพื่อการพัฒนา (ศศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/%E0%B8%AA%E0%B8%B2%E0%B8%82%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%8A%E0%B8%B2%E0%B8%AA%E0%B8%B1%E0%B8%87%E0%B8%84%E0%B8%A1%E0%B8%A8%E0%B8%B2%E0%B8%AA%E0%B8%95%E0%B8%A3%E0%B9%8C%E0%B9%80%E0%B8%9E%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%9E%E0%B8%B1%E0%B8%92%E0%B8%99%E0%B8%B2-%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%97%E0%B8%A2%E0%B8%B2%E0%B8%A5%E0%B8%B1%E0%B8%A2%E0%B8%A3%E0%B8%B2%E0%B8%8A%E0%B8%A0%E0%B8%B1%E0%B8%8F%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B8%AA%E0%B8%A1%E0%B9%80%E0%B8%94%E0%B9%87%E0%B8%88%E0%B9%80%E0%B8%88%E0%B9%89%E0%B8%B2%E0%B8%9E%E0%B8%A3%E0%B8%B0%E0%B8%A2%E0%B8%B2-1417008055086239/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/ssd/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาออกแบบกราฟิกและอินโฟร์ (ศป.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/bsru.viscomm/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('http://graphic.bsru.ac.th/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาบรรณารักษศาสตร์และสารสนเทศศาสตร์ (ศศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/librarybsru/', 'Facebook'),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาอาเซียนศึกษา (ศศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: website('http://site.bsru.ac.th/asean/'),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขานาฏยศิลป์ศึกษา (ค.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: website('http://site.bsru.ac.th/danced/'),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาภาษาไทย (ค.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/%E0%B8%A0%E0%B8%B2%E0%B8%A9%E0%B8%B2%E0%B9%84%E0%B8%97%E0%B8%A25%E0%B8%9B%E0%B8%B5-357042164743520/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/thaied/'),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาภาษาอังกฤษ (ค.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/englishteacherbsru',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/enged/'),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาสังคมศึกษา (ค.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: website('http://site.bsru.ac.th/soc/'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container ft5() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        backgroundColor: Colors.pink[50],
        title: Text(
          "วิทยาลัยการดนตรี",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/song.jpg'),
          ),
          ExpansionTile(
            title: Text(
              "ระดับการศึกษา : ปริญญาตรี (4 ปี) ภาคปกติ",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            children: [
              ExpansionTile(
                title: Text(
                  "สาขาดนตรีตะวันตก (ดศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/WMBSRU/', 'Facebook'),
                  ),
                  ListTile(
                    title: website('https://www.westernmusicbsru.com/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาดนตรีไทย (ดศ.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/%E0%B8%94%E0%B8%99%E0%B8%95%E0%B8%A3%E0%B8%B5%E0%B9%84%E0%B8%97%E0%B8%A2-%E0%B8%A1%E0%B8%A3%E0%B8%A0%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B8%AA%E0%B8%A1%E0%B9%80%E0%B8%94%E0%B9%87%E0%B8%88%E0%B9%80%E0%B8%88%E0%B9%89%E0%B8%B2%E0%B8%9E%E0%B8%A3%E0%B8%B0%E0%B8%A2%E0%B8%B2-152989838780007/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/tm/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาดนตรีตะวันตกศึกษา (ค.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/%E0%B8%AA%E0%B8%B2%E0%B8%82%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%8A%E0%B8%B2%E0%B8%94%E0%B8%99%E0%B8%95%E0%B8%A3%E0%B8%B5%E0%B8%A8%E0%B8%B6%E0%B8%81%E0%B8%A9%E0%B8%B2-%E0%B8%84%E0%B8%93%E0%B8%B0%E0%B8%84%E0%B8%A3%E0%B8%B8%E0%B8%A8%E0%B8%B2%E0%B8%AA%E0%B8%95%E0%B8%A3%E0%B9%8C-%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%97%E0%B8%A2%E0%B8%B2%E0%B8%A5%E0%B8%B1%E0%B8%A2%E0%B8%A3%E0%B8%B2%E0%B8%8A%E0%B8%A0%E0%B8%B1%E0%B8%8F%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B8%AA%E0%B8%A1%E0%B9%80%E0%B8%94%E0%B9%87%E0%B8%88%E0%B9%80%E0%B8%88%E0%B9%89%E0%B8%B2%E0%B8%9E%E0%B8%A3%E0%B8%B0%E0%B8%A2%E0%B8%B2-882416198502897/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('https://www.westernmusicbsru.com/'),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "สาขาดนตรีไทยศึกษา (ค.บ.)",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: facebook(
                        'https://www.facebook.com/%E0%B8%AA%E0%B8%B2%E0%B8%82%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%8A%E0%B8%B2%E0%B8%94%E0%B8%99%E0%B8%95%E0%B8%A3%E0%B8%B5%E0%B8%A8%E0%B8%B6%E0%B8%81%E0%B8%A9%E0%B8%B2-%E0%B8%84%E0%B8%93%E0%B8%B0%E0%B8%84%E0%B8%A3%E0%B8%B8%E0%B8%A8%E0%B8%B2%E0%B8%AA%E0%B8%95%E0%B8%A3%E0%B9%8C-%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%97%E0%B8%A2%E0%B8%B2%E0%B8%A5%E0%B8%B1%E0%B8%A2%E0%B8%A3%E0%B8%B2%E0%B8%8A%E0%B8%A0%E0%B8%B1%E0%B8%8F%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B8%AA%E0%B8%A1%E0%B9%80%E0%B8%94%E0%B9%87%E0%B8%88%E0%B9%80%E0%B8%88%E0%B9%89%E0%B8%B2%E0%B8%9E%E0%B8%A3%E0%B8%B0%E0%B8%A2%E0%B8%B2-882416198502897/',
                        'Facebook'),
                  ),
                  ListTile(
                    title: website('http://site.bsru.ac.th/tmed/'),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container ft6() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        backgroundColor: Colors.pink[50],
        title: Text(
          "คณะวิศวกรรมศาสตร์และเทคโนโลยีอุตสาหกรรม",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/elec.jpg'),
          ),
          ExpansionTile(
              title: Text(
                "ระดับการศึกษา : ปริญญาตรี (4 ปี) ภาคปกติ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: [
                ExpansionTile(
                  title: Text(
                    "สาขาเทคโนโลยีโลจิสติกส์ (วท.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: facebook(
                          'https://www.facebook.com/LogisticsTechnologyBSRU/?modal=admin_todo_tour',
                          'Facebook'),
                    ),
                    ListTile(
                      title: website('http://site.bsru.ac.th/techlogis/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาเทคโนโลยีอุตสาหกรรม (ทล.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: facebook(
                          'https://www.facebook.com/technobansomdej',
                          'Facebook'),
                    ),
                    ListTile(
                      title: website('http://site.bsru.ac.th/idtec/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาการจัดการวิศวกรรมการผลิตและโลจิสติกส์ (อส.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: facebook(
                          'https://www.facebook.com/inbsru/', 'Facebook'),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาวิศวกรรมไฟฟ้าเครื่องกลการผลิต (วศ.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: facebook(
                          'https://www.facebook.com/%E0%B8%A7%E0%B8%B4%E0%B8%A8%E0%B8%A7%E0%B8%81%E0%B8%A3%E0%B8%A3%E0%B8%A1%E0%B9%84%E0%B8%9F%E0%B8%9F%E0%B9%89%E0%B8%B2%E0%B9%80%E0%B8%84%E0%B8%A3%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%87%E0%B8%81%E0%B8%A5%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%9C%E0%B8%A5%E0%B8%B4%E0%B8%95-%E0%B8%A1%E0%B8%A3%E0%B8%A0%E0%B8%9A%E0%B9%89%E0%B8%B2%E0%B8%99%E0%B8%AA%E0%B8%A1%E0%B9%80%E0%B8%94%E0%B9%87%E0%B8%88%E0%B9%80%E0%B8%88%E0%B9%89%E0%B8%B2%E0%B8%9E%E0%B8%A3%E0%B8%B0%E0%B8%A2%E0%B8%B2-186245221551718/',
                          'Facebook'),
                    ),
                    ListTile(
                      title: website('http://site.bsru.ac.th/elec/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาออกแบบผลิตภัณฑ์อุตสาหกรรม (วท.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: facebook(
                          'https://www.facebook.com/BsruID123/', 'Facebook'),
                    ),
                    ListTile(
                      title: website('http://site.bsru.ac.th/ind/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาวิศวกรรมการผลิตและออกแบบแม่พิมพ์ (วศ.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: facebook(
                          'https://www.facebook.com/%E0%B8%A7%E0%B8%B4%E0%B8%A8%E0%B8%A7%E0%B8%81%E0%B8%A3%E0%B8%A3%E0%B8%A1%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%9C%E0%B8%A5%E0%B8%B4%E0%B8%95%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B8%AD%E0%B8%AD%E0%B8%81%E0%B9%81%E0%B8%9A%E0%B8%9A%E0%B9%81%E0%B8%A1%E0%B9%88%E0%B8%9E%E0%B8%B4%E0%B8%A1%E0%B8%9E%E0%B9%8C-%E0%B8%A1%E0%B8%9A%E0%B8%AA-1133771359981412',
                          'Facebook'),
                    ),
                    ListTile(
                      title: website('http://site.bsru.ac.th/mold/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาวิศวกรรมพลังงาน (วศ.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: facebook(
                          'https://www.facebook.com/%E0%B8%AA%E0%B8%B2%E0%B8%82%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%8A%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%A8%E0%B8%A7%E0%B8%81%E0%B8%A3%E0%B8%A3%E0%B8%A1%E0%B8%9E%E0%B8%A5%E0%B8%B1%E0%B8%87%E0%B8%87%E0%B8%B2%E0%B8%99-%E0%B8%A1%E0%B8%9A%E0%B8%AA-157285855114738/',
                          'Facebook'),
                    ),
                    ListTile(
                      title: website('http://site.bsru.ac.th/energy/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาผู้ประกอบการอาหาร (บธ.บ.)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: facebook(
                          'https://www.facebook.com/FoodEntrepreneursBSRU',
                          'Facebook'),
                    ),
                    ListTile(
                      title: website('http://site.bsru.ac.th/fe/'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "สาขาเทคโนโลยีการจัดการอุตสาหกรรม (ทล.บ.) (หลักสูตรต่อเนื่อง)",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      title: facebook(
                          'https://www.facebook.com/%E0%B9%80%E0%B8%97%E0%B8%84%E0%B9%82%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%A2%E0%B8%B5%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%88%E0%B8%B1%E0%B8%94%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%AD%E0%B8%B8%E0%B8%95%E0%B8%AA%E0%B8%B2%E0%B8%AB%E0%B8%81%E0%B8%A3%E0%B8%A3%E0%B8%A1-%E0%B8%95%E0%B9%88%E0%B8%AD%E0%B9%80%E0%B8%99%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%87-100410828274281/',
                          'Facebook'),
                    ),
                  ],
                ),
              ]),
        ],
      ),
    );
  }

  Container ft7() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        backgroundColor: Colors.pink[50],
        title: Text(
          "บัณฑิตวิทยาลัย",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/gradbanner.gif'),
          ),
          ListTile(
            title: website('http://grad.bsru.ac.th/grad2019/\nindex.php'),
          ),
          ListTile(
            title: facebook('https://www.facebook.com/graduateschoolbsru',
                'บัณฑิตวิทยาลัย \nมหาวิทยาลัยราชภัฏบ้านสมเด็จเจ้าพระยา'),
          )
        ],
      ),
    );
  }

  Widget website(String url) {
    return Container(
      // margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      //

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.public,
            size: 30,
          ),

          // Text('เว็บไซต์'),
          TextButton(
              onPressed: () async {
                // const url = 'http://aar.bsru.ac.th/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Couid not launch $url';
                }
              },
              child: Text(
                url,
                style: TextStyle(color: Colors.orange[700]),
              ))
        ],
      ),
    );
  }

  Widget facebook(String url, String nameFace) {
    return Container(
      // margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.thumb_up_alt,
            size: 30,
          ),
          TextButton(
              onPressed: () async {
                // const url = 'https://www.facebook.com/AarBsru/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Couid not launch $url';
                }
              },
              child:
                  Text(nameFace, style: TextStyle(color: Colors.orange[700])))
        ],
      ),
    );
  }
}
