//
//  MySQL.m
//  MySQL Connector
//
//  Created by Shahrooz Alimohammadi on 07.08.17.
//  Copyright © 2017 Shahrooz Alimohammadi. All rights reserved.
//

#import "MySQL.h"

@implementation MySQL

- (id)init {
    mysql_init(&mysql);
    return self;
}

- (BOOL)connectTo :(char*)host username:(char*)username password:(char*)password database:(char*)database {
    mysql_connection = mysql_real_connect(&mysql, host, username, password, database, 0, 0, 0);
    
    if (mysql_connection == NULL) return NO;
    return YES;
}

- (void)runQuery :(char*)query {
    mysql_query(mysql_connection, query);
}

- (NSArray*)fetchResult {
    NSMutableArray *tmp = [[NSMutableArray alloc] init];
    
    mysql_result = mysql_store_result(mysql_connection);
    unsigned int count = mysql_num_fields(mysql_result);
    unsigned int i;
    MYSQL_FIELD *fields = mysql_fetch_fields(mysql_result);
    while ((mysql_row = mysql_fetch_row(mysql_result)) != NULL){
        NSMutableDictionary *tmp2 = [[NSMutableDictionary alloc] init];
        
        for (i=0; i< count; i++){
            [tmp2 setObject:[NSString stringWithFormat:@"%s", mysql_row[i]] forKey:[NSString stringWithFormat:@"%s", fields[i].name]];
        }
        [tmp addObject:tmp2];
    }
    
    return [NSArray arrayWithArray:tmp];
}

- (void)close {
    mysql_free_result(mysql_result);
    mysql_close(mysql_connection);
}

@end
