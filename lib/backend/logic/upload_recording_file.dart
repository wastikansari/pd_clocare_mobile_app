import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:ftpconnect/ftpconnect.dart';

class FtpServerUpload {
  Future uploadRecoringFile(
      ftpServer, username, password, _idProofimage) async {
    print(
        'uploadRecoringFile CALL 1 $ftpServer and $username and $password and $_idProofimage');
    File file = File(_idProofimage.toString());

    String formatFileSize(int bytes) {
      if (bytes < 1024) {
        return '${bytes}B';
      } else if (bytes < 1024 * 1024) {
        double kb = bytes / 1024;
        return '${kb.toStringAsFixed(2)}KB';
      } else {
        double mb = bytes / (1024 * 1024);
        return '${mb.toStringAsFixed(2)}MB';
      }
    }

    var fileSize = await _idProofimage.length();
    print('sssssssssssssssssssss $fileSize');
    String formattedSize = formatFileSize(fileSize);
    print('File size: $formattedSize');

    try {
      FTPConnect fTPConnect =
          FTPConnect(ftpServer, user: username, pass: password);
      await fTPConnect.connect();

      fTPConnect.changeDirectory('/orderDeliverImage');
      var entries = await fTPConnect.listDirectoryContent();
      for (var entry in entries) {
        print(entry.name);
      }
      var dd = fTPConnect.currentDirectory().then((value) {
        print('dda $value and ${value.codeUnits} ${value.hashCode}');
      });
      // print('mmmmmmmmmmmmmmm ${dd.}');
      // File localFile = File(_idProofimage);
      // List<int> fileContent = await localFile.readAsBytes();
      // String fileName = localFile.path.split('/').last;
      print(
          'uploadRecoringFile CALL 2 $_idProofimage AND ${_idProofimage.runtimeType}  ');
      // print('uploadRecoringFile CALL 3 AND $localFile AND ${localFile.runtimeType} }  ');
      await fTPConnect.uploadFile(
        _idProofimage,
        sRemoteName: '',
      );
      // await fTPConnect.disconnect();
    } catch (e) {
      print('FTP Upload Error: $e');
    }
  }

  Future<void> downloadFileFromFTP(
      ftpServer, username, password, _idProofimage) async {
    print('downloadFileFromFTP call 1');

    try {
      FTPConnect fTPConnect =
          FTPConnect(ftpServer, user: username, pass: password);
      var d = await fTPConnect.connect();
      fTPConnect.changeDirectory('/orderDeliverImage');
      // fTPConnect.makeDirectory('orderDeliverImage');
      var entries = await fTPConnect.listDirectoryContent();
      for (var entry in entries) {
        print(entry.name);
      }
      // print('downloadFileFromFTP connect call 8 $entries');
      // Change the working directory on the server (if needed)
      // For example, if the file is located in '/remote/directory/file.txt':
      // var c = await fTPConnect.changeDirectory('/remote/cc.vcantech.ca/deliverImage');
      // print('downloadFileFromFTP connect call 1 ${fTPConnect} and $c');
      // Get the file name from the remote file path
      // String fileName =remoteFilePath.split('/remote/cc.vcantech.ca/deliverImage').last;

      // Download the file from the server
      var fileData =
          fTPConnect.downloadFile('data.text', File('data.text')).then((value) {
        print("dddd don $value");
      });

      // Save the downloaded file locally
      // File localFile = File(localFilePath + fileName);
      // await localFile.writeAsBytes(fileData);

      // Disconnect from the FTP server
      // await fTPConnect.disconnect();
    } catch (e) {
      // Handle any errors that may occur during the download process
      print('FTP Download Error: $e');
    }
  }

  // Replace with the remote directory on the server where you want to upload the file
  // uploadFileToFTP(recordingFilePath, ftpServer, username, password, remotePath);
  // uploadRecoringFile() async {
  //   print('upload recording file call');
  //   FTPConnect ftpConnect = FTPConnect('104.192.4.200', //https://host.vcantech.biz:8443
  //       user: 'vcantech.ca', pass: 'Yfg9z\$453');
  //       print('FTPConnect dd ${ftpConnect.connect()}');
  //   try {
  //     // File fileToUpload = File();
  //     var d = await ftpConnect.connect();
  //      print(' vvvvvvvvvvvvvvvvvvvvv  was $d');
  //     // await ftpConnect.uploadFile(fileToUpload);
  //     await ftpConnect.disconnect();
  //   } catch (e) {
  //     //error
  //   }
  // }
}
