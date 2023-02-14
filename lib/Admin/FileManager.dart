import 'dart:io';

import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';
// import 'package:mapoly_siwes_logbook/pdfProvider.dart';
import 'package:provider/provider.dart';

class ShowFileManager extends StatelessWidget {
  ShowFileManager({Key? key}) : super(key: key);

  final FileManagerController controller = FileManagerController();

  @override
  Widget build(BuildContext context) {
    // final tester= Provider.of<pdfProvide>(context);
    // final test= tester.selectedFile;
    String val='';

    return Scaffold(
        appBar: AppBar(
          actions: [
            // IconButton(
            //   onPressed: () => createFolder(context),
            //   icon: Icon(Icons.create_new_folder_outlined),
            // ),
            IconButton(
              onPressed: () => sort(context),
              icon: Icon(Icons.sort_rounded),
            ),
            IconButton(
              onPressed: () => selectStorage(context),
              icon: Icon(Icons.sd_storage_rounded),
            )
          ],
          title: ValueListenableBuilder<String>(
            valueListenable: controller.titleNotifier,
            builder: (context, title, _) {
              if(title=='0'){
                return Text('Internal Storage');
              }
              return Text(title);
            },
          ),
          leading: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () async {
              await controller.goToParentDirectory().then((value) {
                Navigator.pop(context);
                // Get.back();
                // tester.sselectedFile=val.replaceFirst('File:', '');
              });
            },
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: FileManager(
            controller: controller,
            builder: (context, snapshot) {
              final List<FileSystemEntity> entities = snapshot;
              return ListView.builder(
                itemCount: entities.length,
                itemBuilder: (context, index) {
                  FileSystemEntity entity = entities[index];
                  if(FileManager.isDirectory(entity) ||
                     (FileManager.isFile(entity) && FileManager.getFileExtension(entity)=='xlsx')
                        ){ 
                  return Card(
                    child: ListTile(
                      leading: FileManager.isFile(entity)
                          ? Icon(Icons.feed_outlined)
                          : Icon(Icons.folder),
                      title: FileManager.isFile(entity)?
                          Text("${FileManager.basename(entity)}.${FileManager.getFileExtension(entity)}"):
                          Text(FileManager.basename(entity)),
                      subtitle: subtitle(entity),

                      onTap: () async {
                        // tester.sselectedFile=entity.toString();
                        // updateValue(entity.toString());
                        // val=entity.toString();
                        if (FileManager.isDirectory(entity)) {
                          // open the folder
                          if(entity.existsSync()){
                            
                            controller.openDirectory(entity);
                            
                          }
                          // controller.openDirectory(entity);
    
                          // delete a folder
                          // await entity.delete(recursive: true);
    
                          // rename a folder
                          // await entity.rename("newPath");
    
                          // Check weather folder exists
                          // entity.exists();
    
                          // get date of file
                          // DateTime date = (await entity.stat()).modified;
                        } else {
                          if(FileManager.getFileExtension(entity)=='pdf'){
                            print("correct");
                            val=entity.toString();
                            print(val.replaceFirst('File:', ''));
                            showDialog(context: context, builder: (context) {
                              return AlertDialog(
                                content: Text('Upload $val?'),
                                actions: [
                                  TextButton(onPressed: (){
                                    // tester.sselectedFile=val.replaceFirst('File:', '');
                                    // print(tester.selectedFile);
                                    Navigator.of(context).pop();
                                  }, child: Text('yes'))
                                ],
                              );
                            },);
                          }
                          // delete a file
                          // await entity.delete();
    
                          // rename a file
                          // await entity.rename("newPath");
    
                          // Check weather file exists
                          // entity.exists();
    
                          // get date of file
                          // DateTime date = (await entity.stat()).modified;
    
                          // get the size of the file
                          // int size = (await entity.stat()).size;
                        }
                      },
                    ),
                  );
                     }
                     return SizedBox();
                },
              );
            },
          ),
        ));
  }

  Widget subtitle(FileSystemEntity entity) {
    return FutureBuilder<FileStat>(
      future: entity.stat(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (entity is File) {
            int size = snapshot.data!.size;

            return Text(
              "${FileManager.formatBytes(size)}",
            );
          }
          return Text(
            "${snapshot.data!.modified}".substring(0, 10),
          );
        } else {
          return Text("");
        }
      },
    );
  }

  selectStorage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: FutureBuilder<List<Directory>>(
          future: FileManager.getStorageList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<FileSystemEntity> storageList = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: storageList
                        .map((e) {
                          print(e);
                          return ListTile(
                              title: e.toString().contains('/storage/emulated/0')?
                              Text("Internal Storage"):
                              Text(
                                "${FileManager.basename(e)}",
                              ),
                              onTap: () {
                                controller.openDirectory(e);
                                Navigator.pop(context);
                              },
                            );
                        })
                        .toList()),
              );
            }
            return Dialog(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  sort(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                  title: Text("Name"),
                  onTap: () {
                    controller.sortBy(SortBy.name);
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text("Size"),
                  onTap: () {
                    controller.sortBy(SortBy.size);
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text("Date"),
                  onTap: () {
                    controller.sortBy(SortBy.date);
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text("type"),
                  onTap: () {
                    controller.sortBy(SortBy.type);
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  createFolder(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController folderName = TextEditingController();
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: TextField(
                    controller: folderName,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      // Create Folder
                      await FileManager.createFolder(
                          controller.getCurrentPath, folderName.text);
                      // Open Created Folder
                      controller.setCurrentPath =
                          controller.getCurrentPath + "/" + folderName.text;
                    } catch (e) {}

                    Navigator.pop(context);
                  },
                  child: Text('Create Folder'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}