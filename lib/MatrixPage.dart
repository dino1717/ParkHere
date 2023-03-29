import 'package:flutter/material.dart';

class MatrixPage extends StatefulWidget {
  @override
  _MatrixPageState createState() => _MatrixPageState();
}

class _MatrixPageState extends State<MatrixPage> {
  int rows = 0;
  int columns = 0;

  List<List<String>> matrix = [];

  void _populateMatrix() {
    matrix = List.generate(
      rows,          (i) => List.generate(columns, (j) => ""),
    );

  }

  void _handleCellTap(int rowIndex, int columnIndex) async {
    final carType = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CarTypePage()),
    );
    final lotNumber = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LotNumberPage()),
    );
    // Do something with carType and lotNumber, such as updating the matrix
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrix'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter row and column values:'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Rows',
                    ),
                    onChanged: (value) {
                      setState(() {
                        rows = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Columns',
                    ),
                    onChanged: (value) {
                      setState(() {
                        columns = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: (rows > 0 && columns > 0)
                  ? () {
                _populateMatrix();
                setState(() {});
              }
                  : null,
              child: Text('Populate Matrix'),
            ),
            SizedBox(height: 16.0),
            if (matrix.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Table(
                  border: TableBorder.all(),
                  children: matrix.asMap().entries.map((entry) {
                    final rowIndex = entry.key;
                    final row = entry.value;
                    return TableRow(
                      children: row.asMap().entries.map((entry) {
                        final columnIndex = entry.key;
                        final bool cell = false;
                        // ...
                        return GestureDetector(
                          onTap: () {
                            _handleCellTap(rowIndex, columnIndex);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                String text = '';
                                return AlertDialog(
                                  title: Text('Enter text'),
                                  content: TextFormField(
                                    onChanged: (value) => text = value,
                                    decoration: InputDecoration(
                                      hintText: 'Enter text to display',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          matrix[rowIndex][columnIndex] = text;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(

                              border: Border.all(),
                              color: cell? Colors.white: Colors.greenAccent ,
                            ),
                            child: SizedBox.expand(),
                          ),
                          // ...
                        );
// ...

//                        return GestureDetector(
//                          onTap: () {
//                            _handleCellTap(rowIndex, columnIndex);
//                          },
//                          child: Container(
//                            height: 40.0,
//                            decoration: BoxDecoration(
//                              border: Border.all(),
//                              color: cell ? Colors.green : Colors.white,
//                            ),
//                            child: SizedBox.expand(),
//                          ),
//                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/*
class CarTypePage extends StatefulWidget {
  @override
  _CarTypePageState createState() => _CarTypePageState();
}

class _CarTypePageState extends State<CarTypePage> {
  String carType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Type'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );

  }
*/



class CarTypePage extends StatefulWidget {
  @override
  _CarTypePageState createState() => _CarTypePageState();
}

class _CarTypePageState extends State<CarTypePage> {
  String carType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Type'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter Car Type:'),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Car Type',
              ),
              onChanged: (value) {
                setState(() {
                  carType = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Enter Lot Number:'),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Car Type',
              ),
              onChanged: (value) {
                setState(() {
                  carType = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: (carType.isNotEmpty)
                  ? () {
                Navigator.pop(context, carType);
              }
                  : null,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';

class LotNumberPage extends StatefulWidget {
  @override
  _LotNumberPageState createState() => _LotNumberPageState();
}

class _LotNumberPageState extends State<LotNumberPage> {
  String lotNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lot Number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter Lot Number:'),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Lot Number',
              ),
              onChanged: (value) {
                setState(() {
                  lotNumber = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: (lotNumber.isNotEmpty)
                  ? () {
                Navigator.pop(context, lotNumber);
              }
                  : null,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';

class MatrixPage extends StatefulWidget {
  @override
  _MatrixPageState createState() => _MatrixPageState();
}

class _MatrixPageState extends State<MatrixPage> {
  int rows = 0;
  int columns = 0;

  List<List<bool>> matrix = [];

  void _populateMatrix() {
    matrix = List.generate(
      rows,
          (i) => List.generate(columns, (j) => true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrix'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter row and column values:'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Rows',
                    ),
                    onChanged: (value) {
                      setState(() {
                        rows = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Columns',
                    ),
                    onChanged: (value) {
                      setState(() {
                        columns = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: (rows > 0 && columns > 0)
                  ? () {
                _populateMatrix();
                setState(() {});
              }
                  : null,
              child: Text('Populate Matrix'),
            ),
            SizedBox(height: 16.0),
            if (matrix.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Table(
                  border: TableBorder.all(),
                  children: matrix.map((row) {
                    return TableRow(
                      children: row.map((cell) {
                        return Container(
                          height: 40.0,
                          color: cell ? Colors.green : Colors.white,
                          child: SizedBox.expand(),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
*/
