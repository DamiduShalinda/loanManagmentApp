import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_managment_app/Apis/getonecustomer.dart';


TextStyle textStyle =  const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

class MoreCustomerDetails extends StatefulWidget {
  final OneCustomerDetails oneCustomer;
  const MoreCustomerDetails({super.key, required this.oneCustomer});
  @override
  State<MoreCustomerDetails> createState() => _MoreCustomerDetailsState();
}


class _MoreCustomerDetailsState extends State<MoreCustomerDetails> {

  var errorMessage = "".obs;
  late OneCustomerDetails oneCustomer;
  var url ="https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg";
  var cloudinarybase = "https://res.cloudinary.com/dfvhftecz/";
  
  @override
  void initState() {
    super.initState();
    oneCustomer = widget.oneCustomer;
    if (oneCustomer.profileimage != null) {
      url = cloudinarybase + oneCustomer.profileimage!;
    }
    print(oneCustomer.nicnumber);
  }

  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: (){
                Get.back();
              }, 
              icon: const Icon(Icons.arrow_back)
            ),
            expandedHeight: 410,
            flexibleSpace:  FlexibleSpaceBar(
              title: Text(oneCustomer.name),
              background: Image.network(url , fit: BoxFit.fill,),
                
            ),
            
            pinned: true,
          ),
                   SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    oneCustomer.address,
                    style: textStyle,
                  ),
                  Text(
                    oneCustomer.telephone1,
                    style: textStyle,
                  ),
                ],
              ),
              // Add additional text for scrolling here
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( "Customer Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),	
                ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( "Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),	
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( oneCustomer.name,),	
                ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( "Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),	
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( oneCustomer.address,),	
                ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( "Telephone 1", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),	
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( oneCustomer.telephone1,),	
                ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( "Telephone 2", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),	
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( oneCustomer.telephone2,),	
                ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( "Date of Birth", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),	
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( oneCustomer.dateofbirth,),	
                ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( "NIC Number", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),	
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text( oneCustomer.nicnumber,),	
                ),
              const Divider(),
              
             
              // Add more text or widgets as needed
            ],
          ),
        ),
        ],
      )
    );
  }




  Widget _buildDetailItem(String label, IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
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
    );
  }
}



