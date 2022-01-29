import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Labs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List pics = [
      "https://www.glbitm.org/images/computer-center-img3.jpg",
      "https://www.glbitm.org/images/computer-center-img4.jpg",
      "https://www.glbitm.org/Uploads/image/ME-RoboticsLaboratory-6Jan20c.jpg",
      "https://www.glbitm.org/Uploads/image/283imguf_eeelab2.jpg",
      "https://www.glbitm.org/Uploads/image/265imguf__MG_7270.jpg",
      "https://www.glbitm.org/Uploads/image/287imguf_apslab2.jpg",
      "https://www.glbitm.org/Uploads/image/286imguf_apslab1.jpg",
      "https://www.glbitm.org/Uploads/Image/854imguf_lab-me-advance3.jpg",
    ];

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Material(
              elevation: 5,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22)),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Labs",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                height: size.height * .075,
                width: size.width,
                decoration: BoxDecoration(
                    color: Color(0xffF1E6FF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(22))),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              height: 250,
              padding: const EdgeInsets.only(left: 10.0),
              child: ListView.builder(
                  itemCount: pics.length,
                  //planetInfo.images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            pics[index],
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) =>
                                loadingProgress == null
                                    ? child
                                    : Center(
                                        child: CircularProgressIndicator(
                                        color: Color(0xff6F35A5),
                                      )),
                          )),
                    );
                  }),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
                child: Material(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    elevation: 12,
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        color: Color(0xffF1E6FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SingleChildScrollView(
                            child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "Labs play a very critical role in technical education. Almost every topic taught during lecture has a corresponding experiment. GL Bajaj pays great attention to its labortries and the equipment in them. All the departments at GL Bajaj are equipped with state of the art laboratories and workshop to ensure that the students learn practical aspects of Engineering. The faculty members are actively engaged in the research and development activities with technical support of various industries and govt. agencies.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "Computer Science Labs",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "The computer centre is well-equipped with computing resources to cater to the academic needs of the students. The center is a constant hub of activities, providing a conducive learning environment. The trained technical staff is available to help out the students. iOS Lab was inaugurated by Mr. Sumal Abraham Varghese, Chief Group Manager - Human Resources Adventz Group (formerly K K Birla Group).",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "Electrical & Electronics Labs",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "The departmental labs are equipped with Electrical Engineering Lab, Electro-Mechanical Energy Conversion Lab, Electrical Measurement Lab, Numerical Technique Lab, Electronics Lab, Network Lab, Electrical Simulation Lab, Control System Lab, Power System lab, Electrical Instrumentation Lab, Microprocessor Lab, Power Electronics Lab and Industrial Automation Lab, etc.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "Mechanical Labs",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "The department is equipped with state of the art laboratories and workshop to ensure that the students learn practical aspects of Engineering. The departmental labs are equipped with IC Engine Lab, Fluid Machinery/Mechanics Lab, Refrigeration & Air Conditioning Lab, Heat and Mass Transfer Lab, Manufacturing Science Lab, Material Science Lab, Machine Design Lab, Automobile Lab, CAM Lab, Thermodynamics Lab Machine Drawing Lab, Dynamics of Machines Lab, Measurement & Metrology Lab, etc.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "Civil Labs",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "The departmental labs are equipped with Transportation Engineering Laboratories, Geotechnical Engineering Laboratories, Surveying and Geo Informatics Laboratories, Environment Engineering Laboratories, Structure Analysis Laboratories, Computational Laboratories, etc.",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
