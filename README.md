# MySQLConnector
MySQL Connector for Objective-C

To use this connector first you have to download MySQL Connector from [MySQL Official Homepage](https://dev.mysql.com/downloads/connector/odbc/).

## Installing
1) Unzip **Connector/ODBC** and move the content to **/usr/local/mysql**
2) Copy **libmysqlclient.18.dylib** from **/usr/local/mysql/lib** to **/usr/local/**
3) In X-Code under **Build Settings** find **Header Search Paths** and add **/usr/local/mysql/include**
4) Find **Library Search Paths** and add **/usr/local/mysql/lib**
5) Find **Other Linker Flags** and add **-lmysqlclient -lm -lz**
6) Download **MySQL.h** and **MySQL.m** and drag them in your project.

## Importing:
```Objective-C
#import "MySQL.h"
```

## How To Use:

```Objective-C
// .h File
MySQL *mysql;

// .m File
mysql = [[MySQL alloc] init];
if ([mysql connectTo:@"SERVER" username:@"USER" password:@"PWD" database:@"DATABASE"]){

    [mysql runQuery:@"SELECT * FROM test01 LIMIT 10"];
    NSArray *result = [mysql fetchResult];
    NSLog(@"%@", result);
    [mysql close];
}
```

# Please feel free to show your support  [![](https://www.paypalobjects.com/en_US/DE/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=XA4ZN3NHPUWEL)
