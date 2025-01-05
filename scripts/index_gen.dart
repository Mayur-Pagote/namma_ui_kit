import 'dart:convert';
import 'dart:io';

void main() async {
  final libDir = Directory('lib');
  final indexDir = Directory('.index');
  if (!await libDir.exists()) {
    print('The /lib directory does not exist.');
    return;
  }

  final subDirectories = libDir.listSync().whereType<Directory>();

  for (final dir in subDirectories) {
    final folderDir = Directory('${indexDir.path}/${dir.path}');
    if (!await folderDir.exists()) {
    await folderDir.create(recursive: true);
  }
    final indexFile = File('${indexDir.path}/${dir.path}/index.json');

    // Get folder contents
    final folderContents = getDirectoryStructure(dir);
     final totalSize = calculateTotalSize(folderContents);
    // Write the JSON to index.json
     final output = {
      'folder': dir.path,
      'totalSize': totalSize,
      'contents': folderContents,
    };
    await indexFile.writeAsString(
      const JsonEncoder.withIndent('  ').convert(output),
    );

    print('Indexed folder: ${dir.path} -> ${indexFile.path}');
  }
}

List<Map<String, dynamic>> getDirectoryStructure(Directory dir) {
  final entries = <Map<String, dynamic>>[];

  for (final entity in dir.listSync(recursive: false)) {
    if (entity is File) {
      entries.add({
        'type': 'file',
        'name': entity.uri.pathSegments.last,
        'path': entity.path,
        'size': entity.lengthSync(),
      });
    } else if (entity is Directory) {
      entries.add({
        'type': 'directory',
        'name': entity.uri.pathSegments.last,
        'path': entity.path,
        'children': getDirectoryStructure(entity),
      });
    }
  }

  return entries;
}


/// Calculates the total size of all files in a directory structure.
int calculateTotalSize(List<Map<String, dynamic>> directoryStructure) {
  int totalSize = 0;

  for (final entry in directoryStructure) {
    if (entry['type'] == 'file') {
      totalSize += entry['size'] as int;
    } else if (entry['type'] == 'directory') {
      totalSize += calculateTotalSize(entry['children'] as List<Map<String, dynamic>>);
    }
  }

  return totalSize;
}