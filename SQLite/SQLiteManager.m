//
//  SQLiteManager.m
//  SQLite
//
//  Created by 小飞鸟 on 2018/1/17.
//  Copyright © 2018年 小飞鸟. All rights reserved.
//

#import "SQLiteManager.h"
#import <sqlite3.h>

@implementation SQLiteManager{
    
    sqlite3 * db;
    
}
/*单例*/
+(SQLiteManager*)shareManager{
    static SQLiteManager * manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager =[SQLiteManager new];
    });
    return manager;
}

/*打开数据库*/
-(void)openSqlite{
    //数据库文件存放路径
    NSString * documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES ) firstObject];
    //sqlite 数据库文件路径
    NSString * sqlitePath =[documentPath stringByAppendingPathComponent:@"Database.sqlite"];
    //打开数据库
   int result = sqlite3_open(sqlitePath.UTF8String, &db);
    if (result==SQLITE_OK) {
        //打开成功
    }
    
}
/*关闭数据库*/
-(void)closeSqlite{
    //关闭数据库
   int result = sqlite3_close(db);//返回结果
    if (result==SQLITE_OK) {
        //关闭成功
    }
}
/*创建表*/
-(void)createTable{
    
    char * error = nil;
    NSString * sqlStr =@"create table Person(id integer primary key ,name String,age integer,sex String)";
    sqlite3_exec(db, sqlStr.UTF8String, nil, nil, &error);
    //判断错误是否存在
    if (error==nil) {
        //创建表成功
    }
}
/*插入数据*/
-(void)insertIntoData{
    
    char * error = nil;
    NSString * sqlStr =@"insert into Person(name ,age ,sex) values('张辉',20,'男')";
    sqlite3_exec(db, sqlStr.UTF8String, nil, nil, &error);
    //判断错误是否存在
    if (error==nil) {
        //数据插入成功
    }
}
/*更新数据*/
-(void)updateData{
    char * error = nil;
    NSString * sqlStr =@"update Person  set name = '李四' where id = 1";
    sqlite3_exec(db, sqlStr.UTF8String, nil, nil, &error);
    //判断错误是否存在
    if (error==nil) {
        //更新数据成功
    }
    
}
/*删除数据*/
-(void)deleteData{
    
    char * error = nil;
    NSString * sqlStr =@"delete from Person where id = 1";
    sqlite3_exec(db, sqlStr.UTF8String, nil, nil, &error);
    //判断错误是否存在
    if (error==nil) {
        //更新数据成功
    }
}
/*查询数据*/
-(void)selectData{
    
        NSString * sqlStr =@"select * from Person";
    sqlite3_stmt * stmt = nil;
    sqlite3_prepare(db, sqlStr.UTF8String, -1, &stmt, nil);
    
    //单句执行
    while (sqlite3_step(stmt)== SQLITE_ROW) {
        int ID = sqlite3_column_int(stmt, 0);//ID
      const unsigned  char * name = sqlite3_column_text(stmt, 1);
        NSString * nameCol =[NSString stringWithUTF8String:(const char *)name];//Name
        int age = sqlite3_column_int(stmt, 2);//age
        NSLog(@"%d~~~%@~~~%d",ID,nameCol,age);
    }
    
    //释放
    sqlite3_finalize(stmt);
    
}


@end
