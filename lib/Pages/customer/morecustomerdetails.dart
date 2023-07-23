import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Apis/getonecustomer.dart';
import 'package:loan_managment_app/Pages/staff/addimage.dart';

TextStyle textStyle = const TextStyle(
    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);

class MoreCustomerDetails extends StatefulWidget {
  final OneCustomerDetails oneCustomer;
  const MoreCustomerDetails({super.key, required this.oneCustomer});
  @override
  State<MoreCustomerDetails> createState() => _MoreCustomerDetailsState();
}

class _MoreCustomerDetailsState extends State<MoreCustomerDetails> {
  var errorMessage = "".obs;
  late OneCustomerDetails oneCustomer;
  var url =
      "https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg";
  var cloudinarybase = "https://res.cloudinary.com/dfvhftecz/";

  @override
  void initState() {
    super.initState();
    oneCustomer = widget.oneCustomer;
    if (oneCustomer.profileimage != null) {
      url = cloudinarybase + oneCustomer.profileimage!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          expandedHeight: 410,
          actions: [
            IconButton(onPressed: () {
              Get.off(() => AddImage(id: oneCustomer.id));
            }, icon: const Icon(Icons.edit)),
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              oneCustomer.name,
            ),
            background: Image.network(
              url,
              fit: BoxFit.fill,
            ),
          ),
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const SizedBox(
                height: 10,
              ),
              // Add additional text for scrolling here
              _buildDetailItem("Name", Icons.person, oneCustomer.name),
              _buildDetailItem(
                  "Address", Icons.location_on, oneCustomer.address),
              _buildDetailItem(
                  "Telephone 1", Icons.phone, oneCustomer.telephone1),
              _buildDetailItem(
                  "Telephone 2", Icons.phone, oneCustomer.telephone2),
              _buildDetailItem("Date of Birth", Icons.calendar_today,
                  oneCustomer.dateofbirth),
              _buildDetailItem(
                  "NIC Number", Icons.credit_card, oneCustomer.nicnumber),

              // Add more text or widgets as needed
            ],
          ),
        ),
      ],
    ));
  }

  Widget _buildDetailItem(String label, IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: Colors.grey,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
