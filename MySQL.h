//
//  MySQL.h
//  MySQL Connector
//
//  Created by Shahrooz Alimohammadi on 07.08.17.
//  Copyright © 2017 Shahrooz Alimohammadi. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <mysql.h>

@interface MySQL : NSObject
{
    MYSQL *mysql_connection, mysql;
    MYSQL_ROW mysql_row;
    MYSQL_RES *mysql_result;
}
- (BOOL)connectTo :(NSString*)host username:(NSString*)username password:(NSString*)password database:(NSString*)database;
- (void)runQuery :(NSString*)query;
- (NSArray*)fetchResult;
- (void)close;
@end
