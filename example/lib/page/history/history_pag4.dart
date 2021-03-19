import 'package:flutter/material.dart';

class HistoryPag4 extends StatefulWidget {
  @override
  _HistoryPag4State createState() => _HistoryPag4State();
}

class _HistoryPag4State extends State<HistoryPag4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 40,
      //     backgroundColor: Colors.purple,
      //     leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: Icon(Icons.arrow_back),
      //     ),
      //     title: Text('')),
      appBar: AppBar(
          backgroundColor: Colors.purple[50],
          title: Text("วิสัยทัศน์ พันธกิจ",style: TextStyle(color: Colors.black),),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 40,
          elevation: 0.00,
          automaticallyImplyLeading: false,
        ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.purple[50],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'images/idea.png',
                                height: 50,
                              ),
                              Text(
                                'วิสัยทัศน์',
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.purple),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            '        มหาวิทยาลัยราชภัฏบ้านสมเด็จเจ้าพระยา มุ่งมั่น ทุ่มเทให้เป็นเลิศของประเทศ และเป็นมหาวิทยาลัยคุณภาพสากลชั้นนำ(World Class Quality University)',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(height: 10),
                          Divider(color: Colors.black38),
                          Row(
                            children: [
                              Image.asset(
                                'images/shuttle.png',
                                height: 50,
                              ),
                              Text(
                                'พันธกิจ',
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.purple),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            '''
- บริหารจัดการศึกษาบนฐานองค์ความรู้สู่การเป็นมหาวิทยาลัยสากลชั้นนำ (World – Class Quality University)

- บริหารจัดการด้านวิชาการอย่างมืออาชีพ เพื่อผลิตบัณฑิตคุณภาพที่เปี่ยมด้วยคุณธรรม มีสุขภาพอนามัยดี มีทักษะวิชาการมีทักษะทางภาษาและเทคโนโลยี พร้อมเป็น สมาชิกประชาคมอาเซียน และประชาคมโลก

- พัฒนาบุคลากรเปี่ยมคุณธรรม และศักยภาพ พร้อมเป็นผู้นำทางปัญญา และเป็นแบบอย่าง

- พัฒนาเป็นแหล่งเรียนรู้ สืบสาน และเป็นเลิศด้านวิชาการ ภาษา ศิลปวัฒนธรรม และกีฬา

- พัฒนาให้เป็นศูนย์กลางการวิจัย และวิชาการ (Research and Academic Hub) ระดับนานาชาติ ที่เชื่อมโยงเครือข่ายทั้งในประเทศ กลุ่มอาเซียน และระดับโลก เน้น การแลกเปลี่ยนเรียนรู้ร่วมกับนักวิจัย นักวิชาการ ดีเด่น ระดับประเทศและระดับสากล

- พัฒนาศูนย์ภาษานานาชาติ (International Language Center) ที่ส่งเสริมการเรียนรู้และวิจัยเกี่ยวกับภาษาทุกภาษาโดยเฉพาะภาษาเศรษฐกิจ รวมถึงภาษาการอาชีพ
- พัฒนาให้เป็นแหล่งเรียนรู้ และศูนย์อาเซียนศึกษา (ASEAN Studies & Resource & Center)

- พัฒนาศูนย์นอกที่ตั้ง/วิทยาเขต ที่ได้มาตรฐานระดับสากล เน้นการน้อมนำปรัชญาเศรษฐกิจพอเพียง และองค์ความรู้สากล เพื่อสร้างบัณฑิตที่มีอัจฉริยภาพด้านภาษา ไทย และภาษาอังกฤษ คณิตศาสตร์ วิทยาศาสตร์ สังคม เป็นต้นและต่อยอดวิชาชีพครูตามความสมัครใจของผู้เรียนของมหาวิทยาลัย และของวิทยาเขต (โครงการช้างเผือก)

- จัดภูมิทัศน์ที่สวยงาม สง่า และมีศิลปะ ตลอดจนจัดบรรยากาศเชิงวิชาการ และการอยู่ร่วมกันอย่างผา''',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
