

// import 'package:cbt_flutter/api';
import 'package:cbt_flutter/Providers/provider1.dart';
import 'package:cbt_flutter/api\'s/subject.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class CreateSubject extends StatelessWidget {
  CreateSubject({Key? key}) : super(key: key);

  TextEditingController title=TextEditingController();
  TextEditingController code= TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prov=Provider.of<providerModel>(context);

    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
        child: GFLoader(
          type: GFLoaderType.circle,
          loaderColorOne: GFColors.DANGER,
          loaderColorTwo: GFColors.WARNING,
          loaderColorThree: GFColors.SUCCESS,
          size: 50,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
    
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                     TextField(
                      controller: title,
                        decoration: InputDecoration(
                          hintText: "Subject Title",
                          filled: true,
                          fillColor: Colors.grey[300],
                          focusColor:Colors.grey[300],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide.none
                          )
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        controller: code,
                        decoration: InputDecoration(
                          hintText: "Subject Code",
                          filled: true,
                          fillColor: Colors.grey[300],
                          focusColor:Colors.grey[300],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide.none
                          )
                        ),
                      ),
                  ]),
                ),
    
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(onPressed: () async {
                    print('object');
                    context.loaderOverlay.show();
                    Map result= await SubjectRequest().postSubject(prov.access, title.text, code.text);
                    print(result);
                    if(result["code"]=="token_not_valid"){

                    }else if(result["code"]=="unable to connect"){

                    }
                    context.loaderOverlay.hide();
                  }, child: Text('create')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}