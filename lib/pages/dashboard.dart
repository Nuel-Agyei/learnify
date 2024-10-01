import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
// import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learnify', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),),
        actions: [
          IconButton(icon:const Icon(Icons.add, size: 32, color: Colors.black,),
          onPressed: (){
            showDialog(context: context, builder: (context) => const AlertDialog(content: Text('Add FlashCard'),));
          },
          )
        ],
      ),

      body:  Column(
        children:[
          const Row(
            children: [
              Filters(filter: 'All', color: Color.fromARGB(255, 163,145,147),),
              Filters(filter: 'Audio Only', color: Color.fromARGB(255, 246,224,181),),
              Filters(filter: 'Video Only', color: Color.fromARGB(255, 238,169,144),),
              Filters(filter: 'Text Only', color: Color.fromARGB(219, 170,111,115),),
            ]
          ),
           SizedBox(
            width: 375,
             child: Card(
              elevation: 2,
              margin:const EdgeInsets.all(12),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(6.0), // You can adjust the radius as needed
               ),
               child:const Padding(
                 padding: EdgeInsets.all(8.0),
                 child:Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    Text('Flash Card 1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Center(widthFactor: 2,child: Icon(Icons.image, size: 256,),),
                    ReadMoreText(
                      trimMode:TrimMode.Line,
                      trimLines:4,  
                      '''Covalent bonds are chemical bonds formed when two atoms share electrons. This sharing occurs to achieve a stable electron configuration, often resembling a noble gas.
                        Types:
                        Single bonds: One pair of electrons shared.
                        Double bonds: Two pairs of electrons shared.
                        Triple bonds: Three pairs of electrons shared.
                        Polarity:
                        Polar covalent bonds: Unequal sharing of electrons due to differences in electronegativity.
                        Nonpolar covalent bonds: Equal sharing of electrons due to similar electronegativities.
                        Examples:
                        Water (H₂O): Polar covalent bonds between hydrogen and oxygen.
                        Methane (CH₄): Nonpolar covalent bonds between carbon and hydrogen.
                        Covalent bonds are common in organic molecules and many other compounds.''', 
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                   ],
                 ),
               ),
             ),
           )
           
           ]
      ),
    );
  }
}

class Filters extends StatelessWidget {
  const Filters({super.key, required this.filter, required this.color});
  final String filter;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 3,
      color: color,
      margin: const EdgeInsets.all(12),
      
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(filter, style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
      ),
    );
  }
}